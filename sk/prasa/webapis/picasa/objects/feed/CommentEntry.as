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
	import sk.prasa.webapis.picasa.objects.Utils;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class CommentEntry extends Entry implements IEntry 
	{
		public var user : GPhoto;
		//BUG?: GPHOTO IS IN THE AUTHOR FEED
		
		private var gphotohack_ns : Namespace = Namespaces.GPHOTO_NS;
		private var atom_ns : Namespace = Namespaces.ATOM_NS;
		
		public function CommentEntry(xmllist : XMLList)
		{
			super(xmllist);
			
			// GPHOTO HACK
			user = new GPhoto(new XMLList(), Kind.USER);
			user.user = Utils.parseString(this.data.atom_ns::author.gphotohack_ns::user);
			user.nickname = Utils.parseString(this.data.atom_ns::author.gphotohack_ns::nickname);
			user.thumbnail = Utils.parseString(this.data.atom_ns::author.gphotohack_ns::thumbnail);
		}
		
		//dopisat metody typicke pre CommentEntry
		
		public function get gphoto() : GPhoto
		{
			var tGPhoto : GPhoto = new GPhoto(this.data, Kind.COMMENT);
			return tGPhoto;
		}
		
		public function set gphoto(aGPhoto : GPhoto) : void
		{
			// TODO: ...
		}
	}
}
