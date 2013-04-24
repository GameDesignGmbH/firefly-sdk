package com.in4ray.gaming.locale
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.Dictionary;
	
	/**
	 * Bundle with localized strings. 
	 */
	public class LocaleBundle
	{
		private static const pattern:RegExp = /\${([^}]*)}/g;
		
		/**
		 * Constructor.
		 *  
		 * @param locale Locale code.
		 * @param path Path for resource file.
		 * 
		 */		
		public function LocaleBundle(locale:String, path:String)
		{
			this.path = path;
			_locale = locale;
		}
		
		private var strings:Dictionary;
		
		private var _locale:String;
		
		/**
		 * Locale code.
		 */		
		public function get locale():String
		{
			return _locale;
		}
		
		/**
		 * Localize String. 
		 * @param text String to localize
		 * @return Localized String
		 */		
		public function localize(text:String):String
		{
			if(strings)
			{
				var res:Array;
				do
				{
					res = pattern.exec(text);
					if(res && res.length >= 2)
					{
						var replace:String = strings[res[1]];
						if(replace)
							text = text.substring(0, pattern.lastIndex - res[0].length) + replace + text.substring(pattern.lastIndex, text.length); 
					}
				}
				while(res)
			}	
			return text;
		}
		
		
		private var path:String;
		
		/**
		 * Load bundle.
		 */		
		public function load():void
		{
			strings = new Dictionary();
			
			var file:File = File.applicationDirectory.resolvePath(path);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var xml:XML = new XML(stream.readUTFBytes(stream.bytesAvailable));
			
			for each (var stringXML:XML in xml.str) 
			{
				strings[stringXML.@key.toString()] = stringXML.@value.toString();
			}
		}
		
		/**
		 * Unload bundle. 
		 */		
		public function unload():void
		{
			strings = null;
		}
	}
}