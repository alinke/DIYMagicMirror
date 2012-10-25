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
	import sk.prasa.webapis.picasa.objects.Link;
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	dynamic public class Links extends Array 
	{		
		public function getByRel(rel : String) : Link
		{
			for each(var link : Link in this)
			{
				if(link.rel == rel) return link;
			}
			
			return null;
		}
		
		/**
		 * TODO: ... define enum for type!
		 */
//		public function getByType(type : String) : Link
//		{
//			for each(var link : Link in this)
//			{
//				if(link.type == type) return link;
//			}
//			
//			return null;
//		}
		
		public function toString() : String
		{
			var tRes : String = "[Links ";
			
			for(var a : Number = 0; a < this.length; a++)
			{
				var tLink : Link = Link(this[a]);
				tRes += tLink.toString() + "";
			}
			
			tRes += "]";
			
			return tRes;
		}
	}
}
