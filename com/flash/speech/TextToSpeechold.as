package com.flash.speech
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class TextToSpeech
	{
		public function TextToSpeech()
		{
		}
		
		
		/**
		 * Say the word.
		 * @param value - The string that will be spoken.
		 */ 
		public static function say(value:String):void
		{
			//var s:Sound = new Sound();
			tts.load(new URLRequest(generateAudioURL(value)));
			tts.play();
		}
		
		
		/**
		 * @private
		 * Generate the url.
		 */ 
		protected static function generateAudioURL(value:String):String
		{
			var generatedString:String = 'http://translate.google.com/translate_tts?q=' + value;
			return generatedString;
		}

	}
}