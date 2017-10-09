package com.xiaomu.view.menuview
{
	import com.xiaomu.component.IconButton;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.manager.ServiceManager;
	import com.xiaomu.util.Theme;
	import com.xiaomu.view.otherview.SettingView;
	
	import flash.events.MouseEvent;
	
	import coco.component.Image;
	import coco.component.Label;
	import coco.core.UIComponent;
	
	public class MenuView extends UIComponent
	{
		public function MenuView()
		{
			super();
			
			height = 40;
			
			addEventListener(MouseEvent.MOUSE_DOWN, this_mouseDownHandler);
		}
		
		
		private var logoDisplay:Image;
		private var titleDisplay:Label;
		private var openTeamButton:IconButton;
		private var closeAppButton:IconButton;
		
		override  protected function createChildren():void
		{
			super.createChildren();
			
			logoDisplay = new Image();
			logoDisplay.source = "assets/logo.png";
			logoDisplay.width = 41;
			logoDisplay.x = 15;
			logoDisplay.height = 11;
			addChild(logoDisplay);
			
			titleDisplay = new Label();
			titleDisplay.text = "小木答题-学生端" + DataManager.getInstance().appVersionNumber;
			titleDisplay.color = 0xFFFFFF;
			titleDisplay.fontSize = 15;
			titleDisplay.bold = true;
			titleDisplay.x = 60;
			addChild(titleDisplay);
			
			closeAppButton = new IconButton();
			closeAppButton.source = "assets/close1.png";
			closeAppButton.addEventListener(MouseEvent.CLICK, closeAppButton_clickHandler);
			addChild(closeAppButton);
			
			openTeamButton = new IconButton();
			openTeamButton.source = "assets/setting1.png";
			openTeamButton.addEventListener(MouseEvent.CLICK, openTeamButton_clickHandler);
			addChild(openTeamButton);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			logoDisplay.y = (height - logoDisplay.height) / 2;
			
			titleDisplay.height = height;
			
			closeAppButton.x = width - 10 - closeAppButton.width;
			closeAppButton.y = (height - closeAppButton.height) / 2;
			
			openTeamButton.x = closeAppButton.x - 10 - openTeamButton.width;
			openTeamButton.y = closeAppButton.y;
		}
		
		override protected function drawSkin():void
		{
			graphics.clear();
			graphics.lineStyle(1, Theme.COLOR4);
			graphics.beginFill(Theme.COLOR4);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
		protected function this_mouseDownHandler(event:MouseEvent):void
		{
			stage.nativeWindow.startMove();
		}
		
		protected function closeAppButton_clickHandler(event:MouseEvent):void
		{
			ServiceManager.getInstance().dispose();
			stage.nativeWindow.close();
		}
		
		protected function openTeamButton_clickHandler(event:MouseEvent):void
		{
			SettingView.getInstance().open();
		}
		
	}
}