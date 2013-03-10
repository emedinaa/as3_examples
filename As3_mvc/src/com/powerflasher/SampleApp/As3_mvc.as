package com.powerflasher.SampleApp {
	import com.powerflasher.SampleApp.view.GameMediator;
	import com.powerflasher.SampleApp.view.HomeMediator;
	import com.qd.core.view.IMediator;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;

	public class As3_mvc extends Sprite {
		
		private var _homemed : HomeMediator;
		private var _gamemed : GameMediator;
		public var _current : IMediator = null;
		private var _contentMediator : Sprite;
				
		public function As3_mvc() {
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//stage--------------------------------------------
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP_LEFT;
			
			//Global -----------------------------
			Global.FLASHVARS = LoaderInfo(this.root.loaderInfo).parameters;
			Global.ROOT = this;
			
			
			//mediator ---------------------------------------
			_contentMediator = new Sprite();
			addChild(_contentMediator);
			
			_homemed = new HomeMediator(new HomeScreen()) ;
			_gamemed = new GameMediator(new GameScreen()) ;
			
			_contentMediator.addChild(_homemed.view);
			_contentMediator.addChild(_gamemed.view);

			trace("sw ",stage.stageWidth, " sh ",stage.stageHeight);
			
			//event ------------------------
			stage.addEventListener(Event.RESIZE, RESIZE_handler);
			
			//init mediator
			changeMediator("home");
			RESIZE_handler(null);
		}

		private function RESIZE_handler(e : Event) : void {
			//center content mediator
			//_contentMediator.x=stage.stageWidth*0.5;
			//contentMediator.x=stage.stageHeight*0.5;
		}
		
		
		
		public function changeMediator($name:String,$data:Object=null):void
		{
			if (_current)
			{
				_current.unload();
				_current.view.visible = false;
			}
			var obj:IMediator = factoryMed($name);
			if (obj)
			{
				_current = obj;
				_current.view.visible = true;
				_current.load($data);
			}
		}
		
		private function factoryMed($name:String):IMediator
		{
			switch($name)
			{
				case 'home':
					return _homemed;
				case 'game':
					return _gamemed;				

				case 'tyc':
					return null;
			}
			return null;
		}
	}
}
