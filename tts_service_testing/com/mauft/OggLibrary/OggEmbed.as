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

OggEmbed - Used to play Ogg files embeded into SWF.
		   WARNING! Because Flash does not support binary embeeding, this class can
		   only be used with Flex Builder!

Examplary usage:

[Embed(source="c:/TestAudio.ogg",mimeType="application/octet-stream")] private var OGG_FILE:Class	//Embed Ogg file as binary stream
var embedTest:OggEmbed=new OggEmbed((new OGG_FILE) as ByteArray)	//Create new instance of OggEmbed

embedTest.play(100)		//Play the file and loop it 100 times (use 0 for no looping)
						//If the same instance is already playing then it will stop first

embedTest.stop()		//Stop playback of the file
			 
Check Readme for further usage instructions!
------------------------------------------------------------------------------------*/

package com.mauft.OggLibrary{
	import cmodule.oggvorbis.CLibInit;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	public class OggEmbed extends EventDispatcher{
		private var _decoder:*
		private var _sound:Sound
		private var _sound_id:uint
		private var _sound_channel:SoundChannel
		private var _audio_byte_array:ByteArray
		private var _audio_info:OggInfo
		private var _data_read_size:Number
		private var _sample_read_size:Number
		private var _temp_byte_array:ByteArray
		private var _loops:uint=0
		public function OggEmbed(_byte_array:ByteArray){
			if (!_byte_array){new Error("Invalid Byte Array");return;}
			
			_audio_byte_array=_byte_array
		}
		private function init():void{
			_decoder=null
			var clib:CLibInit=new CLibInit
			_decoder=clib.init()

			_sound=new Sound
			_sound_id=_decoder.setupDecoder(_audio_byte_array,_audio_byte_array.length)
			_audio_info=OggDecoder.getHeaders(_sound_id,_decoder)
		}
		public function play(loops:int=0):void{
			if (_sound_channel){stop()}
			if (loops>=0){
				_loops=loops
			}
			init()
			_sound.addEventListener(SampleDataEvent.SAMPLE_DATA, onSamplesRequest);
			_sound_channel=_sound.play()
		}
		public function stop():void{
			if (!_sound_channel){return}
			_sound.removeEventListener(SampleDataEvent.SAMPLE_DATA, onSamplesRequest)
			_sound_channel=null
		}
		public function seek(time:Number):void{
			_decoder.seek(_sound_id,time)
		}
		public function getLength():Number{
			return _decoder.getLength(_sound_id) 
		}
		public function get position():Number{
			return _decoder.getPosition(_sound_id)
		}
		private function onSamplesRequest(e:SampleDataEvent):void{
			_temp_byte_array=new ByteArray
			_temp_byte_array.endian = Endian.LITTLE_ENDIAN

			_data_read_size=_decoder.getSampleData(_sound_id, OggDecoder._num_of_samples*_audio_info.blockAlign/_audio_info.sampleMultiplier, _temp_byte_array)
			_temp_byte_array.position=0

			if (_data_read_size==-1){
				if (_loops>0){
					_loops--
					play(-1)
					return
				} else {
					stop()
					dispatchEvent(new Event(Event.SOUND_COMPLETE))
					return
				}
			}
			
			_sample_read_size = _data_read_size/_audio_info.blockAlign;
			
			if (_audio_info.channels==1){			//Convert the decoder's output to Flash friendly audio output
				OggDecoder.convertMono(e, _sample_read_size, _temp_byte_array, _audio_info)			
			} else {
				OggDecoder.convertStereo(e, _sample_read_size, _temp_byte_array, _audio_info)
			}
			
			var i:uint;
			var j:uint;
			
			//Fill the empty space with zeroes if needed.
			for (i=_sample_read_size*_audio_info.sampleMultiplier; i<OggDecoder._num_of_samples; ++i) {
				e.data.writeFloat(0);
				e.data.writeFloat(0);
			}
		}
	}
}