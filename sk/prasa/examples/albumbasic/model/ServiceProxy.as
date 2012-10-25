package sk.prasa.examples.albumbasic.model 
{
	import flash.events.ErrorEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.observer.Notifier;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import sk.prasa.webapis.picasa.PicasaResponder;
	import sk.prasa.webapis.picasa.PicasaService;
	import sk.prasa.webapis.picasa.events.PicasaDataEvent;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ServiceProxy extends Proxy implements IProxy 
	{
		private var service : PicasaService;
		private var lastCommand : LastCommand;
		private var lastCount : int;
		
		public static var THUMBSIZE : String = "64c";
		public static var IMGMAX : String = "576";
		public static var MAX_RESULTS : int = 20;
		public static var START_INDEX : int = 1;
		
		public static const NAME : String = "ServiceProxy";
		
		public static const DATA_EVENT : String = "data_event";
		public static const ERROR_EVENT : String = "error_event";
		
		public function ServiceProxy(data : Object = null)
		{
			super(NAME, data);
			
			service = new PicasaService();
			service.thumbsize = THUMBSIZE;
			service.imgmax = IMGMAX;
			service.max_results = MAX_RESULTS;
			service.start_index = START_INDEX;
		}
			
		public function getPhotosList(aUserID : String, aAlbumID : String) : void
		{
			lastCommand = new LastCommand(getPhotosList, aUserID, aAlbumID);
			
			var tResponder : PicasaResponder = service.photos.list(aUserID, aAlbumID);
				tResponder.addEventListener(PicasaDataEvent.DATA, result);
				tResponder.addEventListener(ErrorEvent.ERROR, fault);
		}

		public function getPhotosListByTag(aUserID : String, aAlbumID : String, aTag : String) : void
		{
			lastCommand = new LastCommand(getPhotosListByTag, aUserID, aAlbumID, aTag);
			
			var tResponder : PicasaResponder = service.photos.list_by_tag(aUserID, aAlbumID, aTag);
				tResponder.addEventListener(PicasaDataEvent.DATA, result);
				tResponder.addEventListener(ErrorEvent.ERROR, fault);
		}
			
		public function getNextPage() : void
		{
			if(lastCommand != null && lastCount >= MAX_RESULTS)
			{
				service.start_index += service.max_results;
				lastCommand.execute();
			}
		}
		
		public function getPrevPage() : void
		{ 
			if(lastCommand != null && service.start_index > START_INDEX)
			{
				service.start_index = (service.start_index - service.max_results) >= 1 ? (service.start_index - service.max_results) : 1;
				lastCommand.execute();
			}
		}
		
		// if we have indexed navigation (1 2 3 4 5 ...)
		public function getCustomPage(aPageNumber : Number) : void
		{ 
			if(lastCommand != null)
			{
				service.start_index = service.max_results * aPageNumber - (service.max_results - 1);
				lastCommand.execute();
			}
		}
		
		private function result(evt : PicasaDataEvent) : void
		{
			PicasaResponder(evt.target).removeEventListener(PicasaDataEvent.DATA, result);
			PicasaResponder(evt.target).removeEventListener(ErrorEvent.ERROR, fault);

			lastCount = evt.data.entries.length;
	
			this.sendNotification(DATA_EVENT, evt.data);
		}

		private function fault(evt : ErrorEvent) : void
		{
			PicasaResponder(evt.target).removeEventListener(PicasaDataEvent.DATA, result);
			PicasaResponder(evt.target).removeEventListener(ErrorEvent.ERROR, fault);
			
			this.sendNotification(ERROR_EVENT, evt.text);
		}
	}
}

class LastCommand
{
	public var func : Function;
	public var args : Array;
	
	public function LastCommand(fn : Function, ...rest : Array)
	{
		func = fn;
		args = rest;
	}
	
	public function execute() : void
	{
		func.apply(null, args);
	}
}
