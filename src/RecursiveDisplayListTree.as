package
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class RecursiveDisplayListTree extends Sprite
	{
		public function RecursiveDisplayListTree()
		{
			var rects:Array = new Array();
			for (var i:int = 0; i < 20; i++) 
			{
				rects[i] = new Shape();
				rects[i].graphics.lineStyle(1);
				rects[i].graphics.beginFill(Math.floor(Math.random()*0xFFFFFF), 1);
				rects[i].graphics.drawRect(0, 0, 100, 50);
				rects[i].x = Math.floor(Math.random()*500);
				rects[i].y = Math.floor(Math.random()*400);
				addChild(rects[i]);
			}
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener);
		}
		
		private function mouseDownListener(e:Event):void 
		{
			for (var i:int=0; i < numChildren; i++) 
			{
				getChildAt(i).rotation = Math.floor(Math.random()*360);
			}
		}
		
		public function processChildren(container:DisplayObjectContainer):void 
		{
			for (var i:int = 0; i < container.numChildren; i++) 
			{
				var thisChild:DisplayObject = container.getChildAt(i);
				trace(thisChild.toString());
				
				if (thisChild is DisplayObjectContainer) 
				{
					processChildren(DisplayObjectContainer(thisChild));
				}
			}
		}
	}
}