/*
 * The MIT License
 * 
 * Copyright (c) 2008 Michal Gron (michal.gron@gmail.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package sk.prasa.webapis.picasa.objects.feed 
{
	import sk.prasa.webapis.picasa.objects.GPhoto;
	import sk.prasa.webapis.picasa.objects.Kind;
	import sk.prasa.webapis.picasa.objects.Namespaces;
	import sk.prasa.webapis.picasa.objects.OpenSearch;
	import sk.prasa.webapis.picasa.objects.Utils;
	import sk.prasa.webapis.picasa.objects.feed.Entry;
	import sk.prasa.webapis.picasa.objects.feed.IEntry;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class UserEntry extends Entry implements IEntry 
	{
		private var opensearch_ns : Namespace = Namespaces.OPENSEARCH_NS;
		
		public function UserEntry(xmllist : XMLList)
		{
			super(xmllist);
		}
		
		//dopisat metody typicke pre UserEntry
		
		public function get gphoto() : GPhoto
		{
			var tGPhoto : GPhoto = new GPhoto(this.data, Kind.USER);
			return tGPhoto;
		}
		
		public function set gphoto(aGPhoto : GPhoto) : void
		{
			// TODO: ...
		}
		
		public function get opensearch() : OpenSearch
		{
			var tOpenSearch : OpenSearch = new OpenSearch();
				tOpenSearch.totalResults = Utils.parseNumber(this.data.opensearch_ns::totalResults); 
				tOpenSearch.startIndex = Utils.parseNumber(this.data.opensearch_ns::startIndex);
				tOpenSearch.itemsPerPage = Utils.parseNumber(this.data.opensearch_ns::itemsPerPage);
				
			return tOpenSearch;
		}
		
		public function set opensearch(aOpenSearch : OpenSearch) : void
		{
			// TODO: ...
		}
	}
}
