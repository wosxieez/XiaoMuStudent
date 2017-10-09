package com.xiaomu.manager
{
	import com.xiaomu.data.Student;
	import com.xiaomu.event.DataManagerEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.SharedObject;
	
	[Event(name="teamDataChanged", type="com.xiaomu.event.DataManagerEvent")]
	
	[Event(name="studentDataChanged", type="com.xiaomu.event.DataManagerEvent")]
	
	[Event(name="questionDataChanged", type="com.xiaomu.event.DataManagerEvent")]
	
	[Event(name="answerDataChanged", type="com.xiaomu.event.DataManagerEvent")]
	
	/**
	 * 数据管理器 
	 * @author coco
	 * 
	 */	
	public class DataManager extends EventDispatcher
	{
		public function DataManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Get Instance
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		private static var instance:DataManager;
		
		public static function getInstance():DataManager
		{
			if (!instance)
				instance = new DataManager();
			
			return instance;
		}
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Properties
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		public var appVersionNumber:String;
		public var appVersionLabel:String;
		
		public var answerTitles:Array = ["A", "B", "C", "D", "E", "F", "H", "I", "J", "K"];
		
		/**
		 * 当前的学生数据 
		 */		
		public var student:Student = new Student();
		
		private var _teams:Array = [];
		
		/**
		 * 当前的小组数据
		 */
		public function get teams():Array
		{
			return _teams;
		}
		
		/**
		 * @private
		 */
		public function set teams(value:Array):void
		{
			_teams = value;
			
			var e:DataManagerEvent = new DataManagerEvent(DataManagerEvent.TEAM_DATA_CHANGED);
			dispatchEvent(e);
		}
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Methods
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		public function setShareObjectValue(key:String, value:String):void
		{
			SharedObject.getLocal("xiaomustudent").data[key] = value;
			SharedObject.getLocal("xiaomustudent").flush();
		}
		
		public function getShareObjectValue(key:String):String
		{
			if (SharedObject.getLocal("xiaomustudent").data[key] != undefined)
			{
				return SharedObject.getLocal("xiaomustudent").data[key];
			}
			else
			{
				return null;
			}
		}
		
		
	}
}