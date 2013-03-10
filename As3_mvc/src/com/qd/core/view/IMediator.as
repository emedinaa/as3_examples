package com.qd.core.view 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public interface IMediator 
	{
		function app():void;
		function load($data:Object=null):void;
		function unload():void;
		function resize(e:Event = null):void;
		function update($data:Object = null):void;
		
		function get view():DisplayObjectContainer;
	}
	
}