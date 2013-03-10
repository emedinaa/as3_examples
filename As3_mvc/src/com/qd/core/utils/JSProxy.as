package com.qd.core.utils 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Eduardo Medina A.
	 */
	public class JSProxy 
	{
		/*
		 * Comunication Flash & JS
		 * */
		public function JSProxy() 
		{
			
		}
		
		public static function callFunction($name:String,$param1:String):void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call($name,$param1);
			}
		}
		public static function registerFlashJS($namefunction:String, $function:Function):void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.addCallback($namefunction, $function);
			}
		}
		/*
		 * ExternalInterface.addCallback("name_of_js_function", name_of_as3_function);
		 * */
		
	}

}