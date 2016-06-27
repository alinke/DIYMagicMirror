/*
  Copyright (c) 2009, Adobe Systems Incorporated
  All rights reserved.

  Redistribution and use in source and binary forms, with or without 
  modification, are permitted provided that the following conditions are
  met:

  * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
  
  * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the 
    documentation and/or other materials provided with the distribution.
  
  * Neither the name of Adobe Systems Incorporated nor the names of its 
    contributors may be used to endorse or promote products derived from 
    this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  
  Modified by Jake Callery (jake@byhook.com) to async the processSamples functions
*/


package com.jac.ogg.adobe.audio.format
{
	import com.jac.ogg.adobe.audio.format.events.WAVWriterEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.IDataOutput;
	import flash.utils.Timer;
	

/**
 * 	Helper class to write WAV formated audio files.  The class
 *  expects audio input data in a byte array with samples represented
 *  as floats.  
 * 
 *  <p>The default compressed code is set to PCM.  The class
 *  resamples and formats the audio samples according to the 
 *  class properties.  The resampling geared for performance and
 *  not quality, for best quality use sampling rates that divide/multiple
 *  into the desired output <code>samplingRate</code>.
 * 
 * 	For more information about the WAVE file format see:
 * 	http://ccrma.stanford.edu/courses/422/projects/WaveFormat/</p>
 * 
 * 	TODO Get WAV's for testing
 *  
 * 	@langversion ActionScript 3.0
 * 	@playerversion Flash 10.0 
 */
public class WAVWriter extends EventDispatcher
{
	
	//-------------------------------------------------------------------
	// Variables
	//-------------------------------------------------------------------

	/**
	 * 	@private
	 *  Used for resampling channels where input channels > output channels
	 */
	private var tempValueSum:Number = 0;
	/**
	 * 	@private
	 *  Used for resampling channels where input channels > output channels
	 */
	private var tempValueCount:int = 0;
	
	//-------------------------------------------------------------------
	// Properties
	//-------------------------------------------------------------------
	
	/**
	 * 	The sampling rate, in Hz, for the data in the WAV file.
	 * 
	 * 	@default 44100
	 */
	public var samplingRate:Number = 44100;
	
	/**
	 * 	The audio sample bit rate.  Has to be set to 8, 16, 24, or 32.
	 * 
	 * 	@default 16
	 */		
	public var sampleBitRate:int = 16; // ie: 16 bit wav file
	
	/**
	 * 	The number of audio channels in the WAV file.
	 * 
	 * 	@default 2
	 */	
	public var numOfChannels:int = 2;
	
	/**
	 * 	The WAV header compression code value.  The default is the PCM 
	 *  code.
	 * 
	 * 	@default 1 
	 */	
	public var compressionCode:int = 1;
	
	//Added by Jake Callery (jake@byhook.com)
	//Supports async encoding
	private var _chunkTimer:Timer;
	private var _dataInput:ByteArray;
	private var _dataOutput:IDataOutput;
	private var _tempData:ByteArray;
	private var _bitResolution:Number;
	private var _soundRate:Number;
	private var _dataByteLength:int;
	private var _inputNumChannels:int;
	private var _completeCallback:Function;
	private var _isCanceled:Boolean=false;
	private var _isBusy:Boolean=false;
	private var _notifyOfProgress:Boolean;
	private var _loopsPerChunk:int;
	
	//-------------------------------------------------------------------
	// Methods
	//-------------------------------------------------------------------
	
	/**
	 * 	@private
	 * 	Create WAV header bytes
	 */
	private function header(dataOutput:IDataOutput, fileSize:Number):void
	{
		dataOutput.writeUTFBytes("RIFF");
		dataOutput.writeUnsignedInt(fileSize); // Size of whole file
		dataOutput.writeUTFBytes("WAVE");
		// WAVE Chunk
		dataOutput.writeUTFBytes("fmt ");	// Chunk ID
		dataOutput.writeUnsignedInt(16);	// Header Chunk Data Size
		dataOutput.writeShort(compressionCode); // Compression code - 1 = PCM
		dataOutput.writeShort(numOfChannels); // Number of channels
		dataOutput.writeUnsignedInt(samplingRate); // Sample rate
		dataOutput.writeUnsignedInt(samplingRate * numOfChannels * sampleBitRate / 8); // Byte Rate == SampleRate * NumChannels * BitsPerSample/8		
		dataOutput.writeShort(numOfChannels * sampleBitRate / 8); // Block align == NumChannels * BitsPerSample/8
		dataOutput.writeShort(sampleBitRate); // Bits Per Sample
	}
	
	/**
	 * 	Resample the <code>dataInput</code> audio data into the WAV format.
	 *  Writing the output to the <code>dataOutput</code> object.
	 * 
	 *  <p>This has been added to allow for processing to be done in Async 
	 * 
	 * 	<p>The <code>dataOutput.endian</code> will be set to <code>Endian.LITTLE_ENDIAN</code>
	 *  with the header and data written out on the data stream. The <code>dataInput</code>
	 *  will set the position = 0 and read all bytes in the <code>ByteArray</code> as samples.
	 * 
	 * 	
	 *  </p>
	 * 
	 * 	@param dataOutput The IDataOutput object that you want the WAV formated bytes to be written to.
	 *  @param dataInput 	The audio sample data in float format.
	 * 	@param inputSamplingRate The sampling rate of the <code>dataInput</code> data.
	 *  @param inputNumChannels	The number of audio changes in <code>dataInput</code> data.
	 *  @param callback Is called just before the Event.COMPLETE is fired, if specified.  If null, only the Event.COMPLETE is fired.
	 */
	public function processSamplesAsync(dataOutput:IDataOutput, dataInput:ByteArray, inputSamplingRate:int, inputNumChannels:int = 1, loopsPerChunk:int=10, notifyOfProgress:Boolean=true, callBack:Function=null):void
	{//processSamplesAsync
		if (!dataInput || dataInput.bytesAvailable <= 0) // Return if null
			throw new Error("No audio data");
		
		_completeCallback = callBack;
		_inputNumChannels = inputNumChannels;
		_dataOutput = dataOutput;
		_dataInput = dataInput;
		_notifyOfProgress = notifyOfProgress;
		_loopsPerChunk = loopsPerChunk
		
		// 16 bit values are between -32768 to 32767.
		_bitResolution = (Math.pow(2, sampleBitRate)/2)-1;
		_soundRate = samplingRate / inputSamplingRate;
		_dataByteLength = ((dataInput.length/4) * _soundRate * sampleBitRate/8);
		// data.length is in 4 bytes per float, where we want samples * sampleBitRate/8 for bytes
		var fileSize:int = 32 + 8 + _dataByteLength;
		// WAV format requires little-endian
		_dataOutput.endian = Endian.LITTLE_ENDIAN;  
		// RIFF WAVE Header Information
		header(_dataOutput, fileSize);
		// Data Chunk Header
		_dataOutput.writeUTFBytes("data");
		_dataOutput.writeUnsignedInt(_dataByteLength); // Size of whole file
		
		//Setup byte array
		_dataInput.position = 0;
		_tempData = new ByteArray();
		_tempData.endian = Endian.LITTLE_ENDIAN;
		
		_isBusy = true;
		
		_chunkTimer = new Timer(33);
		_chunkTimer.addEventListener(TimerEvent.TIMER, processChunk, false, 0, true);
		_chunkTimer.start();
		
	}//processSamplesAsync
	
	public function processSamples(dataOutput:IDataOutput, dataInput:ByteArray, inputSamplingRate:int, inputNumChannels:int = 1):void
	{//processSamples
		if (!dataInput || dataInput.bytesAvailable <= 0) // Return if null
			throw new Error("No audio data");
		
		_inputNumChannels = inputNumChannels;
		_dataOutput = dataOutput;
		_dataInput = dataInput;
		
		// 16 bit values are between -32768 to 32767.
		_bitResolution = (Math.pow(2, sampleBitRate)/2)-1;
		_soundRate = samplingRate / inputSamplingRate;
		_dataByteLength = ((dataInput.length/4) * _soundRate * sampleBitRate/8);
		
		// data.length is in 4 bytes per float, where we want samples * sampleBitRate/8 for bytes
		var fileSize:int = 32 + 8 + _dataByteLength;
		
		// WAV format requires little-endian
		_dataOutput.endian = Endian.LITTLE_ENDIAN;  
		
		// RIFF WAVE Header Information
		header(_dataOutput, fileSize);
		// Data Chunk Header
		_dataOutput.writeUTFBytes("data");
		_dataOutput.writeUnsignedInt(_dataByteLength); // Size of whole file
		
		// Write data to file
		_dataInput.position = 0;
		_tempData = new ByteArray();
		_tempData.endian = Endian.LITTLE_ENDIAN;
		
		while (_dataInput.bytesAvailable > 0)
		{//process
			processSample();
		}//process
		
	}//processSamples
	
	/**
	 * Processes a set number of samples of the data.  This is called over and over again until all data has been processed.
	 * 
	 * @param	e passed in from the timer event. e is not used in the method
	 */
	private function processChunk(e:Event=null):void
	{//processChunk
		
		var loopCount:int = 0;
		
		if (_isCanceled)
		{//stop encoding
			
			trace("Wav encode canceled");
			_chunkTimer.reset();
			_chunkTimer.removeEventListener(TimerEvent.TIMER, processChunk);
			
			_isCanceled = false;
			dispatchEvent(new WAVWriterEvent(WAVWriterEvent.ENCODE_COMPLETE));
			
			_isBusy = false;
			
			return;
		}//stop encoding
		
		// Write to byte array in chunks of converted data.
		while (_dataInput.bytesAvailable > 0 && loopCount < _loopsPerChunk) 
		{//process some samples
			processSample();
			loopCount++;
		}//process some samples
		
		if (_notifyOfProgress)
		{//notify
			dispatchEvent(new WAVWriterEvent(WAVWriterEvent.ENCODE_PROGRESS, (_dataInput.position / _dataInput.length)));
		}//notify
		
		if (_dataInput.bytesAvailable <= 0)
		{//done
			trace("Wav encode complete");
			_chunkTimer.reset();
			_chunkTimer.removeEventListener(TimerEvent.TIMER, processChunk);
			
			if (_completeCallback != null)
			{//callback
				_completeCallback();
			}//callback
			
			_isBusy = false;
			
			dispatchEvent(new WAVWriterEvent(WAVWriterEvent.ENCODE_COMPLETE));
			
		}//done
	}//processChunk
	
	/**
	 * Processes one sample of the data.
	 */
	private function processSample():void
	{//processSample
		_tempData.clear();
		
		// Resampling logic variables
		var minSamples:int = Math.min(_dataInput.bytesAvailable/4, 8192);
		var readSampleLength:int = minSamples;//Math.floor(minSamples/soundRate);
		var resampleFrequency:int = 100;  // Every X frames drop or add frames
		var resampleFrequencyCheck:int = (_soundRate-Math.floor(_soundRate))*resampleFrequency;
		var soundRateCeil:int = Math.ceil(_soundRate);
		var soundRateFloor:int = Math.floor(_soundRate);
		var jlen:int = 0;
		var channelCount:int = (numOfChannels-_inputNumChannels);
		/*
		trace("resampleFrequency: " + resampleFrequency + " resampleFrequencyCheck: " + resampleFrequencyCheck
			+ " soundRateCeil: " + soundRateCeil + " soundRateFloor: " + soundRateFloor);
		*/
		var value:Number = 0;
		// Assumes data is in samples of float value
		for (var i:int = 0;i < readSampleLength;i+=4)
		{
			value = _dataInput.readFloat();
			/////////// Hack Cap (odd rounding issue) \\\\\\\\\\\\\
			//Was getting values like -1.00000000031 (or something similar)
			//not quite -1, but very very close
			if (value > 1)
			{//cap
				value = 1;
			}//cap
			else if (value < -1)
			{//cap
				value = -1;	
			}//cap
			///////////////////////////////////////////////////////
			
			// Special case with 8bit WAV files
			if (sampleBitRate == 8)
				value = (_bitResolution * value) + _bitResolution;
			else
				value = _bitResolution * value;
			
			// Resampling Logic for non-integer sampling rate conversions
			jlen = (resampleFrequencyCheck > 0 && i % resampleFrequency < resampleFrequencyCheck) ? soundRateCeil : soundRateFloor; 
			for (var j:int = 0; j < jlen; j++)
			{
				writeCorrectBits(_tempData, value, channelCount);
			}
		}
		
		_dataOutput.writeBytes(_tempData);
	}//processSample
	
	/**
	 * 	@private
	 * 	Change the audio sample to the write resolution
	 */
	private function writeCorrectBits(outputData:ByteArray, value:Number, channels:int):void
	{
		// Handle case where input channels > output channels.  Sum values and divide values
		if (channels < 0)
		{
			if (tempValueCount+channels == 1)
			{
				value = int(tempValueSum/tempValueCount);
				tempValueSum = 0;
				tempValueCount = 0;
				channels = 1;
			}
			else
			{
				tempValueSum += value;
				tempValueCount++;
				return;
			}
		}
		else
		{
			channels++;
		}
		// Now write data according to channels
		for (var i:int = 0;i < channels; i++) 
		{
			if (sampleBitRate == 8)
				outputData.writeByte(value);
			else if (sampleBitRate == 16)
				outputData.writeShort(value);
			else if (sampleBitRate == 24)
			{
				outputData.writeByte(value & 0xFF);
				outputData.writeByte(value >>> 8 & 0xFF); 
				outputData.writeByte(value >>> 16 & 0xFF);
			}
			else if (sampleBitRate == 32)
				outputData.writeInt(value);
			else
				throw new Error("Sample bit rate not supported");
		}
	}
	
	public function cancelEncode():void
	{//cancel
		isCanceled = true;
	}//cancel
	
	public function get isCanceled():Boolean { return _isCanceled; }
	public function set isCanceled(value:Boolean):void 
	{
		_isCanceled = value;
	}
	public function get isBusy():Boolean { return _isBusy; }

}
}