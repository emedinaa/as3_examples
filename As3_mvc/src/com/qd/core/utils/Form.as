package com.qd.core.utils 
{
	//import fl.controls.TextInput;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	/**
	 * ...
	 * @author @autor Eduardo José Medina Alfaro
	@web   www.emedinaa.com
	@email emedinaa@gmail.com
	Flash/Flex/Air Developer
	 */
	public class Form
	{
		
		public function Form() 
		{
			
		}
		private static const ERROR_LENGTH:String="Error : Ingrese un valor correcto";
		
		public static function setRestrictTxtInputLetter(txt:TextField):void
		{
			TextField(txt).restrict = "a-z A-Z á é í ó ú Á É Í Ó Ú ñ Ñ";
		}
		public static function setRestrictTxtEmail(txt:TextField):void
		{
			TextField(txt).restrict = "a-z A-Z @ . _ 0-9 \\-";
		}
		public static function setRestrictTxtNum(txt:TextField):void
		{
			TextField(txt).restrict = "0-9";
		}
		public static function setRestrictTxtDir(txt:TextField):void
		{
			TextField(txt).restrict = "a-z A-Z á é í ó ú Á É Í Ó Ú 0-9 ñ Ñ # . , _ [ ] ( ) : / \\-";
		}
		public static function setRestrictComment(txt:TextField):void
		{
			TextField(txt).restrict = "a-z A-Z á é í ó ú Á É Í Ó Ú 0-9 ñ Ñ # . , _ [ ] ( ) : ? ¿";
		}
		public static function getVal_NAPAM_Error(txt:TextField):String
		{
			if (txt.length < 2)
			{
				return ERROR_LENGTH;
			}
			return "";
		}
		public static function setDNI(txt:TextField):void
		{
			setRestrictTxtNum(txt);
			TextField(txt).maxChars = 8;
		}
		public static function setPassPort(txt:TextField):void
		{
			setRestrictTxtNum(txt);
			TextField(txt).maxChars = 9;
		}
		public static function setNomAPM(txt:TextField):void
		{
			setRestrictTxtInputLetter(txt);
			TextField(txt).maxChars = 40;
		}
		public static function setMovil(txt:TextField):void
		{
			setRestrictTxtNum(txt);
			TextField(txt).maxChars = 9;
		}
		public static function setEmail(txt:TextField):void //5-45
		{
			setRestrictTxtEmail(txt)
			TextField(txt).maxChars = 45;
		}
		
		
	}

}