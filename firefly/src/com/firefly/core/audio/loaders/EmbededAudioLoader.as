// =================================================================================================
//
//	Firefly Framework
//	Copyright 2013 in4ray. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package com.firefly.core.audio.loaders
{
	import com.firefly.core.async.Future;
	
	import flash.media.Sound;
	import flash.utils.ByteArray;
	
	import avmplus.getQualifiedClassName;

	/** Loader that loads embeded audio source. */	
	public class EmbededAudioLoader implements IAudioLoader
	{
		private var _data:*;
		private var _source:Class;
		
		/** Constructor.
		 *  @param source Embeded Audio source. */		
		public function EmbededAudioLoader(source:Class)
		{
			_source = source;
		}
		
		/** @inheritDoc */
		public function get data():* { return _data; }
		
		/** @inheritDoc */
		public function get id():* { return _source; }
		
		/** @inheritDoc */
		public function load():Future
		{
			var sound:* = new _source();
			
			if(sound is ByteArray)
			{
				_data = sound as ByteArray;
			}
			else if(sound is Sound)
			{
				_data = sound as Sound;
			}
			
			return Future.nextFrame();
		}
		
		/** @inheritDoc */
		public function release():void
		{
			_data = null;
		}
	}
}