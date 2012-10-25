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

package sk.prasa.webapis.picasa.objects 
{
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.Dictionary;
	
	import sk.prasa.webapis.picasa.PicasaService;
	import sk.prasa.webapis.picasa.core.observer.IObserver;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class UrlParams implements IObserver
	{
		private var __dict : Dictionary;
		private var __suffix : String;
		private var __method : String;

		public function UrlParams(	aKind : String = "photo",	
									aAccess : String = null,
									aThumbsize : String = null,
									aImgmax : String = null,
									aTag : String = null,
									aQ : String = null,
									aMax_results : int = 100,
									aStart_index : int = 1,
									aBbox : String = null,
									aL : String = null)
		{
			__dict = new Dictionary();
			__suffix = "";
			__method = URLRequestMethod.GET;
			
			setParameter("access", aAccess);
			setParameter("thumbsize", aThumbsize);
			setParameter("imgmax", aImgmax);
			setParameter("max-results", aMax_results);
			setParameter("start-index", aStart_index);
			
			setParameter("kind", aKind);
			setParameter("tag", aTag);
			setParameter("q", aQ);
			setParameter("l", aL);
			
			setParameter("bbox", aBbox);
		}
		
		public function update(o : *) : void
		{
			merge(o as UrlParams);
		}

		public function get method() : String
		{
			return __method;
		}
		
		public function set method(value : String) : void
		{
			__method = value;
		}
		
		public function get suffix() : String
		{
			return __suffix;
		}
		
		public function set suffix(value : String) : void
		{
			__suffix = value;
		}

		public function get access() : String
		{
			return getParameter("access");
		}
		
		public function set access(value : String) : void
		{
			setParameter("access", value);
		}
		
		public function get thumbsize() : String
		{
			return getParameter("thumbsize");
		}
		
		public function set thumbsize(value : String) : void
		{
			setParameter("thumbsize", value);
		}
		
		public function get imgmax() : String
		{
			return getParameter("imgmax");
		}
		
		public function set imgmax(value : String) : void
		{
			setParameter("imgmax", value);
		}
		
		public function get max_results() : int
		{
			return getParameter("max-results");
		}
		
		public function set max_results(value : int) : void
		{
			setParameter("max-results", value);
		}
		
		public function get start_index() : int
		{
			return getParameter("start-index");
		}
		
		public function set start_index(value : int) : void
		{
			setParameter("start-index", value);
		}
		
		public function get kind() : String // default is photo!
		{
			return getParameter("kind");
		}	
		
		public function set kind(value : String) : void
		{
			setParameter("kind", value);
		}
		
		public function get tag() : String
		{
			return getParameter("tag");
		}
		
		public function set tag(value : String) : void
		{
			setParameter("tag", value);
		}
		
		public function get q() : String
		{
			return getParameter("q");
		}
		
		public function set q(value : String) : void
		{
			setParameter("q", value);
		}
		
		public function get l() : String
		{
			return getParameter("l");
		}
		
		public function set l(value : String) : void
		{
			setParameter("l", value);
		}
		
		public function get bbox() : String
		{
			return getParameter("bbox");
		}
		
		public function set bbox(value : String) : void
		{
			setParameter("bbox", value);
		}
		
		public function merge(p : UrlParams) : UrlParams
		{
			if(p != null)
			{ 
				kind = p.kind;
				
				if(p.access != null) access = p.access;
				if(p.thumbsize != null) thumbsize = p.thumbsize;
				if(p.imgmax != null) imgmax = p.imgmax;
				if(p.tag != null) tag = p.tag;
				if(p.q != null) q = p.q;
				
				max_results = p.max_results;
				start_index = p.start_index;
				
				if(p.bbox != null) bbox = p.bbox;
				if(p.l != null) l = p.l; 
			}
								
			return clone();
		}
		
		/**
		 * @private
		 */
		public function getURLRequest() : URLRequest
		{
			var tURLRequest : URLRequest = new URLRequest();
				tURLRequest.url = PicasaService.FEED_API_URL + suffix;
				tURLRequest.data = getURLVariables();
				
			return tURLRequest;
		}
		
		/**
		 * @private
		 */
		internal function getURLVariables() : URLVariables
		{
			var tURLVariables : URLVariables = new URLVariables();
			
			for(var key : String in __dict)
            {
            	if(getParameter(key) != null) tURLVariables[key] = getParameter(key);
            }
            
			
			return tURLVariables;
		}
		
		public function setParameter(key : String, value : *) : void
		{	
			__dict[key] = value;
		}
		
		public function getParameter(key : String) : *
		{	
			return __dict[key];
		}
		
		public function removeParameter(key : String) : void
		{	
			delete __dict[key];
		}
		
		/**
		 * @private
		 */
		internal function containsKey(key : String) : Boolean
        {
            return __dict[key] != null;
        }
        
        public function clone() : UrlParams
		{
			return new UrlParams(kind, access, thumbsize, imgmax, tag, q, max_results, start_index, bbox, l);
		}
		
		public function toString() : String
		{
			var tFirst : Boolean = true;
			var tRes : String = "";
			
			for (var key : String in __dict)
			{
				if(containsKey(key))
				{
					tRes += (tFirst ? "?" : "&") + key + "=" + urlEncode(getParameter(key));
					tFirst = false;
				}
			}
			
			return tRes;
		}
	}
}
/**
 * @private
 */
function urlEncode(str:String):String
{
	const RFC3986_ENCODE : RegExp = /[^a-zA-Z0-9_.~-]/g;
	var convert : Object = new Object;
	
	convert.encode = function() : String
	{
		return String("%" + String(arguments[0]).charCodeAt().toString(16)).toUpperCase();
	}
	
	return str.replace(RFC3986_ENCODE, convert.encode);
}
