/*------------------------------------------------------------------------------------
Frontend for:
Adobe Alchemy OGG Vorbis library

by:
Maurycy Zarzycki
http://mauft.com
For questions and concerns: skell@tlen.pl
April 2009

Frontend for Alchemy OGG Vorbis V. 1.00

Parts of the code were created by Adobe Staff.

OggDecoder - Internal class holding common variables and function for OggRadio,
			 OggStream and OggEmbed ONLY!
			 Is not to be used.
			 
Check Readme for further usage instructions!
------------------------------------------------------------------------------------*/


package com.mauft.OggLibrary{
	//import cmodule.oggvorbis.CLibInit;
	
	import flash.events.SampleDataEvent;
	import flash.utils.ByteArray;
	internal class OggDecoder{
		internal static const _num_of_samples:Number=4096		//Constant specifying how much audio data to decode per call
		internal static const _buffer_size:Number=8192
		public function OggDecoder(){}
		internal static function getHeaders(id:uint, decoder:*):OggInfo{
			var infoObj:Object = decoder.getHeader(id);	//Get some information about the OGG file
			var _audio_info:OggInfo=new OggInfo
			_audio_info.format = "PCM";
			_audio_info.channels = infoObj.channels;
			_audio_info.sampleRate = infoObj.sampleRate;
			_audio_info.sampleMultiplier = 44100 / infoObj.sampleRate;
			_audio_info.bitRateUpper = infoObj.bitRateUpper;
			_audio_info.bitRateLower = infoObj.bitRateLower; 
			_audio_info.bitRateNominal = infoObj.bitRateNominal;
			_audio_info.bitsPerSample = 16;
			_audio_info.blockAlign = _audio_info.channels * 2;
			_audio_info.finish()
			return _audio_info
		}
		internal static function convertMono(event:SampleDataEvent, sample_read_size:Number, temp_array:ByteArray, audio_info:OggInfo):void{
			var i:uint;
			var j:uint;
			var sample:Number;
			for (i=0; i<sample_read_size; ++i) {
				if (temp_array.position==temp_array.length){break}
				sample = temp_array.readShort() / 32767;
				for (j=0; j<audio_info.sampleMultiplier; ++j) {
					event.data.writeFloat(sample);
					event.data.writeFloat(sample);
				}
			}
			
		}
		internal static function convertStereo(event:SampleDataEvent, sample_read_size:Number, temp_array:ByteArray, audio_info:OggInfo):void{
			var i:uint;
			var j:uint;
			var sample:Number;
			
			for (i=0; i<sample_read_size; ++i) {
				sample = temp_array.readShort() / 32767;
				for (j=0; j< audio_info.sampleMultiplier; ++j) {
					event.data.writeFloat(sample);
				}
				
				sample = temp_array.readShort() / 32767;
				for (j=0; j< audio_info.sampleMultiplier; ++j) {
					event.data.writeFloat(sample);
				}
			}
		}
	}
}