package  
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import sk.prasa.examples.albumbasic.ApplicationFacade;
	import sk.prasa.examples.albumbasic.view.components.AlbumView;
	import sk.prasa.examples.albumbasic.view.components.NavigationView;
	import sk.prasa.examples.albumbasic.view.components.PreloaderView;
	import sk.prasa.examples.albumbasic.view.components.ThumbsView;
	import sk.prasa.examples.albumbasic.view.components.TitleView;
	import sk.prasa.examples.albumbasic.view.components.ToolTipView;	

	[SWF(width="576", height="600", backgroundColor="0x000000", frameRate="31")]
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class AlbumBasic extends Sprite 
	{
		public var album : AlbumView;
		public var thumbs : ThumbsView;
		public var preloader : PreloaderView;
		public var title : TitleView;
		public var navigation : NavigationView; 
		public var tooltip : ToolTipView;
		
		private var facade : ApplicationFacade;
		
		public function AlbumBasic()
		{
			initializeStage();
			initializeBackground();
			initializeViews();
			
			facade = ApplicationFacade.getInstance();
			facade.startup(this);
		}
		
		private function initializeStage() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		
		private function initializeBackground() : void
		{
			this.graphics.beginFill(0xCC0066);
			this.graphics.drawRect(0, 0, 940, 20);
			this.graphics.endFill();
		}
		
		private function initializeViews() : void
		{
			album = new AlbumView();
			album.y = 20;
			
			thumbs = new ThumbsView();
			thumbs.width = 360;
			thumbs.x = 578;
			thumbs.y = 20;
			
			preloader = new PreloaderView();
			preloader.y = 20;
			title = new TitleView();
			title.x = 120;
			
			navigation = new NavigationView();
			navigation.x = 2; navigation.y = 2;
			tooltip = new ToolTipView();
			
			this.addChild(album);
			this.addChild(thumbs);
			this.addChild(preloader);
			this.addChild(title);
			this.addChild(navigation);
			this.addChild(tooltip);
		}
	}
}
