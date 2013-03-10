package com.qd.core.utils 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public class VersionTools extends Sprite
	{
		private var _txt:String = "1.0";
		private var _txtf:TextField;
		
		public function VersionTools($version:String="1.0") 
		{
			_txt = $version;
			addEventListener(Event.ADDED_TO_STAGE, ADDED_TO_STAGE_handler);
		}
		
		private function ADDED_TO_STAGE_handler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, ADDED_TO_STAGE_handler);
			var w:Number = stage.stageWidth;
			var h:Number = stage.stageHeight;
			
			var format:TextFormat = new TextFormat();
			format.bold = true;
			format.size = 12;
			format.color = 0x000000;
			format.align = TextFormatAlign.LEFT;
			
			
			_txtf = new TextField();
			addChild(_txtf);
			_txtf.defaultTextFormat = format;
			_txtf.backgroundColor = 0xFFFFFF;
			_txtf.background=true
			_txtf.border = true;
			_txtf.wordWrap = true;
			_txtf.multiline = true;
			_txtf.height = 25;
			_txtf.width = 400;

			
			_txtf.text = "VERSION BETA  "+_txt;
			_txtf.x = 20;
			//_txtf.y = 0.95 * h;
			_txtf.y = 10;
			_txtf.alpha = 0.7;
		}
		
		public function append($txt:String):void
		{
			if ($txt == null) return;
			_txtf.appendText("\n"+$txt);
		}
		
	}

}