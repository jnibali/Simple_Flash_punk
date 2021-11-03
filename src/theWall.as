package {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	
	public class theWall extends Entity 
	{
		[Embed(source='assets/Concrete-Texture-resized.png')]
		private const WALL:Class;
		public function theWall(posX:int,posY:int) {
			graphic=new Image(WALL);
			setHitbox(33,25);
			type = "wall"; 
			x=posX*33;
			y=posY*25;
			
		}
	}
}