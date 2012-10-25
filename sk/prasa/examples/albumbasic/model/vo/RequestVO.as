package sk.prasa.examples.albumbasic.model.vo 
{
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class RequestVO 
	{
		public var userid : String;
		public var albumid : String;
		public var tag : String;

		public function RequestVO(aUserID : String = null, aAlbumID : String = null, aTag : String = null)
		{
			userid = aUserID;
			albumid = aAlbumID;
			tag = aTag;
		}
	}
}
