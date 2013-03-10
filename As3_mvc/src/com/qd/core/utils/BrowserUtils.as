package com.qd.core.utils 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public class BrowserUtils 
	{
		public static const IE:String = "Ie";
		public static const SAFARI:String = "Safari";
		public static const FIREFOX:String = "Firefox";
		public static const CHROME:String = "Chrome";
		public static const OPERA:String = "Opera";
		
		public function BrowserUtils() 
		{
			
		}
		public static function getUserAgent():String
		{
			var userAgent:String;
			var browser:String = "[Unknown Browser]";
			
			if (ExternalInterface.available)
			{
				userAgent = ExternalInterface.call("window.navigator.userAgent.toString");
		 
				if (userAgent.indexOf("Safari") != -1)
				{
					browser = "Safari";
				}
				if (userAgent.indexOf("Firefox") != -1)
				{
					browser = "Firefox";
				}
				if (userAgent.indexOf("Chrome") != -1)
				{
					browser = "Chrome";
				}
				if (userAgent.indexOf("MSIE") != -1)
				{
					//browser = "Internet Explorer";
					browser = "Ie";
				}
				if (userAgent.indexOf("Opera") != -1)
				{
					browser = "Opera";
				}
			}
				
			return browser;
		}
		
	}

}