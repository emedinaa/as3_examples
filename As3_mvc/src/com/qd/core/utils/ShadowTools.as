package com.qd.core.utils 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;

	/**
	 * ...
	 * @author ...
	 */
	public class ShadowTools 
	{
		
		public function ShadowTools() 
		{
			
		}
		public static function addShadowMc($mc:Sprite,$color:uint,$strength:int):void
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = $color;
			myDropShadowFilter.strength = $strength;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 
			
			$mc.filters = myFiltersArray;
		}
		public static function addShadowBtn($mc:SimpleButton,$color:uint,$strength:int):void
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = $color;
			myDropShadowFilter.strength = $strength;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 
			
			$mc.filters = myFiltersArray;
		}
		
		public static function addShadowDO($mc:DisplayObject,$color:uint,$strength:int):void
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = $color;
			myDropShadowFilter.strength = $strength;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 
			
			$mc.filters = myFiltersArray;
		}
		public static function removeFilter($mc:Sprite):void
		{	
			$mc.filters = [];
		}
		
		public static function removeFilterDO($mc:DisplayObject):void
		{	
			$mc.filters = [];
		}	
	}

}