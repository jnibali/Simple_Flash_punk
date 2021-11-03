package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		public function Main()
		{
			super(800, 600, 60, false);
			
		}

		override public function init():void
		{
			
			FP.screen.color = 0x222233;
			FP.world=new MyWorld();
			trace("FlashPunk has started successfully!");
		}
	}
}


