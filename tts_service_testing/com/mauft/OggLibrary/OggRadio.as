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

OggRadio - Used to play internet Ogg radios.

Examplary usage:

var radioTest:OggRadio=new OggRadio("http://www.foo.be:8000/cthulhu303.ogg")	//Open the radio and start streaming

radioTest.play()		//Play the radio

radioTest.stop()		//Stop playback of the file

In order to retrieve the server address and port, you have to download the .m3u or /pla file and open
it with Notepad or other text editor.
			 
Check Readme for further usage instructions!
------------------------------------------------------------------------------------*/

package com.mauft.OggLibrary{
	import cmodule.oggvorbis.CLibInit;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	public class OggRadio extends EventDispatcher{
		private var _decoder:*
		private var _sound:Sound
		private var _sound_id:int
		private var _sound_channel:SoundChannel
		private var _audio_byte_array:ByteArray
		private var _audio_info:OggInfo
		private var _data_read_size:Number
		private var _sample_read_size:Number
		private var _temp_byte_array:ByteArray
		private var _stream:URLStream=new URLStream()
		private var _url:String
		private var _initialized:Boolean=false
		private static var plays:uint=0
		public function OggRadio(url:String){			
			_audio_byte_array=new ByteArray
			
			_url=url
			_stream.addEventListener(ProgressEvent.PROGRESS,onDataProgress)
			_stream.load(new URLRequest(_url))
		}
		// added
		public function setVolume(newVolume:Number) : void
		{
			var st:SoundTransform = null;
			st = new SoundTransform(newVolume, 0);
			st.volume = newVolume;
			this._sound_channel.soundTransform = st;
			return;
		}
		private function init():void{
			_decoder=null
			_sound=new Sound
			var clib:CLibInit=new CLibInit
			_decoder=clib.init()
			_initialized=false
			if (_audio_byte_array.bytesAvailable >= OggDecoder._buffer_size) {
				setupDecoder()
			}
		}
		private function setupDecoder():void{
			
			_sound_id=_decoder.setupDecoder(_audio_byte_array, 1206662400)
			_audio_info=OggDecoder.getHeaders(_sound_id,_decoder)
			_initialized=true
		}
		public function play():void{
			if (_sound_channel){stop()}
			init()
			_sound.addEventListener(SampleDataEvent.SAMPLE_DATA, onSamplesRequest);
			_sound_channel=_sound.play()
		}
		public function stop():void{
			if (!_sound_channel){return}
			_sound.removeEventListener(SampleDataEvent.SAMPLE_DATA, onSamplesRequest)
			_sound_channel=null
		} 
		private function onSamplesRequest(e:SampleDataEvent):void{
			trace(_decoder.getPosition(_sound_id))
			var i:uint
			var j:uint;
			if (_initialized){
				_temp_byte_array=new ByteArray
				_temp_byte_array.endian = Endian.LITTLE_ENDIAN
				
				_data_read_size = _decoder.getSampleData(_sound_id, OggDecoder._num_of_samples*_audio_info.blockAlign/_audio_info.sampleMultiplier, _temp_byte_array)
				_temp_byte_array.position=0
				
				if (_data_read_size==-1){
					stop()
					dispatchEvent(new Event(Event.SOUND_COMPLETE))
					return
				}
				
	
				_sample_read_size = _data_read_size/_audio_info.blockAlign;
				
				if (_audio_info.channels==1){			//Convert the decoder's output to Flash friendly audio output
					OggDecoder.convertMono(e, _sample_read_size, _temp_byte_array, _audio_info)			
				} else {
					OggDecoder.convertStereo(e, _sample_read_size, _temp_byte_array, _audio_info)
				}

				//Fill the empty space with zeroes if needed.
				for (i=_sample_read_size*_audio_info.sampleMultiplier; i<OggDecoder._num_of_samples; ++i) {
					
					e.data.writeFloat(0);
					e.data.writeFloat(0); 
				}
			} else {
				//Fill the empty space with zeroes if needed.
				for (i=0; i<OggDecoder._num_of_samples; ++i) {
					e.data.writeFloat(0);
					e.data.writeFloat(0); 
				}
			}
			
		}
		private function onDataProgress(e:ProgressEvent):void{			
			_stream.readBytes(_audio_byte_array, _audio_byte_array.length, _stream.bytesAvailable);

			if (!_initialized){
				if (_audio_byte_array.bytesAvailable >= OggDecoder._buffer_size) {
					setupDecoder()
				}
			}
		}
	}
}