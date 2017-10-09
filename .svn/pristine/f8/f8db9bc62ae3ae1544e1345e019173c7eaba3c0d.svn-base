package com.xiaomu.renderer
{
	import com.xiaomu.manager.DataManager;
	
	import coco.component.DefaultItemRenderer;
	import coco.component.Image;
	import coco.component.TextAlign;
	import coco.component.TextInput;
	import coco.util.CocoUI;
	
	public class AnswerItemRenderer extends DefaultItemRenderer
	{
		public function AnswerItemRenderer()
		{
			super();
			mouseChildren = false;
		}
		
		private var rightDisplay:Image;
		private var inputDisplay:TextInput;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			rightDisplay = new Image();
			rightDisplay.source = "assets/right.png";
			rightDisplay.width = rightDisplay.height = 18;
			rightDisplay.x = 6;
			rightDisplay.y = 12;
			addChild(rightDisplay);
			
			labelDisplay.textAlign = TextAlign.LEFT;
			labelDisplay.leftMargin = 8
			
			inputDisplay = new TextInput();
			inputDisplay.x = 30;
			inputDisplay.selectable = inputDisplay.editable = false;
			inputDisplay.backgroundColor = CocoUI.themeBackgroundColor;
			addChild(inputDisplay);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			labelDisplay.text = DataManager.getInstance().answerTitles[index];
			inputDisplay.text = data.name;
			rightDisplay.visible = false;
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			inputDisplay.width = width - inputDisplay.x;
			inputDisplay.height = height;
		}
		
		override protected function drawSkin():void
		{
			graphics.clear();
			graphics.lineStyle(borderThickness, borderColor, borderAlpha, true);
			graphics.beginFill(backgroundColor, backgroundAlpha);
			graphics.drawRoundRectComplex(0, 0, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
			graphics.endFill();
			
			rightDisplay.visible = selected;
		}
		
		
	}
}