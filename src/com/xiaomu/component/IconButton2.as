package com.xiaomu.component
{
	
	/**
	 * 功能按钮 
	 * @author coco
	 */	
	public class IconButton2 extends IconButton
	{
		public function IconButton2()
		{
			super();
		}
		
		
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		// Methods
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			imageDisplay.width = imageDisplay.height = 30;
		}
		
		override protected function drawSkin():void
		{
			// over FFFDF9
			// normal F8F3E4
			graphics.clear();
			graphics.lineStyle(1, 0xF0E7CC);
			if (mouseOver && !mouseDown)
				graphics.beginFill(0xFFFDF9);
			else
				graphics.beginFill(0xF8F3E4);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
	}
}