package com.qd.core.controller.command 
{
	import com.qd.core.controller.delegate.XMLDelegate;
	import com.qd.core.controller.delegate.XMLEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author Eduardo Medina A.
	 */
	public class XMLComand
	{
		private var _del:XMLDelegate;
		private var _view:DisplayObject;
		
		public function XMLComand($view:DisplayObjectContainer) 
		{
			//super($view);
			_view = $view;
		}
		
		public function execute($data:* = null):void 
		{
			//super.execute($data);
			if ($data == null) return;
			
			if (_del) { _del.stop() }
			_del = new XMLDelegate();
			_del.addEventListener(XMLEvent.COMPLETE, COMPLETE_handler);
			_del.connect($data.url);
		}
		
		private function COMPLETE_handler(e:XMLEvent):void 
		{
			_del.removeEventListener(XMLEvent.COMPLETE, COMPLETE_handler);
			if (e.etype == XMLEvent.ERESULT)
			{
			   _view['update'](e.xml);
			}else
			{
			  _view['update'](null);
			}
		}
		 public function unexecute():void 
		{
			if (_del) { _del.stop() }
		}
		
	}

}