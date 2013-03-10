package com.qd.core.controller.command 
{
	
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public interface ICommand 
	{
		function execute($data:Object):void;
		function unexecute():void;
	}
	
}