package com.qd.core.controller.delegate
{
	import flash.events.Event;

	public class XMLEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		
		public static const ERESULT:int = 2;
		public static const ERROR:int = 1;
		
		public var xml:XML;
		public var merror:String;
		public var etype:int = 1;
		
		
		public function XMLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}