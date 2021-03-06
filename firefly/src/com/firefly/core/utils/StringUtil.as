// =================================================================================================
//
//	Firefly Framework
//	Copyright 2013 in4ray. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package com.firefly.core.utils
{
	import avmplus.getQualifiedClassName;

	/** Utility class that helps to work with strings. */	
	public class StringUtil
	{
		/** Interpolate string with arguments.
		 *  @param msg String message need to interpolate. 
		 *  @param args Array of arguments.
		 *  @return Interpolated string. */	
		public static function interpolateSting(msg:String, args:Array):String
		{
			for (var i:int = 0; i < args.length; i++) 
			{
				msg = msg.replace(new RegExp("\\{"+i+"\\}", "g"), args[i]);
			}
			
			return msg;
		}
		
		/** Get class name. 
		 *  @param value Class or instance.
		 *  @return name of class without packages */		
		public static function getClassName(value:*):String
		{
			return getQualifiedClassName(value).split("::")[1];
		}
	}
}