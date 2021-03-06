// =================================================================================================
//
//	Zombie: Rising Up
//	Copyright 2013 in4ray. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================
package com.in4ray.games.zombie.risingup.views.splash
{
	import com.in4ray.gaming.components.flash.Splash;
	import com.in4ray.gaming.components.flash.TextField;
	
	import flash.text.TextFormat;
	
	
	public class GameSplash extends Splash
	{
		
		public function GameSplash(readyToRemove:Boolean = true)
		{
			super(readyToRemove);
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			// Game name
			var gameName:TextField = new TextField();
			gameName.text = "Game Splash";
			gameName.setActualSize(300, 100);
			gameName.setTextFormat(new TextFormat(null, 30));
			addElement(gameName);
		}
		
		override public function setActualSize(w:Number, h:Number):void
		{
			super.setActualSize(w, h);
			
			graphics.clear();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0,0,w,h);
			graphics.endFill();
		}
	}
}