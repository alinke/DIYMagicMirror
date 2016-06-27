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

OggInfo - Internal class used by OggRadio, OggStream and OggEmbed, holds OGG file
		  information.
		  Is not to be used.
			 
Check Readme for further usage instructions!
------------------------------------------------------------------------------------*/

package com.mauft.OggLibrary{
	internal class OggInfo{
		private var _format:String
		private var _channels:uint
		private var _sampleRate:uint
		private var _sampleMultiplier:Number
		private var _bitRateUpper:uint
		private var _bitRateLower:uint
		private var _bitRateNominal:uint
		private var _bitsPerSample:uint
		private var _blockAlign:uint
		private var allIsSet:Boolean=false
		public function OggInfo()	{}
		internal function get format():String{return _format;}
		internal function get channels():uint{return _channels;}
		internal function get sampleRate():uint{return _sampleRate;}
		internal function get sampleMultiplier():Number{return _sampleMultiplier;}
		internal function get bitRateUpper():uint{return _bitRateUpper;}
		internal function get bitRateLower():uint{return _bitRateLower;} 
		internal function get bitRateNominal():uint{return _bitRateNominal;}
		internal function get bitsPerSample():uint{return _bitsPerSample;}
		internal function get blockAlign():uint{return _blockAlign;}
		internal function finish():void{
			allIsSet=true
		}
		internal function set format(val:String):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_format=val
		}
		internal function set channels(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_channels=val
		}
		internal function set sampleRate(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_sampleRate=val
		}
		internal function set sampleMultiplier(val:Number):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_sampleMultiplier=val
		}
		internal function set bitRateUpper(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_bitRateUpper=val
		}
		internal function set bitRateLower(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_bitRateLower=val
		}
		internal function set bitRateNominal(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_bitRateNominal=val
		}
		internal function set bitsPerSample(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_bitsPerSample=val
		}
		internal function set blockAlign(val:uint):void{
			if (allIsSet){new Error("Cannot alter OggInfo")}
			_blockAlign=val
		}
	}
}
