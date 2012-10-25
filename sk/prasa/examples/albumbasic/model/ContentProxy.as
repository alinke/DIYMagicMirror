package sk.prasa.examples.albumbasic.model 
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import sk.prasa.examples.albumbasic.model.vo.AlbumVO;
	import sk.prasa.examples.albumbasic.model.vo.PhotoVO;
	import sk.prasa.webapis.picasa.objects.GPhoto;
	import sk.prasa.webapis.picasa.objects.Link;
	import sk.prasa.webapis.picasa.objects.Links;
	import sk.prasa.webapis.picasa.objects.feed.AlbumMeta;
	import sk.prasa.webapis.picasa.objects.feed.AtomFeed;
	import sk.prasa.webapis.picasa.objects.feed.PhotoEntry;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ContentProxy extends Proxy implements IProxy 
	{
		public static const NAME : String = "ContentProxy";
		
		private var __current : Number;
		
		public function ContentProxy(data : Object = null)
		{
			super(NAME, data);
			
			__current = 0;
		}
		
		public function getMeta() : AlbumVO
		{
			var tMeta : AlbumVO = new AlbumVO();
				tMeta.id = meta.id;
				
			return tMeta;
		}

		public function getEntries() : Array
		{
			var tEntries : Array = new Array();
			
			for each(var photo : PhotoEntry in feed.entries)
			{
				tEntries.push(createVO(photo));
			}
			
			return tEntries;
		}
		
		public function getEntry(aID : String = null) : PhotoVO
		{
			var tID : String = aID != null ? aID : getCurrent();
			 
			for each(var photo : PhotoEntry in feed.entries)
			{
				if(tID == photo.gphoto.id)
				{
					setCurrent(tID);
					return createVO(photo);
				}
			}
			
			return null;
		}
		
		public function getNextPhoto() : String
		{
			if(++__current >= feed.entries.length || isNaN(__current)) __current = 0;
			
			return getCurrent();
		}
		
		public function getPrevPhoto() : String
		{
			if(--__current < 0 || isNaN(__current)) __current = feed.entries.length - 1;
			
			return getCurrent();
		}
		
		public function getPrevPageURL() : String
		{
			return Links(meta.links).getByRel(Link.REL_PREV).href;
		}
		
		public function getNextPageURL() : String
		{
			return Links(meta.links).getByRel(Link.REL_NEXT).href;
		}
		
		/**
		 * get current id
		 */
		private function getCurrent() : String
		{
			return PhotoEntry(feed.entries[__current]).gphoto.id;			
		}
		
		/**
		 * set id as current
		 */
		private function setCurrent(aID : String) : void
		{
			var tPos : int = 0;
		
			for each(var photo : PhotoEntry in feed.entries)
			{
				if(aID == photo.gphoto.id)
				{
					__current = tPos;
				}
				
				tPos++;
			}
		}
		
		private function createVO(aEntry : PhotoEntry) : PhotoVO
		{
			var tPhotoVO : PhotoVO = new PhotoVO();
				tPhotoVO.id = aEntry.gphoto.id;
				tPhotoVO.url = aEntry.media.content.url;
				tPhotoVO.thumb = aEntry.media.thumbnails[0].url;
				tPhotoVO.title = aEntry.summary;
						
				return tPhotoVO;
		}
		
		private function get feed() : AtomFeed
		{
			return data as AtomFeed;
		}
		
		private function get meta() : AlbumMeta
		{
			return feed.meta as AlbumMeta;
		} 
	}
}
