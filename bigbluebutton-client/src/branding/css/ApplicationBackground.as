package branding.css
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	
	import mx.skins.ProgrammaticSkin;
	import mx.utils.ColorUtil;
	
	public class ApplicationBackground extends ProgrammaticSkin
	{
		[ Embed( source='assets/img/background.png' ) ]
		private var backgroundImageClass    :Class;
		private var backgroundBitmapData    :BitmapData;
		
		private var tileWidth    :int;
		private var tileHeight    :int;
		/**
		 *  Constructor     
		 */
		public function ApplicationBackground()
		{
			super();             
			/*
			* we need to get the bitmap data of our image
			*/     
			var backgroundImage:Bitmap = new backgroundImageClass();
			/*
			* we need to store the widthe and height - if we are to repeat on ly on once axis
			*/             
			tileWidth    = backgroundImage.width;
			tileHeight    = backgroundImage.height;
			
			backgroundBitmapData = new BitmapData(    tileWidth,    
				tileHeight );
			
			backgroundBitmapData.draw( backgroundImage );
		}
		/**
		 *  @private
		 */    
		override protected function updateDisplayList(    w:Number,
														  h:Number ):void
		{
			super.updateDisplayList( w, h );
			
			graphics.clear();
			
			graphics.beginBitmapFill( backgroundBitmapData );
			/*
			* only use one of the following 3 lines        
			*/            
			graphics.drawRect( 0, 0, w, h );            // repeat x and y
			//        graphics.drawRect( 0, 0, tileWidth, h );    // repeat-y
			//        graphics.drawRect( 0, 0, w, tileHeight );    // repeat-x
		}
	}
}