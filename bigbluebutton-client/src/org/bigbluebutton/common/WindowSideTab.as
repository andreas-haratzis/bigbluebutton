package org.bigbluebutton.common
{
	import flash.events.Event;
	
	import flexlib.mdi.containers.MDIWindow;
	import flexlib.mdi.events.MDIWindowEvent;
	
	import mx.controls.Button;
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.FlexEvent;
	
	import org.bigbluebutton.common.LogUtil;
	import org.bigbluebutton.core.BBB;
	import org.bigbluebutton.main.views.MainCanvas;
	import org.bigbluebutton.main.views.SideTabButton;
	import org.bigbluebutton.util.i18n.ResourceUtil;
	
	public class WindowSideTab
	{
		public var hidden:Boolean = true;
		public var snapToRight:Boolean = false;
		public var cornerRadius:Number = 15;
		
		//the position between 0 and 1 where the button will sit along the length of the window
		public var buttonPositionNormalized:Number = 0.5;
		//if set, this will add to the normalized position, being x pixels under the normalized pos
		//for a general absolute position (e.g 8 pixels from the top) set normalized = 0
		public var buttonPositionAbsolute:Number = 0;
		
		public var width:Number = 200;
		
		private var button:SideTabButton;
		private var window:MDIWindow;
		
		public function init( _window:MDIWindow , _image:Class ):void{
			
			window = _window;
			
			button = new SideTabButton();
			//load image
			button.image = _image;
			
			button.addEventListener(FlexEvent.BUTTON_DOWN,toggleHidden);
			button.addEventListener(Event.INIT,button.init);
			
			window.addEventListener(Event.REMOVED_FROM_STAGE,removeTabButton);
			window.stage.addEventListener("resize", applySnap);
			window.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,onChildChange);
			window.addEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,onChildChange);
			window.addEventListener(Event.RESIZE,applySnap);
			window.addEventListener(MDIWindowEvent.FOCUS_START,focusButton);
			window.parent.addChild(button);
			
			applySnap();
		}
		
		
		public function applySnap(event:Event = null):void{

			//epand window to the screen space available
			window.height = window.parent.height;
			
			//snap the window to the right hand side
			window.x = (snapToRight) ? window.parent.width - window.width : 0 ;
			
			//centre the window
			//window.y = (window.parent.height - window.height) / 2; //not needed as window is full height now
			window.y = 0;
			
			//hide or show
			if(hidden)
				window.x += (snapToRight) ? window.width : -window.width ;
			//move the tab a little to hide side corner
			else
				window.x += (snapToRight) ? cornerRadius : -cornerRadius;
			
			//update button
			if(button)
			{
				button.x = (snapToRight) ? window.x - button.finalWidth : window.x + window.width ;
				
				//move to normalized position
				button.y = (window.height - button.finalHeight)* buttonPositionNormalized + buttonPositionAbsolute;
			}
			
		}
		
		public function hide():void{
			if(!hidden)
				toggleHidden();
		}
		
		public function show():void{
			if(hidden)
				toggleHidden();
		}
		
		private function removeTabButton(event:Event = null):void{
			if(button)
				button.parent.removeChild(button);
		}
		
		public function toggleHidden(event:FlexEvent = null):void{
			hidden = !hidden;
			applySnap();
		}
		
		private function onChildChange(event:ChildExistenceChangedEvent = null):void {
			applySnap();
		}
		
		private function focusButton(event:MDIWindowEvent = null):void{
			button.parent.setChildIndex(button,button.parent.numChildren - 1); //move it just above the main window
		}
	}
}