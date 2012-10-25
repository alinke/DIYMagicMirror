package sk.prasa.examples.albumbasic.model.vo 
{
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class PhotoVO
	{
		public var id : String;
		public var url : String;
		public var thumb : String;
		public var title : String; 
		
		public function PhotoVO(aID : String = null, aURL : String = null, aThumb : String = null, aTitle : String = null)
		{
			id = aID;
			url = aURL;
			thumb = aThumb;
			title = aTitle;
		}
	}
}
