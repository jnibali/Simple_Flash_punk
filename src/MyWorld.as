package
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.*;
	public class MyWorld extends World
	{
		
		public function MyWorld()
		{
			
			
			add(new MyEntity());
			
			
			
			
			for (var i:int=0; i<500; i++) {
				add(new theWall(i,10));
				
			}
			
			for (var j:int = 10; j < 500; j += 7) {
				
				
				add(new spikes(j, 14))
			
			}
		}
		
		
	
	}
}