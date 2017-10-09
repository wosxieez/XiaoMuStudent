package com.xiaomu.renderer
{
	import coco.component.DefaultItemRenderer;
	import coco.component.Image;
	import coco.component.TextAlign;
	
	public class TeamItemRenderer extends DefaultItemRenderer
	{
		public function TeamItemRenderer()
		{
			super();
			mouseChildren = true;
		}
		
		private var icon:Image;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			labelDisplay.leftMargin = 30;
			labelDisplay.textAlign = TextAlign.LEFT;
			
			icon = new Image();
			icon.x = 6;
			icon.width = icon.height = 18;
			icon.source = "assets/team.png";
			addChild(icon);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			icon.y = (height - icon.height) / 2;
		}
		
	}
}