/*
Copyright (c)2011 Hook L.L.C

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package com.jac.ogg
{//Package
	
	import cmodule.hookOggVorbisLib.CLibInit;
	import com.jac.ogg.adobe.audio.format.events.WAVWriterEvent;
	import com.jac.ogg.adobe.audio.format.WAVWriter;
	import com.jac.ogg.events.OggManagerEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Jake Callery
	 * Hook - http://www.byhook.com
	 * 
	 * Parts of the Decoder were sourced (with permission) from the Ogg decoder created by Branden Hall at AutomataStudios.com
	 * 
	 */
	public class OggManager extends EventDispatcher
	{//OggManager Class
	
		//Alchemy Loader object
		private var _loader:CLibInit;
		
		//Alchemy -> AS3 object (our hook to the alchemy methods)
		private var _lib:Object;
		
		//Ogg formatted bytes
		private var _encodedBytes:ByteArray;
		
		//Wav formatted bytes
		private var _wavBytes:ByteArray;
		
		//Flags to let us know if we are already busy encoding
		private var _isBusy:Boolean;
		private var _isDecoding:Boolean;
		private var _isEncoding:Boolean;
		private var _isCanceled:Boolean;
		private var _isDecoderReady:Boolean;
		private var _isEncoderReady:Boolean;

		//RAW sound data bytes from flash
		private var _decodedBytes:ByteArray;
		
		//Reference to WAVWriter instance (for encoding)
		private var _wavWriter:WAVWriter;
		
		//Settings
		private var _oggQuality:Number;
		private var _encodeLoopsPerYield:int;
		private var _oggComments:OggComments;
		private var _decodeSamplesPerLoop:int;
		
		//Vars used decoding/encoding process
		private var _oggDecodeComplete:Boolean;
		private var _data_read_size:Number;
		private var _decodeTimer:Timer;
		private var _dataPtr:Number;
		private var _audioInfo:AudioInfo;
		private var _decoderBytesRead:int;
		private var _progressNotifications:Boolean;
		
		
		
		/**
		 * This is the interface to our Alchemy based Ogg Encoder.
		 */
		public function OggManager() 
		{//OggManager
		
			//Setup the alchemy library
			_loader = new CLibInit;
			_lib = _loader.init();
			
			//Set up WAVWriter for Ogg Vorbis Encoding
			_wavWriter = new WAVWriter();
			_wavBytes = new ByteArray;
			
			//Set default busy status
			_isBusy = false;
			_isDecoding = false;
			_isEncoding = false;
			_isCanceled = false;
			_progressNotifications = true;
			
			//Init
			_encodedBytes = new ByteArray();
			_decodedBytes = new ByteArray();
			_oggDecodeComplete = false;
			
			//Setup up wav writer for flash sound -> wav conversion
			_wavWriter.numOfChannels = 2;
			_wavWriter.sampleBitRate = 16;
			_wavWriter.samplingRate = 44100;
		}//OggManager
		
		/**
		 * Sets up the decoder and grabs memory pointer from alchemy that points to where the audio data is stored in memory.
		 * This must be called before starting a decode process.  This is handled automatically unless you are using decodeOggSample()
		 * manually.
		 * @param	$oggBytes Ogg Vorbis encoded bytes that will be decoded.
		 */
		public function initDecoder($oggBytes:ByteArray):void
		{//initDecoder
			_encodedBytes = $oggBytes;
			//_dataPtr = _lib.setupDecoder(_encodedBytes, _encodedBytes.length);
			_dataPtr = _lib.setupDecoder(_encodedBytes);
			_audioInfo = new AudioInfo();
			_decoderBytesRead = 0;
			
			//Grab header
			var infoObj:Object = _lib.getHeader(_dataPtr);
			
			//Get some information about the OGG file
			_audioInfo.format = "PCM";
			_audioInfo.channels = infoObj.channels;
			_audioInfo.sampleRate = infoObj.sampleRate;
			_audioInfo.sampleMultiplier = 44100 / infoObj.sampleRate;
			_audioInfo.bitRateUpper = infoObj.bitRateUpper;
			_audioInfo.bitRateLower = infoObj.bitRateLower;
			_audioInfo.bitRateNominal = infoObj.bitRateNominal;
			_audioInfo.bitsPerSample = 16;
			_audioInfo.blockAlign = _audioInfo.channels * 2;
			
			//Setup comments that will be encoded with the ogg file.
			_oggComments = new OggComments();
			_oggComments.populateFromCommentList(infoObj.commentList as Array);
			
			//reset counts
			_decodedBytes.length = 0;
			_data_read_size = 1;
		
			_isDecoderReady = true;
		}//initDecoder
		
		/**
		 * Kicks off a decode of the $oggBytes
		 * Chunks of this are executed on a timer.
		 * 
		 * @param	$oggBytes - ogg vorbis formated bytes to decode
		 * @param	$samplesPerLoop - number of samples to decode per timer tick
		 * @param	$delayPerLoopInMS - number of milliseconds to wait before kicking off another decode loop
		 * @param   $progressNotifications - if true, the decoder notifies flash of progress, and dispatches progress events. With this enabled, it might slow down the decode a touch.
		 */
		public function decode($oggBytes:ByteArray, $samplesPerLoop:int=2048, $delayPerLoopInMS:int=33, $progressNotifications:Boolean=true):void
		{//decode
		
			//Set busy status
			_isBusy = true;
			_isDecoding = true;
			_oggDecodeComplete = false;
			
			//Save flag
			_progressNotifications = $progressNotifications;
			
			//Reset bytes
			$oggBytes.position = 0;
			
			//Setup decoder
			initDecoder($oggBytes);
			
			//Set preferences
			_decodeSamplesPerLoop = $samplesPerLoop;
			
			//Setup and start timer
			_decodeTimer = new Timer($delayPerLoopInMS);
			_decodeTimer.addEventListener(TimerEvent.TIMER, decodeOggVorbisChunk, false, 0, true);
			_decodeTimer.start();
			
			dispatchEvent(new OggManagerEvent(OggManagerEvent.DECODE_BEGIN));
		}//decode
		
		private function cancelDecode():void
		{//cancelDecode
			
			//Reset canceled flag
			_isCanceled = false;
			
			//Stop decode timers and clean up
			_decodeTimer.reset();
			_decodeTimer.removeEventListener(TimerEvent.TIMER, decodeOggVorbisChunk);
			
			//Reset busy status
			_isBusy = false;
			_isDecoding = false;
			_isDecoderReady = false;
			
			//Notify that we have canceled
			dispatchEvent(new OggManagerEvent(OggManagerEvent.DECODE_CANCEL));
		}//cancelDecode
		
		/**
		 * Decodes one set of samples.  This is generally called from the decode timer
		 * @param	e not used
		 */
		private function decodeOggVorbisChunk(e:Event=null):void
		{//decodeOggVorbisChunk
			var returnObj:Object;
			
			//check for cancel
			if (_isCanceled)
			{//done
				cancelDecode();
				return;
			}//done
			
			if (_oggDecodeComplete)
			{//done
				_decodeTimer.reset();
				_decodeTimer.removeEventListener(TimerEvent.TIMER, decodeOggVorbisChunk);
				return;
			}//done
			
			if(_data_read_size > 0)
			{//loop through all bytes
				returnObj = decodeOggSample(_dataPtr, _decodeSamplesPerLoop, _audioInfo.blockAlign, _audioInfo.sampleMultiplier);
			}//loop through all bytes
			else
			{//done
				_oggDecodeComplete = true;
				handleDecodeComplete();
				return;
			}//done
			
			if (returnObj && _progressNotifications)
			{//notify of progress
				trace("Progress: " + (returnObj.position / _encodedBytes.length));
				dispatchEvent(new OggManagerEvent(OggManagerEvent.DECODE_PROGRESS, (returnObj.position / _encodedBytes.length)));
			}//notify of progress
		}//decodeOggVorbisChunk
		
		/**
		 * Same as decodeOggSamples() execpt this is standalone, and does not modify the _decodedBytes
		 * 
		 * Decode exactly one set of samples.  This is the finest granularity offered by this wrapper for decoding.
		 * 
		 * This can be used on its own to decode small chunks.  This would be useful for decoding large files on the fly so you don't
		 * have to wait for the entire file to be decoded.  This would work well inside of a Sound SAMPLE_DATA event handler.
		 * Just be sure to call initDecoder() before using this on its own.
		 * 
		 * @param	$numSamplesPerLoop number of samples to process before Alchemy yields back to flash
		 * @param   $rawBytes a byte array where the decoded bytes are stored
		 * @return  returns object from Alchemy that contains position, length, and total_bytes_read.  This data is used for keeping track of progress
		 */
		public function getSampleData($numSamplesPerLoop:int, $rawBytes:ByteArray):Object
		{//rawBytes
			if (!_isDecoderReady)
			{//bail
				throw new Error("Decoder Not Ready! Please call initDecoder() first!");
			}//bail
			
			//Init temp objects and arrays
			var returnObj:Object;
			var temp_array:ByteArray;
			var sample_read_size:Number;
			temp_array = new ByteArray();	
			temp_array.endian = Endian.LITTLE_ENDIAN;
			var readSize:int = 0;
			
			//Call to alchemy that actually does the decode
			returnObj = _lib.getSampleData(_dataPtr, $numSamplesPerLoop * _audioInfo.blockAlign / _audioInfo.sampleMultiplier, temp_array);
			readSize = returnObj.total_bytes_read;
			temp_array.position=0
			sample_read_size = readSize/_audioInfo.blockAlign;
		
			//convert to flash sound data
			var i:uint;
			var j:uint;
			var sample:Number;
			
			//reset raw bytes
			$rawBytes.length = 0;
			
			//deinterleave -> map to proper float range -> reinterleave
			for (i = 0; i < sample_read_size; ++i) 
			{//grab samples
				if (temp_array.position == temp_array.length) { break; }
				
				if (_audioInfo.channels == 1)
				{//mono
					sample = temp_array.readShort() / 32767;
					for (j = 0; j < _audioInfo.sampleMultiplier; ++j) 
					{//grab floats
						$rawBytes.writeFloat(sample);
					}//grab floats
				}//mono
				else
				{//stereo
					//Left channel
					sample = temp_array.readShort() / 32767;
					for (j = 0; j < _audioInfo.sampleMultiplier; ++j) 
					{//get floats
						$rawBytes.writeFloat(sample);
					}//get floats
					
					//Right channel
					sample = temp_array.readShort() / 32767;
					for (j = 0; j < _audioInfo.sampleMultiplier; ++j) 
					{//get floats
						$rawBytes.writeFloat(sample);
					}//get floats
				}//stereo
			}//grab samples
			
			return returnObj;
		}//rawBytes
		
		/**
		 * Decode exactly one set of samples.  This is the finest granularity offered by this wrapper for decoding.
		 * 
		 * This can be used on its own to decode small chunks.  This would be useful for decoding large files on the fly so you don't
		 * have to wait for the entire file to be decoded.  This would work well inside of a Sound SAMPLE_DATA event handler.
		 * Just be sure to call initDecoder() before using this on its own.
		 * 
		 * @param	$dataPtr memory address of the audio data in Alchemy
		 * @param	$numSamplesPerLoop number of samples to process before Alchemy yields back to flash
		 * @param	$blockAlign Set from AudioInfo
		 * @param	$sampleMultiplier Set from AudioInfo
		 * @return  returns object from Alchemy that contains position, length, and total_bytes_read.  This data is used for keeping track of progress
		 */
		public function decodeOggSample($dataPtr:Number, $numSamplesPerLoop:int, $blockAlign:Number, $sampleMultiplier:Number):Object
		{//decodeOggSample
			if (!_isDecoderReady)
			{//bail
				throw new Error("Decoder Not Ready! Please call initDecoder() first!");
			}//bail
			
			//Init temp objects and arrays
			var returnObj:Object;
			var temp_array:ByteArray;
			var sample_read_size:Number;
			temp_array = new ByteArray();	
			temp_array.endian = Endian.LITTLE_ENDIAN;
			
			//Call to alchemy that actually does the decode
			returnObj = _lib.getSampleData($dataPtr, $numSamplesPerLoop * $blockAlign / $sampleMultiplier, temp_array);
			_data_read_size = returnObj.total_bytes_read;
			temp_array.position=0
			sample_read_size = _data_read_size/_audioInfo.blockAlign;
		
			//convert to flash sound data
			var i:uint;
			var j:uint;
			var sample:Number;
			
			returnObj.newBytesPosition = _decodedBytes.length;
			returnObj.bytes = new ByteArray();
			
			//deinterleave -> map to proper float range -> reinterleave
			for (i = 0; i < sample_read_size; ++i) 
			{//grab samples
				if (temp_array.position == temp_array.length) { break; }
				
				if (_audioInfo.channels == 1)
				{//mono
					sample = temp_array.readShort() / 32767;
					for (j = 0; j < _audioInfo.sampleMultiplier; ++j) 
					{//grab floats
						_decodedBytes.writeFloat(sample);
						returnObj.bytes.writeFloat(sample);
					}//grab floats
				}//mono
				else
				{//stereo
					//Left channel
					sample = temp_array.readShort() / 32767;
					for (j = 0; j < _audioInfo.sampleMultiplier; ++j) 
					{//get floats
						_decodedBytes.writeFloat(sample);
						returnObj.bytes.writeFloat(sample);
					}//get floats
					
					//Right channel
					sample = temp_array.readShort() / 32767;
					for (j = 0; j < _audioInfo.sampleMultiplier; ++j) 
					{//get floats
						_decodedBytes.writeFloat(sample);
						returnObj.bytes.writeFloat(sample);
					}//get floats
				}//stereo
			}//grab samples
			
			return returnObj;
		}//decodeOggSample
		
		/**
		 * Called when the decode is finished.
		 * Dispatches OggManagerEvent.DECODE_COMPLETE
		 */
		private function handleDecodeComplete():void
		{//handleDecodeComplete
			trace("Ogg Decode Complete: " + _decodedBytes.length);
			
			_isBusy = false;
			_isDecoding = false;
			_isDecoderReady = false;
			
			//Notify that the encode has finished
			dispatchEvent(new OggManagerEvent(OggManagerEvent.DECODE_COMPLETE, _decodedBytes));
			
		}//handleDecodeComplete
		
		/**
		 * This method actually does the encoding.  Before calling this method, it is suggested
		 * that you set up listeners for OggManagerEvent.ENCODE_PROGRESS as well as OggManagerEvent.ENCODE_COMPLETE
		 * The first thing this does, is do a conversion to WAV.  When that is finished, the actuall ogg vorbis encoding starts.
		 * 
		 * @param	$wavBytes 44.1kHz, 16bit, 2 Channel wav formatted bytes
		 * @param	$oggComments Value Object that holds the comment tags we want saved with the Ogg file.
		 * @param   $oggQuality Value can be from -0.1 to 1.0.  Bigger numbers bigger files better quality.
		 * @param   $wavLoopsPerYield Number of wav chunks processed before control is given back to Flash.  Higher numbers slow down flash, but speed up encoding.
		 * @param   $vorbisLoopsPerYield Number of pages processed before control is given back to Flash.  Higher numbers slow down flash, but speed up encoding.
		 * @param   $progressNotifications set true to get progress events during the encode.  This may slow down the encode slightly.
		 */
		public function encode($rawBytes:ByteArray, $oggComments:OggComments=null, $oggQuality:Number=0.5, $wavLoopsPerYield:int=10, $vorbisLoopsPerYield:int=1, $progressNotifications:Boolean=true):void
		{//encode
			if (!_isBusy)
			{//start
			
				//Save settings
				_oggQuality = $oggQuality;
				
				//Let everyone know we are busy encoding
				_isBusy = true;
				_isEncoding = true;
				_progressNotifications = $progressNotifications;
				_encodeLoopsPerYield = $vorbisLoopsPerYield;
				
				if ($oggComments == null)
				{//make new
					$oggComments = new OggComments();
				}//make new
				else
				{//use provided
					_oggComments = $oggComments;
				}//use provided
				
				trace("Starting Wav Encode");
				//Use modified WAVWriter for async wav encoding
				_wavBytes.length = 0;
				$rawBytes.position = 0;
				_wavWriter.addEventListener(WAVWriterEvent.ENCODE_COMPLETE, handleWavEncodeComplete, false, 0, true);
				_wavWriter.addEventListener(WAVWriterEvent.ENCODE_CANCEL, handleWavEncodeCancel, false, 0, true);
				_wavWriter.addEventListener(WAVWriterEvent.ENCODE_PROGRESS, handleWavEncodeProgress, false, 0, true);
				_wavWriter.processSamplesAsync(_wavBytes, $rawBytes, 44100, 2, $wavLoopsPerYield, _progressNotifications);
				dispatchEvent(new OggManagerEvent(OggManagerEvent.WAV_ENCODE_BEGIN));
			}//start
			else
			{//BUSY !
				trace("Can't start a new enocode, one is already running!");
			}//BUSY!
		}//encode
		
		private function handleWavEncodeProgress(e:WAVWriterEvent):void 
		{//handleWavEncodeProgress
			dispatchEvent(new OggManagerEvent(OggManagerEvent.WAV_ENCODE_PROGRESS, e.data));
		}//handleWavEncodeProgress
		
		private function handleWavEncodeCancel(e:WAVWriterEvent):void 
		{//handleWavEncodeCancel
			trace("Wav Encode Canceled");
			
			//reset state flags
			_isBusy = false;
			_isEncoding = false;
			
			//notify of cancel
			dispatchEvent(new OggManagerEvent(OggManagerEvent.WAV_ENCODE_CANCEL));
			dispatchEvent(new OggManagerEvent(OggManagerEvent.ENCODE_CANCEL));
		}//handleWavEncodeCancel
		
		/**
		 * Called when wav encoding has completed.  This chains to start the ogg Encoding process with encodeToOgg()
		 * @param	e not used
		 */
		private function handleWavEncodeComplete(e:WAVWriterEvent=null):void
		{//handleWavEncodeComplete
			trace("Wav Encode Complete");
			dispatchEvent(new OggManagerEvent(OggManagerEvent.WAV_ENCODE_COMPLETE));
			encodeToOgg(_wavBytes, _oggComments);
		}//handleWavEncodeComplete
		
		/**
		 * Kicks off the async encoding process in Alchemy
		 * @param	$wavBytes wav formatted bytes
		 * @param	$oggComments comments/tags object to encode with the file
		 */
		private function encodeToOgg($wavBytes:ByteArray, $oggComments:OggComments):void
		{//encodeToOgg
		
			//Set up reciptical for ogg encoded bytes
			_encodedBytes = new ByteArray();
			_encodedBytes.endian = Endian.LITTLE_ENDIAN;
			
			/***************
			 * This is the actual call the the Alchemy Ogg Encoder.
			 * Parameters:
			 * 
			 * encodeComplete: 
			 * method called when encoding is complete
			 * 
			 * this: 
			 * the object passed in here is required to have a method called handleProgress.
			 * when there is progress, the method is called with the number of bytes read from the wav 
			 * ByteArray, and the length of the wav ByteArray is passed to it.
			 * (see below for implementation)
			 * 
			 * _wavBytes: 
			 * the 44.1kHz, 16Bit, 2 Channel wav encoded bytes (ByteArray)
			 * 
			 * _encodedBytes: 
			 * a ByteArray to store the Ogg encoded bytes in.
			 * 
			 * _oggQuality: 
			 * quality setting for Ogg (valid range is -0.1 to 1)
			 * 
			 * _encodeLoopsPerYield: 
			 * number of ogg pages before yielding back to flash player 
			 * (low numbers - flash player stays faster, high numbers - encoding faster)  
			 * 
			 * $oggComments: 
			 * this is the comment value object for filling in the comment tags for the Ogg file.
			 * 
			 * _progressNotifications:
			 * tells alchemy to notify flash on progress.  Might be slightly slower if enabled.
			 ***********/
			trace("Starting Ogg Encode");
			_wavBytes.position = 0;
			_encodedBytes.length = 0;
			
			_lib.startAsyncEncode(encodeComplete, this, _wavBytes, _encodedBytes, _oggQuality, _encodeLoopsPerYield, $oggComments, int(_progressNotifications));
			
			dispatchEvent(new OggManagerEvent(OggManagerEvent.ENCODE_BEGIN));
			
		}//encodeToOgg
		
		/**
		 * Called from the Alchemy object when the encoding has finished
		 * @param	$encodedBytes
		 */
		private function encodeComplete($encodedBytes:ByteArray):void
		{//encodeComplete
			trace("Encode Complete: " + $encodedBytes.length);
			
			//Set busy status
			_isBusy = false;
			_isEncoding = false;
			
			//Notify that the encode has finished
			dispatchEvent(new OggManagerEvent(OggManagerEvent.ENCODE_COMPLETE, $encodedBytes));
			
		}//encodeComplete
		
		/**
		 * Called from the Alchemy object when progress has been made on the encode.
		 * bytesRead (int) and length (int) are passed directly to it from alchemy.
		 * @param	$bytesRead number of bytes read so far during the encode
		 * @param	$length	total number of bytes that will be read to be decoded
		 */
		public function handleProgress($bytesRead:int, $length:int):void
		{//handleProgress
			trace("PROGRESS: " + $bytesRead + " / " + $length + " = " + ($bytesRead / $length));
			
			dispatchEvent(new OggManagerEvent(OggManagerEvent.ENCODE_PROGRESS, ($bytesRead / $length)));
			
		}//handleProgress
		
		/**
		 * Called from Alchemy when the encoding process has been canceled.
		 * @param	$obj not used
		 */
		public function handleEncodeCanceled($obj:Object):void
		{//handleEncodeCanceled
			trace("Caught Encode Cancel");
			_isEncoding = false;
			_isBusy = false;
			dispatchEvent(new OggManagerEvent(OggManagerEvent.ENCODE_CANCEL));
		}//handleEncodeCanceled
		
		/**
		 * Called from Alchemy to check to see if it should cancel the encoding process.
		 * @param	$obj not used
		 * @return  1 if it should cancel, 0 if not.
		 */
		public function checkEncodeIsCanceled($obj:Object):int
		{//checkEncodeIsCanceled
			if (_isCanceled)
			{//done
				_isCanceled = false;
				_isBusy = false;
				_isEncoding = false;
				return 1;
			}//done
			else
			{//not done
				return 0;
			}//not done
		}//checkEncodeIsCanceled
		
		/**
		 * Tells the OggManager to cancel the current operation.  When the cancel has completed, the corresponding event will be dispatched.
		 * OggManagerEvent.ENCODE_CANCEL or OggManagerEvent.DECODE_CANCEL
		 */
		public function cancel():void
		{//cancel
			_isCanceled = true;
			if (_wavWriter.isBusy)
			{//cancel wav encoding
				_wavWriter.cancelEncode();
			}//cancel wav encoding
		}//cancel
		
		/**
		 * Return full version info
		 */
		public function get oggLibVersionInfo():OggLibVersionInfo
		{//get oggLibVersionInfo
			return new OggLibVersionInfo(_lib);
		}//get oggLibVersionInfo
		
		
		public function get encodedBytes():ByteArray { return _encodedBytes; }
		public function get wavBytes():ByteArray { return _wavBytes; }
		public function get isBusy():Boolean { return _isBusy; }
		public function get decodedBytes():ByteArray { return _decodedBytes; }
		public function get isDecoding():Boolean { return _isDecoding; }
		public function get isEncoding():Boolean { return _isEncoding; }
		public function get oggComments():OggComments { return _oggComments; }
		public function get progressNotifications():Boolean { return _progressNotifications; }
		public function set progressNotifications(value:Boolean):void 
		{
			_progressNotifications = value;
		}
		public function get audioInfo():AudioInfo { return _audioInfo; }
		public function get data_read_size():Number { return _data_read_size; }
		public function get dataPtr():Number { return _dataPtr; }
		
	}//OggManager Class

}//Package