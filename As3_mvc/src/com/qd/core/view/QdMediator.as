package com.qd.core.view 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public class QdMediator implements IMediator 
	{
		
		private var _view:DisplayObjectContainer;
		private var _vectBtnMovieclip:Vector.<MovieClip>;
		private var _vectBtnButton:Vector.<SimpleButton>;
		
		public function QdMediator($view:DisplayObjectContainer) 
		{
			_view = $view;
			
			app();
		}
		
		/* INTERFACE com.qd.core.view.IMediator */
		
		public function app():void 
		{
			view.visible = false;
			registerButton();
		}
		
		private function registerButton():void 
		{
			_vectBtnMovieclip = new Vector.<MovieClip>();
			_vectBtnButton = new Vector.<SimpleButton>();
			
			var name:String = "";
			var obj:*= null;
			
			for (var i:int = 0; i < _view.numChildren; i++) 
			{
				obj = _view.getChildAt(i);
				name = obj.name;
				name = name.substring(0, 3);
				
				//trace("name ",name);
				//if (name.slice(0, 2);
				if (name == "btn")
				{
					if (obj is SimpleButton)
					{
						_vectBtnButton.push(obj);
					}
					if (obj as MovieClip)
					{
						obj.mouseChildren = false;
						obj.buttonMode = true;
						_vectBtnMovieclip.push(obj);
					}
				}
			}
		}
		
		protected function CLICK_handler(e:MouseEvent):void 
		{
			
		}
		
		public function load($data:Object=null):void 
		{
			resize();
			registerEvent();
		}
		
		private function registerEvent():void 
		{
			for (var i:int = 0; i < _vectBtnButton.length; i++) 
			{
				_vectBtnButton[i].addEventListener( MouseEvent.CLICK, CLICK_handler);
			}
			for (var j:int = 0; j < _vectBtnMovieclip.length; j++) 
			{
				_vectBtnMovieclip[j].addEventListener( MouseEvent.CLICK, CLICK_handler);
			}
		}
		
		public function unload():void 
		{
			if (_vectBtnButton)
			{
				for (var i:int = 0; i < _vectBtnButton.length; i++) 
				{
					_vectBtnButton[i].removeEventListener( MouseEvent.CLICK, CLICK_handler);
				}
			}
			if (_vectBtnMovieclip)
			{
				for (var j:int = 0; j < _vectBtnMovieclip.length; j++) 
				{
					_vectBtnMovieclip[j].removeEventListener( MouseEvent.CLICK, CLICK_handler);
				}
			}
		}
		
		/* INTERFACE com.qd.core.view.IMediator */
		
		public function resize(e:Event=null):void 
		{
			if (view)
			{
				if (view.getChildByName('bg'))
				{
					view.x = view.stage.stageWidth * 0.5 - view['bg'].width * 0.5;
					view.y = (view.stage.stageHeight - view['bg'].height)/2;
					//view.y = - view['bounds'].height/2;
					//trace(view['bounds'].height);
				}else{
					view.x = view.stage.stageWidth * 0.5 - view.width * 0.5;
					view.y = view.stage.stageHeight * 0.5 - view.height * 0.5;
				}
			}
		}
		
		/* INTERFACE com.qd.core.view.IMediator */
		
		public function update($data:Object = null):void 
		{
			
		}
		
		public function get view():DisplayObjectContainer 
		{
			return _view;
		}
		
	}

}