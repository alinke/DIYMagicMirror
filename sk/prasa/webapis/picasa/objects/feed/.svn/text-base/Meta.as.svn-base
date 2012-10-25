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
	import sk.prasa.webapis.picasa.objects.Author;
	import sk.prasa.webapis.picasa.objects.Category;
	import sk.prasa.webapis.picasa.objects.Contributor;
	import sk.prasa.webapis.picasa.objects.FeedElement;
	import sk.prasa.webapis.picasa.objects.Generator;
	import sk.prasa.webapis.picasa.objects.Link;
	import sk.prasa.webapis.picasa.objects.Links;
	import sk.prasa.webapis.picasa.objects.Namespaces;
	import sk.prasa.webapis.picasa.objects.Rights;
	import sk.prasa.webapis.picasa.objects.Subtitle;
	import sk.prasa.webapis.picasa.objects.Title;
	import sk.prasa.webapis.picasa.objects.Utils;
	import sk.prasa.webapis.picasa.objects.feed.IMeta;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class Meta extends FeedElement implements IMeta 
	{
		private var atom_ns : Namespace = Namespaces.ATOM_NS;

		public function Meta(xmllist : XMLList)
		{
			super(xmllist);
		}

		/**
		 * 
		 */
		public function get title() : Title
		{
			var tTitle : Title = new Title();
				tTitle.type = Utils.parseString(this.data.atom_ns::title.@type);
				tTitle.value = Utils.parseString(this.data.atom_ns::title);

			return tTitle;
		}
		
		/**
		 * 
		 */
		public function set title(aTitle : Title) : void
		{
			// TODO: ... create title node on this.data! 
		}
		
		/**
		 * 
		 */
		public function get links() : Array
		{
			var tLinks : Array = new Links();
			
			for each(var node : XML in this.data.atom_ns::link)
			{
				var tLink : Link = new Link();
				tLink.rel = Utils.parseString(node.@rel);
				tLink.type = Utils.parseString(node.@type);
				tLink.hreflang = Utils.parseString(node.@hreflang);
				tLink.href = Utils.parseString(node.@href);
				tLink.title = Utils.parseString(node.@title);
				tLink.length = Utils.parseNumber(node.@["length"]);
				
				tLinks.push(tLink);
			}
			
			return tLinks;
		}
		
		/**
		 * 
		 */
		public function set links(aLinks : Array) : void
		{
			// TODO: ...
		}

		/**
		 * 
		 */
		public function get subtitle() : Subtitle
		{
			var tSubtitle : Subtitle = new Subtitle();
				tSubtitle.type = Utils.parseString(this.data.atom_ns::subtitle.@type);
				tSubtitle.value = Utils.parseString(this.data.atom_ns::subtitle);

			return tSubtitle;
		}

		/**
		 * 
		 */
		public function set subtitle(aSubTitle : Subtitle) : void
		{
			// TODO: ... create subtitle node on this.data! 
		}

		/**
		 * 
		 */
		public function get updated() : Date
		{
			return Utils.parseDate(this.data.atom_ns::updated, Utils.parseW3CDTF);
		}

		/**
		 * 
		 */
		public function set updated(aDate : Date) : void
		{
			// TODO: ... create updated node on this.data!
		}

		/**
		 * 
		 */
		public function get id() : String
		{
			return Utils.parseString(this.data.atom_ns::id);
		}

		/**
		 * 
		 */
		public function set id(aId : String) : void
		{
			// TODO: ... create id node on this.data!
		}

		/**
		 * 
		 */
		 public function get authors() : Array
		{
			var tAuthors : Array = new Array();
			
			for each(var node : XML in this.data.atom_ns::author)
			{
				var tAuthor : Author = new Author();
					tAuthor.name = Utils.parseString(node.atom_ns::["name"]);
					tAuthor.email = Utils.parseString(node.atom_ns::email);
					tAuthor.uri = Utils.parseString(node.atom_ns::uri);
					
				tAuthors.push(tAuthor);
			}
			
			return tAuthors;
		}

		/**
		 * 
		 */
		public function set authors(aAuthors : Array) : void
		{
			// TODO: ... create author nodes on this.data!
		}

		/**
		 * 
		 */
		public function get contributors() : Array
		{
			var tContributors : Array = new Array();
			
			for each(var node : XML in this.data.atom_ns::contributor)
			{
				var tContributor : Contributor = new Contributor();
					tContributor.name = Utils.parseString(node.atom_ns::["name"]);
					tContributor.email = Utils.parseString(node.atom_ns::email);
					tContributor.uri = Utils.parseString(node.atom_ns::uri);
					
				tContributors.push(tContributor);
			}
			
			return tContributors;
		}

		/**
		 * 
		 */
		public function set contributors(aContributors : Array) : void
		{
			// TODO: ... create contributors nodes on this.data!
		}

		/**
		 * 
		 */
		public function get categories() : Array
		{
			var tCategories : Array = new Array();
			
			for each(var node : XML in this.data.atom_ns::category)
			{
				var tCategory : Category = new Category();
					tCategory.term = Utils.parseString(node.@term);
					tCategory.scheme = Utils.parseString(node.@scheme);
					tCategory.label = Utils.parseString(node.@label);
					
				tCategories.push(tCategory);
			}
			
			return tCategories;
		}

		/**
		 * 
		 */
		public function set categories(aCategories : Array) : void
		{
			// TODO: ... create categories nodes on this.data!
		}

		/**
		 * 
		 */
		public function get rights() : Rights
		{
			var tRights : Rights = new Rights();
				tRights.type = Utils.parseString(this.data.atom_ns::rights.@type);
				tRights.value = Utils.parseString(this.data.atom_ns::rights);
			
			return tRights;
		}

		/**
		 * 
		 */
		public function set rights(aRights : Rights) : void
		{
			// TODO: ... create rights node on this.data!
		}

		/**
		 * 
		 */
		public function get generator() : Generator
		{
			var tGenerator : Generator = new Generator();
				tGenerator.uri = Utils.parseString(this.data.atom_ns::generator.@uri);
				tGenerator.version = Utils.parseString(this.data.atom_ns::generator.@version);
				tGenerator.value = Utils.parseString(this.data.atom_ns::generator);
			
			return tGenerator;
		}

		/**
		 * 
		 */
		public function set generator(aGenerator : Generator) : void
		{
			// TODO: ... create generator node on this.data!
		}

		/**
		 * 
		 */
		public function get icon() : String
		{
			return Utils.parseString(this.data.atom_ns::icon);
		}

		/**
		 * 
		 */
		public function set icon(aIcon : String) : void
		{
			// TODO: ... create icon node on this.data!
		}

		/**
		 * 
		 */
		public function get logo() : String
		{
			return Utils.parseString(this.data.atom_ns::logo);
		}

		/**
		 * 
		 */
		public function set logo(aLogo : String) : void
		{
			// TODO: ... create logo node on this.data!
		}
	}
}
