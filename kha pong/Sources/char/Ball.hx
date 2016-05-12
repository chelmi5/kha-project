package char;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Ball {
    public var x:Int;
    public var y:Int;
    public var dirX = 4;
    public var dirY = 6;
    public var size = 8;
    public var width(get, null):Int;
	public var height(get, null):Int;
    
    public function get_width():Int{
		return this.width;
	}
	
	public function get_height():Int{
		return this.height;
	}
    
    public function new(x:Int, y:Int){
        this.x = x;
        this.y = y;
        width = 3;
        height = 3;
    }
    
    public function update(){
        x += dirX;
        y += dirY;
    }
    
    public function render(graphics:Graphics){
        graphics.fillCircle(x, y, size);
    }
}