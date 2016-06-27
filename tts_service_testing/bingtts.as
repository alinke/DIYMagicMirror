package com.microsoft;

   import flash.display.MovieClip;
		import flash.events.Event;
		 
		import flash.net.URLLoader;
		import flash.net.URLRequest;
		 
		import flash.net.URLRequestHeader;
		import flash.net.URLRequestMethod;
		 
		import flash.net.URLLoaderDataFormat;
		import flash.net.URLVariables;
	
		import flash.events.IOErrorEvent;
	
		import com.hurlant.util.Base64;
		import mx.utils.Base64Encoder;
		import flash.events.HTTPStatusEvent;
		import flash.events.IEventDispatcher;
		import flash.events.ProgressEvent;
		import flash.events.SecurityErrorEvent;
		import flash.events.ErrorEvent;
		import flash.media.Sound; 
		import flash.utils.ByteArray;
		import flash.media.SoundChannel;
		import flash.errors.EOFError;
		import org.as3wavsound.WavSound;
		import org.as3wavsound.WavSoundChannel;
		import flash.net.FileFilter; 
		import flash.net.FileReference; 
		import fr.kikko.lab.ShineMP3Encoder;
		//import com.mauft.OggLibrary.OggStream;
		//import com.mauft.OggLibrary.OggEmbed;

		import cmodule.hookOggVorbisLib.CLibInit;
		import com.jac.ogg.events.OggManagerEvent;
		import com.jac.ogg.OggManager;

public class bingtts {

    private var ttsServiceUri = "https://speech.platform.bing.com/synthesize";

    /**
     * Synthesize the voice through the specified parameters.
     */
	
	private	var authHeader:URLRequestHeader = new URLRequestHeader("Authorization", "Basic " + credentials);	
			 
		// create an array to contain the header			
	private	var headers:Array = [];
	
	private var loader:URLLoader;
		
	private var requestVars:URLVariables;
	
	
	
    public static byte[] Synthesize(String textToSynthesize, String outputFormat, String locale, String genderName, String voiceName) throws Exception {
		
	public function bingtts()	

        // Note: Sign up at http://www.projectoxford.ai for the client credentials.
    	OxfordAuthentication auth = new OxfordAuthentication("Your ClientId goes here", "Your Client Secret goes here");
        OxfordAccessToken token = auth.GetAccessToken();

        HttpsURLConnection webRequest = HttpsConnection.getHttpsConnection(ttsServiceUri);
        webRequest.setDoInput(true);
        webRequest.setDoOutput(true);
        webRequest.setConnectTimeout(5000);
        webRequest.setReadTimeout(15000);
        webRequest.setRequestMethod("POST");

        webRequest.setRequestProperty("Content-Type", "application/ssml+xml");
        webRequest.setRequestProperty("X-Microsoft-OutputFormat", outputFormat);
        webRequest.setRequestProperty("Authorization", "Bearer " + token.access_token);
        webRequest.setRequestProperty("X-Search-AppId", "07D3234E49CE426DAA29772419F436CA");
        webRequest.setRequestProperty("X-Search-ClientID", "1ECFAE91408841A480F00935DC390960");
        webRequest.setRequestProperty("User-Agent", "TTSAndroid");
        webRequest.setRequestProperty("Accept", "*/*");

        String SsmlTemplate = "<speak version='1.0' xml:lang='en-us'><voice xml:lang='%s' xml:gender='%s' name='%s'>%s</voice></speak>";
        String body = String.format(SsmlTemplate, locale, genderName, voiceName, textToSynthesize);
        byte[] bytes = body.getBytes();
        webRequest.setRequestProperty("content-length", String.valueOf(bytes.length));
        webRequest.connect();

        DataOutputStream dop = new DataOutputStream(webRequest.getOutputStream());
        dop.write(bytes);
        dop.flush();
        dop.close();

        InputStream inSt = webRequest.getInputStream();
        ByteArray ba = new ByteArray();
        
        int rn2 = 0;
        int bufferLength = 4096;
        byte[] buf2 = new byte[bufferLength];
        while ((rn2 = inSt.read(buf2, 0, bufferLength)) > 0) {
            ba.cat(buf2, 0, rn2);
        }

        inSt.close();
        webRequest.disconnect();

        return ba.getArray();
    }
}