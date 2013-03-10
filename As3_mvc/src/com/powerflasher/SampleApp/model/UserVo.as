package com.powerflasher.SampleApp.model 
{
	/**
	 * ...
	 * @author Eduardo José Medina Alfaro
	 */
	public class UserVo 
	{
		private var _userid:String;
		private var _facebookid:String;
		private var _username:String;
		private var _email:String;
		private var _token:String;
		
		public function UserVo() 
		{
			
		}
		
		public function get userid():String 
		{
			return _userid;
		}
		
		public function set userid(value:String):void 
		{
			_userid = value;
		}
		
		public function get facebookid():String 
		{
			return _facebookid;
		}
		
		public function set facebookid(value:String):void 
		{
			_facebookid = value;
		}
		
		public function get username():String 
		{
			return _username;
		}
		
		public function set username(value:String):void 
		{
			_username = value;
		}
		
		public function get email():String 
		{
			return _email;
		}
		
		public function set email(value:String):void 
		{
			_email = value;
		}
		
		public function get token():String 
		{
			return _token;
		}
		
		public function set token(value:String):void 
		{
			_token = value;
		}
		
	}

}