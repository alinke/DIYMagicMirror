package
{
    
    import com.swfjunkie.tweetr.oauth.OAuth;
    import com.swfjunkie.tweetr.oauth.events.OAuthEvent;
    
    import flash.display.Sprite;
    
    import no.doomsday.console.ConsoleUtil;
    import no.doomsday.console.core.AbstractConsole;
    import no.doomsday.console.core.messages.MessageTypes;
    
    /**
     * Pinless OAuth Example AS3
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
    
    [SWF(frameRate="24", width="700", height="400", backgroundColor="#555555")]
    
    public class tweetrAS3 extends Sprite
    {
        //--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------
        
        public function tweetrAS3()
        {
            console = ConsoleUtil.instance;
            stage.addChild(console);
            console.clear();
            
            oauth = new OAuth();
            
            oauth.consumerKey = "mdSRx9BmJkPvVaJQ2eRF4g";
            oauth.consumerSecret = "sKewtjinUK9GMXQDJd4jrTiM2YrQtazzgcV2NqlnLf4";
            
            oauth.serviceHost = "http://tweetr.swfjunkie.com/proxy";
            oauth.callbackURL = "http://tweetr.swfjunkie.com/dev/verified.html";
            oauth.pinlessAuth = true;
            oauth.addEventListener(OAuthEvent.COMPLETE, handleOAuthEvent);
            oauth.addEventListener(OAuthEvent.ERROR, handleOAuthEvent);
            
            console.show();
            console.print("Creating OAuth Authorization Window. This will launch a popup-window.\nIf your browser blocks it, allow popups and reload the page.");
            oauth.getAuthorizationRequest()
        }
        
        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        public var console:AbstractConsole;
        public var oauth:OAuth;
        
        //--------------------------------------------------------------------------
        //
        //  Eventhandling
        //
        //--------------------------------------------------------------------------
        
        private function handleOAuthEvent(event:OAuthEvent):void
        {
            if (event.type == OAuthEvent.COMPLETE)
                console.print("Authorization Successful!\n"+oauth.toString());
            else
                console.print(event.toString(), MessageTypes.WARNING);
        }
    }
}