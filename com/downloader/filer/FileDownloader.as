package com.downloader.filer {
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.net.URLRequest;
import flash.net.URLStream;
import flash.utils.ByteArray;

public class FileDownloader
{

        // Class to download files from the internet

        // Function called every time data arrives
        //              called with an argument of how much has been downloaded
        public var onProgress :Function = function(t:uint):void{};
        public var onComplete :Function = function():void{};
        //public var remotePath :String = "";
		public var remotePath :URLRequest = "";
		
        public var localFile :File = null; 

        private var stream :URLStream;
        private var fileAccess :FileStream;

        public function FileDownloader( remotePath :URLRequest = "" , localFile :File = null ) {

                this.remotePath = remotePath;
                this.localFile = localFile;
        }

        public function load() :void {
                if( !stream || !stream.connected ) {
                        stream = new URLStream();
                        fileAccess = new FileStream();

                        var requester :URLRequest = new URLRequest( remotePath );
                        var currentPosition :uint = 0;
                        var downloadCompleteFlag :Boolean = false;

                        // Function to call oncomplete, once the download finishes and
                        //      all data has been written to disc                               
                        fileAccess.addEventListener( "outputProgress", function ( result ) :void {
                                if( result.bytesPending == 0 && downloadCompleteFlag ) {

                                        stream.close();
                                        fileAccess.close();
                                        onComplete();
                                }
                        });

                        fileAccess.openAsync( localFile, FileMode.WRITE );

                        stream.addEventListener( "progress" , function () :void {

                                var bytes :ByteArray = new ByteArray();
                                var thisStart :uint = currentPosition;
                                currentPosition += stream.bytesAvailable;
                                // ^^  Makes sure that asyncronicity does not break anything

                                stream.readBytes( bytes, thisStart );
                                fileAccess.writeBytes( bytes, thisStart );

                                onProgress( currentPosition );                                          
                        });

                        stream.addEventListener( "complete", function () :void {
                                downloadCompleteFlag = true;
                        });

                        stream.load( requester );

                } else {
                        // Do something unspeakable
                }
        }
}}
