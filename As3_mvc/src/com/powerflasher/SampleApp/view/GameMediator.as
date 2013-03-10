package com.powerflasher.SampleApp.view {
	import com.powerflasher.SampleApp.Global;
	import flash.events.MouseEvent;
	import com.qd.core.view.QdMediator;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author emedinaa
	 */
	public class GameMediator extends QdMediator {
		
		private var _mview:GameScreen;
			
		public function GameMediator($view : DisplayObjectContainer) {
			super($view);
			_mview = $view as GameScreen;
		}

		override public function load($data : Object = null) : void {
			super.load($data);
			
		}

		override protected function CLICK_handler(e : MouseEvent) : void {
			super.CLICK_handler(e);
						if(e.currentTarget==_mview.btn)
			{
				Global.ROOT.changeMediator("home");
			}
		}

		override public function unload() : void {
			super.unload();
		}

	}
}
