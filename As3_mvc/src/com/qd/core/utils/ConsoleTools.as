package com.qd.core.utils 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public class ConsoleTools 
	{
		
		public function ConsoleTools() 
		{
			
		}
		public static function console($message:String):void
		{
			if (ExternalInterface.available)
			{
				if (BrowserUtils.getUserAgent() != BrowserUtils.IE)
				{
					ExternalInterface.call("console.log", "QD AS3 >>>> " + $message);
				}
			}
			trace("QD >>>>> "+$message);
		}
		
	}

}