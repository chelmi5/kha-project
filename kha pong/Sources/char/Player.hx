package char;

import kha.graphics2.Graphics;
import Pong;

class Player {
    public var x:Int;
    public var y:Int;
    public var speed:Int;
    public var width(get, null):Int;
    public var height(get, null):Int;
    public var goingUp:Bool;
    public var goingDown:Bool;
    
    public function get_width():Int {
        return this.width;
    }
    
    public function get_height():Int {
        return this.height;
    }
    
    public function new(x, y){
        this.x = x;
        this.y = y;
        speed = 6;
        width = 12;
        height = 124;
        goingUp = false;
        goingDown = false;
    }
    
    public function update(){
        
		if(this.goingUp) {
			this.y -= speed;
		}
		if (this.goingDown){
			this.y += speed;
		}
		checkBounds();
	}
	
	public function render(graphics:Graphics){
		graphics.fillRect(x, y, width, height);
	}
    
    public function checkBounds() {
        if(this.y <= 0) {
			this.y = 0;
		}
		
		if (this.y + this.height >= Pong.HEIGHT){
			this.y = Pong.HEIGHT - this.height;
		}
    }
}