package com.xiaomu.data
{
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.util.UIDUtil;
	
	public class Student
	{

		/**
		 * 学生唯一标示 
		 */		
		public var id:String = "STUDENT_" + UIDUtil.createUID();
		
		/**
		 * 学生姓名
		 */
		public function get name():String
		{
			return DataManager.getInstance().getShareObjectValue("studentname");
		}

		/**
		 * @private
		 */
		public function set name(value:String):void
		{
			DataManager.getInstance().setShareObjectValue("studentname", value);
		}

		/**
		 * 学生所属的团队id
		 */
		public function get teamID():String
		{
			return DataManager.getInstance().getShareObjectValue("studentteamid");
		}

		/**
		 * @private
		 */
		public function set teamID(value:String):void
		{
			DataManager.getInstance().setShareObjectValue("studentteamid", value);
		}

		
	}
}