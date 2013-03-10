package com.qd.core.utils 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author EduardoJosé Medina Alfaro
	 */
	public class Delay 
	{
		private var _timer:Timer;
		private var _function:Function;
		
		public function Delay($function:Function,$seg:int=5,$time:int=1000) 
		{
			_function = $function;
			
			_timer = new Timer($time, $seg);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, TIMER_COMPLETE_handler);
			_timer.start();
		}
		
		private function TIMER_COMPLETE_handler(e:TimerEvent):void 
		{
			//trace("complete timer---------",_function);
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, TIMER_COMPLETE_handler);
			_function.apply();
		}
		public function stop():void
		{
			if (_timer)
			{
				_timer.stop();
				_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, TIMER_COMPLETE_handler);
			}
		}
	}

}