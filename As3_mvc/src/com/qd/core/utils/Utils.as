package com.qd.core.utils 
{
	//import com.quickdev.projects.core.view.AbstractUI;
	//import com.adobe.serialization.json.JSON;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.net.LocalConnection;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author emedinaa
	 */
	public class Utils 
	{
		
		public function Utils() 
		{
			
		}
		public static function  disabledBtn($btn:SimpleButton,$b:Boolean=false):void 
		{
			$btn.mouseEnabled = $b;
		}
		
		public static function  disabledButton($btn:*,$b:Boolean=false):void 
		{
			if ($btn is MovieClip)
			{
				MovieClip($btn).mouseEnabled = $b;
			}else if ($btn is Sprite)
			{
				Sprite($btn).mouseEnabled = $b;
			}else if ($btn is SimpleButton)
			{
				SimpleButton($btn).mouseEnabled = $b;
			}
		}
		
		public static function drawPhoto($mc:Sprite):Bitmap 
		{
			var bmd:BitmapData = new BitmapData($mc.width, $mc.height);//400 328
			bmd.draw($mc,null,$mc.transform.colorTransform);
			var bm:Bitmap = new Bitmap(bmd);
			bm.smoothing = true;
			
			return bm;
		}		
		public static function drawPhotoMC($mc:MovieClip,$w:Number=0,$h:Number=0,$matrix:Matrix=null):Bitmap 
		{
			var bmd:BitmapData = new BitmapData($w, $h);//400 328

			bmd.draw($mc, $matrix, $mc.transform.colorTransform);
			
			var bm:Bitmap = new Bitmap(bmd);
			bm.smoothing = true;
			
			return bm;
		}
		public static function domainLocal():Boolean
		{
			var lc:LocalConnection = new LocalConnection();
			//trace("domain ", lc.domain);
			if (lc.domain == 'localhost')
			{
				return true;
			}
			return false;
		}
		
		public static function copyBitmap($bitmap:Bitmap):Bitmap
		{
			var bmp:BitmapData = $bitmap.bitmapData.clone();
			var bm:Bitmap = new Bitmap(bmp);
			bm.smoothing = true;
			return bm;
		}
		public static  function wrapperCenter($bmp:DisplayObject):void
		{
			var w:Number = $bmp.width;
			var h:Number = $bmp.height;
			
			$bmp.x = -w * 0.5;
			$bmp.y = -h * 0.5;
			
			trace("bmp ",w,h,$bmp.x,$bmp.y);
		}
		public static  function wrapperCenterOFF($bmp:DisplayObject):void
		{
			var w:Number = $bmp.width;
			var h:Number = $bmp.height;
			
			$bmp.x =w* 0.5;
			$bmp.y = h * 0.5;
			
			trace("bmp ",w,h,$bmp.x,$bmp.y);
		}
		
		/*public static function mouseEvents($clip:MovieClip):void
		{
			$clip.addEventListener(MouseEvent.ROLL_OVER, 
				function(evt:MouseEvent) {
					$clip.scaleX = 1.1;
					$clip.scaleY = 1.1;
				}
			);
			
			$clip.addEventListener(MouseEvent.ROLL_OUT, 
				function(evt:MouseEvent) {
					$clip.scaleX = 1;
					$clip.scaleY = 1;					
				}
			);
		}*/
		
		public static function forInObject($obj:Object):String
		{
			var txt:String = "";
			
			for (var s:Object in $obj)
			{
				txt += " = >" + $obj[s] + "\n";
				
				//trace(s + " = >" + $obj[s]);
				for (var sa:Object in s) 
				{
					//trace(sa + " == >" + s[sa]);
					txt += " ==== >" + s[sa] + "\n";
				}
			}
			return txt;
		}
		
		public static function mouseEvents($clip:MovieClip):void
		{
			$clip.addEventListener(MouseEvent.ROLL_OVER, function(evt:MouseEvent)
				{
					$clip.alpha = 0.7;
				});
			
			$clip.addEventListener(MouseEvent.ROLL_OUT, function(evt:MouseEvent)
				{
					$clip.alpha = 1;
				});
		}
		public static function mouseEventsBtn($clip:SimpleButton):void
		{
			$clip.addEventListener(MouseEvent.ROLL_OVER, function(evt:MouseEvent)
				{
					$clip.alpha = 0.7;
				});
			
			$clip.addEventListener(MouseEvent.ROLL_OUT, function(evt:MouseEvent)
				{
					$clip.alpha = 1;
				});
		}
		public static function mouseEventsDO($clip:DisplayObject):void
		{
			$clip.addEventListener(MouseEvent.ROLL_OVER, function(evt:MouseEvent)
				{
					$clip.alpha = 0.7;
				});
			
			$clip.addEventListener(MouseEvent.ROLL_OUT, function(evt:MouseEvent)
				{
					$clip.alpha = 1;
				});
			
				
		}
		
		public static function mouseEventsFilters($clip:DisplayObject,$color:uint=0xFEF599):void
		{
			$clip.addEventListener(MouseEvent.ROLL_OVER, function(evt:MouseEvent)
				{
					//$clip.alpha = 0.7;
					ShadowTools.addShadowDO($clip,$color,4);
				});
			
			$clip.addEventListener(MouseEvent.ROLL_OUT, function(evt:MouseEvent)
				{
					//$clip.alpha = 1;
					ShadowTools.removeFilterDO($clip);
				});
		}
		
		public static function clearcontent():void
		{
			
		}
		/*
		 * 		private function clearContent():void 
		{
		
			while (this['content'].numChildren > 0)
			{
				this['content'].removeChildAt(0);
			}
			this['content'].x = 220;
		}
		 * */
		
		public static function addFilterMc($mc:MovieClip,$color:*=0xff00ff):void
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = $color;
			myDropShadowFilter.strength = 4;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 
			
			$mc.filters = myFiltersArray;
		}		
		
		public static function addFilterBtn($btn:SimpleButton,$color:*=0xff00ff):void
		{
			var myDropShadowFilter:GlowFilter = new GlowFilter(); // Optional - Drop shadow filter
			myDropShadowFilter.color = $color;
			myDropShadowFilter.strength = 4;
			var myFiltersArray:Array = new Array(myDropShadowFilter); 
			
			$btn.filters = myFiltersArray;
		}
		
		public static function removeFilter($mc:DisplayObject):void
		{
			$mc.filters = [];
		}
		public static function traceForManu($msj:String):void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call("console.log", "console >>> "+$msj);
			}
			trace("flash >>> "+$msj);
		}
		
		public static function paseInfo($data:Object):String
		{
			//return JSON.stringify($data);	
			//return $data;
			//return JSON.encode($data);
			return "";
		}
		
	}

}