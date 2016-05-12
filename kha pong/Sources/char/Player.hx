package char;

import kha.graphics2.Graphics;

class Player {
    public var x:Int;
    public var y:Int;
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
    
    public function upTrue(){
        this.goingUp = true;
    }
    
    public function upFalse(){
        this.goingUp = false;
    }
    
    public function downTrue(){
        this.goingDown = true;
    }
    
    public function downFalse(){
        this.goingDown = false;
    }
    
    public function new(x, y){
        this.x = x;
        this.y = y;
        width = 12;
        height = 124;
        goingUp = false;
        goingDown = false;
    }
    
    public function update(){
		
	}
	
	public function render(graphics:Graphics){
		graphics.fillRect(x, y, width, height);
	}
}