package com.xiaomu.view.otherview
{
	import com.xiaomu.event.DataManagerEvent;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.manager.ServiceManager;
	import com.xiaomu.renderer.TeamItemRenderer;
	
	import flash.events.MouseEvent;
	
	import coco.component.Button;
	import coco.component.Label;
	import coco.component.List;
	import coco.component.Panel;
	import coco.component.TextInput;
	import coco.data.Message;
	import coco.manager.PopUpManager;
	
	/**
	 * 团队视图 
	 * @author coco
	 */	
	public class SettingView extends Panel
	{
		public function SettingView()
		{
			super();
			
			title = "设置";
			width = 400;
			height = 350;
			DataManager.getInstance().addEventListener(DataManagerEvent.TEAM_DATA_CHANGED, teamChangeHandler);
		}
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Get Instance
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		private static var instance:SettingView;
		
		public static function getInstance():SettingView
		{
			if (!instance)
				instance = new SettingView();
			
			return instance;
		}
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Properties
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		private var nameTitle:Label;
		private var nameInput:TextInput;
		private var teamTitle:Label;
		private var teamList:List;
		private var cancelButton:Button;
		private var okButton:Button;
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Methods
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			nameTitle = new Label();
			nameTitle.width = 70;
			nameTitle.height = 30;
			nameTitle.x = 10;
			nameTitle.y = 10;
			nameTitle.text = "学生姓名:";
			addChild(nameTitle);
			
			nameTitle = new Label();
			nameTitle.width = 70;
			nameTitle.height = 30;
			nameTitle.x = 10;
			nameTitle.y = 10;
			nameTitle.text = "学生姓名:";
			addChild(nameTitle);
			
			nameInput = new TextInput();
			nameInput.x = 90;
			nameInput.y = 10;
			nameInput.height = 30;
			addChild(nameInput);
			
			teamTitle = new Label();
			teamTitle.width = 70;
			teamTitle.height = 30;
			teamTitle.x = 10;
			teamTitle.y = 50;
			teamTitle.text = "选择小组:";
			addChild(teamTitle);
			
			teamList = new List();
			teamList.labelField = "name";
			teamList.y = 50;
			teamList.x = 90;
			teamList.gap = 10;
			teamList.itemRendererClass = TeamItemRenderer;
			addChild(teamList);
			
			cancelButton = new Button();
			cancelButton.label = "取消";
			cancelButton.height = 30;
			cancelButton.addEventListener(MouseEvent.CLICK, cancelButton_clickHandler);
			addChild(cancelButton);
			
			okButton = new Button();
			okButton.label = "确定";
			okButton.height = 30;
			okButton.addEventListener(MouseEvent.CLICK, okButton_clickHandler);
			addChild(okButton);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			nameInput.text = DataManager.getInstance().student.name;
			
			var teams:Array = DataManager.getInstance().teams;
			teamList.dataProvider = teams;
			for (var i:int = 0; i < teams.length; i++)
			{
				if (teams[i].id == DataManager.getInstance().student.teamID)
				{
					teamList.selectedIndex = i;
					break;
				}
			}
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			nameInput.width = width - 10 - nameInput.x;
			
			cancelButton.width = width/2;
			cancelButton.y = contentHeight - cancelButton.height;
			
			okButton.width = cancelButton.width;
			okButton.x = cancelButton.width;
			okButton.y = cancelButton.y;
			
			teamList.width = width - 10 - teamList.x;
			teamList.height = okButton.y - 10 - teamList.y;
		}
		
		protected function teamChangeHandler(event:DataManagerEvent):void
		{
			invalidateProperties();
		}
		
		protected function okButton_clickHandler(event:MouseEvent):void
		{
			// 更新学生数据
			DataManager.getInstance().student.name = nameInput.text;
			
			if (teamList.selectedItem)
				DataManager.getInstance().student.teamID = teamList.selectedItem.id;
			else
				DataManager.getInstance().student.teamID = "";
			
			// 发送给老师
			var message:Message = new Message();
			message.type = "student";
			message.content = DataManager.getInstance().student;
			ServiceManager.getInstance().sendMessage(message);
				
			// 关闭窗口
			close();
		}
		
		protected function cancelButton_clickHandler(event:MouseEvent):void
		{
			close();
		}
		
		public function open():void
		{
			invalidateProperties();
			PopUpManager.centerPopUp(PopUpManager.addPopUp(this));
		}
		
		public function close():void
		{
			PopUpManager.removePopUp(this);
		}
		
	}
}