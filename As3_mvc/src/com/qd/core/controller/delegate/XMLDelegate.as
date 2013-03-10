package com.qd.core.controller.delegate
{
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	
	public class XMLDelegate extends EventDispatcher
	{
		private var urlL:URLLoader;
		
		public function XMLDelegate()
		{
			
		}
		public function connect(url:String):void
		{
			var urlR:URLRequest=new URLRequest();
			urlR.url=url;
			//trace("XMLDelegate url ", urlR.url);
				
			urlL=new URLLoader();
			urlL.addEventListener(Event.COMPLETE, COMPLETE_handler);
			urlL.addEventListener(IOErrorEvent.IO_ERROR, IO_ERROR_handler);
			urlL.load(urlR);
		}
		
		private function IO_ERROR_handler(e:IOErrorEvent):void 
		{
			var errors:String = e.text;
			var evt:XMLEvent = new XMLEvent(XMLEvent.COMPLETE);
			evt.etype = XMLEvent.ERROR;
			evt.merror = errors;
			dispatchEvent(evt);
		}
		
		private function COMPLETE_handler(e:Event):void
		{
			var xml:XML = new XML(e.target.data);
			var evt:XMLEvent = new XMLEvent(XMLEvent.COMPLETE);
			evt.etype = XMLEvent.ERESULT;
			evt.xml = xml;
			dispatchEvent(evt);
		}
		public function stop():void
		{
			if(urlL)
			{
				try
				{
					urlL.close();
				}catch (e:Error)
				{
					
				}
				urlL = null;
			}
		}

	
	}
}