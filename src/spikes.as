package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	public class spikes extends Entity 
	{
		
		[Embed(source='assets/spikes-resize.png')] private const SPIKE:Class;
		
		public function spikes(posX:int,posY:int) 
		{
			graphic=new Image(SPIKE);
			setHitbox(30, 17);
			type = "spike";
			x = posX * 30;
			y=posY*17;
		}
		
	}

}