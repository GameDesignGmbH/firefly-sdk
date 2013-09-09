package test.textures.loaders
{
	import com.firefly.core.firefly_internal;
	import com.firefly.core.textures.loaders.DragonBonesLoader;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	
	use namespace firefly_internal;
	
	public class DragonBonesLoaderTest extends EventDispatcher
	{
		private var _dbLoader:com.firefly.core.textures.loaders.DragonBonesLoader;
		
		[Before]
		public function prepareSWFLoader() : void 
		{
			_dbLoader = new DragonBonesLoader("dbTextures", "../textures/DragonBonesSWF.swf");
		}
		
		[Test(async, timeout="1000")]
		public function loadDBTextures() : void 
		{
			_dbLoader.load().then(function():void
			{
				Assert.assertNotNull(_dbLoader.data);	
				
				dispatchEvent(new Event(Event.COMPLETE));
			});
			
			// wait for completion
			Async.handleEvent(this, this, Event.COMPLETE, function():void{}, 1000);
		}
		
		[Test(async, timeout="1000")]
		public function releaseLoadedData() : void 
		{
			_dbLoader.load().then(function():void
			{
				_dbLoader.unload();
				
				Assert.assertNull(_dbLoader.data);	
				
				dispatchEvent(new Event(Event.COMPLETE));
			});
			
			// wait for completion
			Async.handleEvent(this, this, Event.COMPLETE, function():void{}, 1000);
		}
	}
}