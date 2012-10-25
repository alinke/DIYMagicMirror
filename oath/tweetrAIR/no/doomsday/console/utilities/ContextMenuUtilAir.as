package no.doomsday.console.utilities
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	//import flash.display.NativeMenu;
	//import flash.display.NativeMenuItem;
	//import flash.display.NativeWindow;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuBuiltInItems;
	import flash.ui.ContextMenuItem;
	import no.doomsday.console.utilities.controller.ControllerManager;
	import no.doomsday.console.core.DConsole;
	import no.doomsday.console.core.introspection.ScopeManager;
	import no.doomsday.console.utilities.measurement.MeasurementTool;
	import no.doomsday.console.core.messages.MessageTypes;
	import no.doomsday.console.core.references.ReferenceManager;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ContextMenuUtilAir
	{
		private static var console:DConsole;
		private static var referenceManager:ReferenceManager;
		private static var scopeManager:ScopeManager;
		private static var controllerManager:ControllerManager;
		private static var measureBracket:MeasurementTool;
		private static var consoleMenu:ContextMenu;
		public function ContextMenuUtilAir() 
		{
			
		}
		public static function setUp(console:DConsole, root:DisplayObjectContainer = null):void {
			getReferences(console);
			
			consoleMenu = new ContextMenu();
			var logItem:ContextMenuItem = new ContextMenuItem("Log");
			logItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, console.log);
			var screenshotItem:ContextMenuItem = new ContextMenuItem("Screenshot");
			screenshotItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, console.screenshot);
			var toggleDisplayItem:ContextMenuItem = new ContextMenuItem("Hide");
			toggleDisplayItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, console.toggleDisplay);
			var toggleStatsItem:ContextMenuItem = new ContextMenuItem("Performance stats");
			toggleStatsItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, console.toggleStats);
			consoleMenu.addItem(toggleDisplayItem);
			consoleMenu.addItem(toggleStatsItem);
			consoleMenu.addItem(logItem);
			consoleMenu.addItem(screenshotItem);
			console.contextMenu = consoleMenu;
			
			if (!root) return;
			var toggleMenuItem:ContextMenuItem = new ContextMenuItem("Toggle console");
			toggleMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onConsoleToggle,false,0,true);
			var selectionMenuItem:ContextMenuItem = new ContextMenuItem("Set console scope");
			selectionMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onSelectionMenu,false,0,true);
			var controllerMenuItem:ContextMenuItem = new ContextMenuItem("Create controller");
			controllerMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onControllerMenu,false,0,true);
			var referenceMenuItem:ContextMenuItem = new ContextMenuItem("Create reference");
			referenceMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onReferenceMenu,false,0,true);
			var measureMenuItem:ContextMenuItem = new ContextMenuItem("Get measurements");
			measureMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onMeasureMenu, false, 0, true);
			
			var baseMenu:ContextMenu = new ContextMenu();
			baseMenu.addItem(toggleMenuItem);
			baseMenu.addItem(selectionMenuItem);
			baseMenu.addItem(controllerMenuItem); 
			baseMenu.addItem(referenceMenuItem);
			baseMenu.addItem(measureMenuItem);
			
			if (!root.contextMenu) root.contextMenu = new ContextMenu();
			root.contextMenu = baseMenu;
		}
		private static function getReferences(c:DConsole):void {
			console = c;
			var a:Array = console.getManagerRefs();
			scopeManager = a[0];
			referenceManager = a[1];
			controllerManager = a[2];
			measureBracket = a[3];
		}
		private static function onConsoleToggle(e:ContextMenuEvent):void 
		{
			console.toggleDisplay();
		}
		
		private static function onMeasureMenu(e:ContextMenuEvent):void 
		{
			var target:DisplayObject = e.mouseTarget;
			if (target != console.root) {
				measureBracket.bracket(target);
			}else {
				console.print("Unable to bracket root", MessageTypes.ERROR);
			}
			console.show();
		}
		private static function onReferenceMenu(e:ContextMenuEvent):void 
		{
			var target:DisplayObject = e.mouseTarget;
			console.show();
			referenceManager.createReference(target);
		}
		
		private static function onControllerMenu(e:ContextMenuEvent):void 
		{
			var target:DisplayObject = e.mouseTarget;
			if (target is DisplayObject) {
				console.show();
				if (target == console.root) {
					console.print("Unable to create default controller for root", MessageTypes.ERROR);
					return;
				}
				scopeManager.setScope(target);
				var properties:Array = ["name","x", "y", "width", "height", "rotation", "scaleX", "scaleY"];
				controllerManager.createController(scopeManager.currentScope.obj, properties, e.mouseTarget.x, e.mouseTarget.y);
				console.print("Controller created. Type values to alter, or use the mousewheel on numbers.");
			}
		}
		
		private static function onSelectionMenu(e:ContextMenuEvent):void 
		{
			scopeManager.setScope(e.mouseTarget);
		}
		
	}

}