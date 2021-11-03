package
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class MyEntity extends Entity
	{
		private var power:Number=0.2;
		private var jumpPower:Number=4;
		private var hFriction:Number=0.95;
		private var vFriction:Number=0.99;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var onTheGround:Boolean=false;
		private var gravity:Number=0.3;
		[Embed(source = 'assets/sample-sprite.png')] private const PLAYER:Class;
		[Embed(source = 'assets/mixkit-arcade-retro-jump-223.mp3')] private const jump:Class;
		[Embed(source = 'assets/mixkit-player-losing-or-failing-2042.mp3')] private const loose:Class;
		
		public var jumping:Sfx = new Sfx(jump);
		public var Loose:Sfx = new Sfx(loose);
		
		public function MyEntity()
		{
				graphic = new Image(PLAYER);
				name = 'player';
				setHitbox(13, 26);
				x = 0;
				y = 150;
		}

		override public function update():void
		{
			var pressed:Boolean = false;
			var b:spikes = collide("spike", x, y) as spikes;
		
			if (Input.check(Key.LEFT)) {
				xSpeed-=power;
				pressed=true;
			}
			if (Input.check(Key.RIGHT)) {
				xSpeed+=power;
				pressed=true;
			}
			if (collide("wall",x,y+1)) {
				onTheGround = true;
				
				ySpeed=0;
				if (Input.check(Key.UP)) {
					jumping.play();
					ySpeed-=jumpPower;
				}
			} else {
				ySpeed += gravity;
			}
			if (Math.abs(xSpeed)<1&&! pressed) {
				xSpeed=0;
			}
			xSpeed*=hFriction;
			ySpeed*=vFriction;
			moveBy(xSpeed, ySpeed, "wall");
			
			if (b)
			{
				Loose.play();
				FP.world.remove(this);
			}
			
		}
		
	}
}