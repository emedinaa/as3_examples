package com.qd.core.utils 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	/**
	 * ...
	 * @author ...
	 */
	public class ValidateForm 
	{
		
		public function ValidateForm() 
		{
			
		}
		public static function filterError($txt:TextField):void {
			//var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			//myDropShadowFilter.color = 0xFF0000;
			//myDropShadowFilter.strength = 1;
			//var myFiltersArray:Array = new Array(myDropShadowFilter); 	
			//$txt.filters = myFiltersArray;		
		}		
		
		public static function filterErrorA($txt:TextField):void 
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = 0xFF0000;
			myDropShadowFilter.strength = 1;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 	
			$txt.filters = myFiltersArray;		
		}		
		
		public static function filterErrorMC($mc:MovieClip):void 
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = 0xFF0000;
			myDropShadowFilter.strength = 1;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 	
			$mc.filters = myFiltersArray;		
		}
		
		public static function clearfilterErrorMC($mc:MovieClip):void 
		{	
			$mc.filters = [];		
		}
		
		public static function filterGood($txt:TextField):void {
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = 0x000000;
			myDropShadowFilter.strength = 0;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 	
			$txt.filters = myFiltersArray;		
		}

		public static function validateEmail(txt:TextField):Boolean 
		{
			var emailExpression:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
			if (emailExpression.test(txt.text)) {
				ValidateForm.filterGood(txt);	
				return true;
			}
			ValidateForm.filterError(txt);
			return false;
		}
		public static function validateText(txt:TextField):Boolean {
			//var emailExpression:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
			if (txt.text.length>2) {
				ValidateForm.filterGood(txt);	
				return true;
			}
			ValidateForm.filterError(txt);
			return false;
		}
		public static function validateMovil(txt:TextField):Boolean {
			//var pattern:RegExp = /[0-9]d{9}/;
			if (txt.text.length > 9 && txt.text.length < 6){
				trace("telefono invalido");
				ValidateForm.filterError(txt);
				return false;
			}
			ValidateForm.filterGood(txt);
			return true;
		}		
		
		public static function validatePhone(txt:TextField):Boolean {
			//var pattern:RegExp = /[0-9]d{9}/;
			if ( txt.text.length < 5){
				//trace("telefono invalido");
				//ValidateForm.filterError(txt);
				return false;
			}
			//ValidateForm.filterGood(txt);
			return true;
		}
		
		static public function validateDNI(txt:TextField):Boolean 
		{
			if (txt.text.length !=8){
				trace("telefono invalido");
				ValidateForm.filterError(txt);
				return false;
			}
			ValidateForm.filterGood(txt);
			return true;
		}
		
		public static function showErrorShadow($mc:DisplayObject,$color:uint,$strength:int):void
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = $color;
			myDropShadowFilter.strength = $strength;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 
			
			$mc.filters = myFiltersArray;
		}
		
		
	}

}