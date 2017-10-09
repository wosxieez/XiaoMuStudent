package com.xiaomu.data
{
	import com.xiaomu.util.UIDUtil;
	
	/**
	 * 问题
	 *  
	 * @author coco
	 */	
	public class Question
	{
		/**
		 * 问题唯一标示 
		 */		
		public var id:String = "QUESTION_" + UIDUtil.createUID();
		
		/**
		 * 问题的名称
		 */		
		public var name:String;
		
		/**
		 * 问题的答案 
		 */		
		public var answers:Array = [];
		
		/**
		 * 正确答案数目 
		 */		
		public var correctCount:int = 0;
		
	}
}