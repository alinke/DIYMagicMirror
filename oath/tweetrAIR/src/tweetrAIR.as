package
{
    import com.swfjunkie.tweetr.Tweetr;
    import com.swfjunkie.tweetr.oauth.OAuth;
    import com.swfjunkie.tweetr.oauth.events.OAuthEvent;
    
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.html.HTMLLoader;
    
    import no.doomsday.console.ConsoleUtil;
    import no.doomsday.console.core.AbstractConsole;
    import no.doomsday.console.core.messages.MessageTypes;
    
    
    /**
     * Pinless OAuth Example
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
    
    public class tweetrAIR extends Sprite
    {
        //--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------
        
        public function tweetrAIR()
        {
            stage.scaleMode = "noScale";
            stage.align = "TL";
            
            console = ConsoleUtil.getInstance();
            stage.addChild(console);
            console.clear();
            console.show();
            
            tweetr = new Tweetr();
            tweetr.serviceHost = "http://tweetr.swfjunkie.com/proxy";
            
            oauth = new OAuth();
            oauth.consumerKey = "mdSRx9BmJkPvVaJQ2eRF4g";
            oauth.consumerSecret = "sKewtjinUK9GMXQDJd4jrTiM2YrQtazzgcV2NqlnLf4";
            oauth.callbackURL = "http://netsyndicate.net/";
            oauth.pinlessAuth = true;
            
            oauth.addEventListener(OAuthEvent.COMPLETE, handleOAuthEvent);
            oauth.addEventListener(OAuthEvent.ERROR, handleOAuthEvent);
            
            console.print("Creating OAuth Authorization Window.");
            
            htmlLoader = HTMLLoader.createRootWindow(true, null, true, new Rectangle(50,50, 780, 500));
            htmlLoader.stage.nativeWindow.alwaysInFront = true;
            oauth.htmlLoader = htmlLoader;
            oauth.getAuthorizationRequest();
        }
        
        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------
        
        private var tweetr:Tweetr;
        private var oauth:OAuth;
        private var console:AbstractConsole;
        private var htmlLoader:HTMLLoader;

        //--------------------------------------------------------------------------
        //
        //  Eventhandling
        //
        //--------------------------------------------------------------------------
        
        private function handleOAuthEvent(event:OAuthEvent):void
        {
            if (event.type == OAuthEvent.COMPLETE)
            {
                htmlLoader.stage.nativeWindow.close();
                console.print("OauthEvent."+event.type.toLocaleUpperCase(), MessageTypes.SYSTEM);
                tweetr.oAuth = oauth;
                
                console.print("Authorization Successful!");
                console.print(oauth.toString(), MessageTypes.TRACE);
            }
            else
            {
                console.print("OauthEvent."+event.type.toLocaleUpperCase(), MessageTypes.ERROR);
            }
        }
    }
}