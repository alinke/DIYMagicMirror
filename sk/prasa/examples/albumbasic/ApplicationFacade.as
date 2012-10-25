package sk.prasa.examples.albumbasic 
{
	import sk.prasa.examples.albumbasic.model.ServiceProxy;	
	
	import flash.display.DisplayObject;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import sk.prasa.examples.albumbasic.controller.*;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ApplicationFacade extends Facade 
	{
		public static const STARTUP_EVENT : String = "startup_event";
		public static const LOAD_EVENT : String = "load_event";
		
		public static const FULLSCREEN_EVENT : String = "fullscreen_event";
		public static const RESIZE_EVENT : String = "resize_event";
		public static const PROGRESS_EVENT : String = "progress_event";
		
		public static const TITLE_CHANGE_EVENT : String = "title_change_event";
		public static const PREV_PAGE_EVENT : String = "prev_page_event";		public static const NEXT_PAGE_EVENT : String = "next_page_event";
		
		public static const CHANGE_THUMBS_EVENT : String = "change_thumbs_event";
		public static const CHANGE_PHOTO_EVENT : String = "change_photo_event";
		public static const PREV_PHOTO_EVENT : String = "prev_photo_event";
		public static const NEXT_PHOTO_EVENT : String = "next_photo_event";
		
		public static const THUMB_MOUSE_OVER : String = "thumb_mouse_over_event";
		public static const THUMB_MOUSE_OUT : String = "thumb_mouse_out_event";
		
		public static function getInstance() : ApplicationFacade
		{
			if(instance == null)
			{
				instance = new ApplicationFacade();
			}
			
			return instance as ApplicationFacade;
		}

		override protected function initializeController() : void
		{
			super.initializeController();
			
			this.registerCommand(STARTUP_EVENT, StartupCommand);
			this.registerCommand(LOAD_EVENT, LoadCommand);
			this.registerCommand(ServiceProxy.DATA_EVENT, DataCommand);
			this.registerCommand(ServiceProxy.ERROR_EVENT, ErrorCommand);
			
			this.registerCommand(PREV_PAGE_EVENT, PrevPageCommand);
			this.registerCommand(NEXT_PAGE_EVENT, NextPageCommand);
			
			this.registerCommand(PREV_PHOTO_EVENT, PrevPhotoCommand);
			this.registerCommand(NEXT_PHOTO_EVENT, NextPhotoCommand);
		}

		public function startup(app : DisplayObject) : void
		{
			this.sendNotification(STARTUP_EVENT, app);
		}
	}
}
