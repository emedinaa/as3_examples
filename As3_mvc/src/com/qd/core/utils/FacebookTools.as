package com.qd.core.utils 
{
	import com.facebook.graph.Facebook;
	import com.ositos.Global;
	import com.quickdev.StageManager;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public class FacebookTools extends EventDispatcher 
	{
		public static const FBINVITEFRIENDS:String = "fbinvitefriends";
		private var _state:int;
		private var _data:Object;
		
		public function FacebookTools(target:IEventDispatcher=null) 
		{
			super(target);
			
		}
		
		public function connectedFb($data:Object):void 
		{
			_data = $data;
			ConsoleTools.console("connectedFb");

			var token:String= StageManager.getInstance().FlashVars.token_facebook;
			var params:Object = { 
			access_token:token };
			Facebook.api('/me', handleUserInfoAux,params);
		}
		
		private function handleUserInfoAux(response:Object, fail:Object):void 
		{
			if (response)
			{
				
				Global.userfb = { 'name':response['name'], 'email':response['email'] };
				
				ConsoleTools.console(" handleUserInfoAux response "+response+" token ");
				invitefriends(_data);
			}else
			{
				ConsoleTools.console("handleUserInfoAux fail  "+fail);
			}
		}
		
		public  function invitefriends($data:Object):void
		{
			ConsoleTools.console("send invitation ");
			var obj:Object = new Object();
			obj.message = "mensaje";
			obj.title = "title ";
			obj.filters = ['app_non_users'];
			//{
				//message: $data.message,
				//title: $data.title
				//access_token: $data.token
			//};
			//Facebook.ui("apprequests", obj, completeInviteFriends, "iframe");
			//Facebook.ui("apprequests", obj, completeInviteFriends, 'popup');
			//apprequests
			//apprequests
			
			Facebook.ui("apprequests",{message: 'Hey there!', filters: ['app_non_users'],data: 'tracking', title: 'Invite your friend.'},
				completeInviteFriends
			);
		}

		public  function completeInviteFriends(response:Object):void
		{ 
			ConsoleTools.console("completeInviteFriends "+response);
			//field_txt.appendText(res.request_ids);
			if (response)
			{
				 _state= 1;
			}else
			{
				_state = 2;
			}
			dispatchEvent(new Event(FacebookTools.FBINVITEFRIENDS));
		}
		
		public function get state():int 
		{
			return _state;
		}
		

		
	}

}