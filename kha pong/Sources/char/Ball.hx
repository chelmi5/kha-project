package char;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

import Pong;

class Ball {
    public var x:Int;
    public var y:Int;
    public var dirX = 6;
    public var dirY = 3;
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
        
        checkBounds();
    }
    
    public function render(graphics:Graphics){
        graphics.fillCircle(x, y, size);
    }
    
    public function checkBounds(){
        if(this.y <= 0)
		{
			this.dirY = -this.dirY;
		}
		
		if(this.y + this.height >= Pong.HEIGHT) {
			this.dirY = -this.dirY;
		}
        /*
        //if either of these happen, means player missed the ball
        if(this.x <= 0) {
            //right player gets a point
            resetAndRandomize();
			//this.dirX = -this.dirX;
		}
		
		if(this.x + this.width >= Pong.WIDTH) {
            //left player gets a point
            resetAndRandomize();
			// this.dirX = -this.dirX;
		}
        */
    }
    
    public function resetAndRandomize(){
        
        this.x = 400;
        
        if (Math.random() > 0.5) {
            this.y = 200;
        }
        else {
            this.y = 400;
        }
        
        
        if (Math.random() > 0.5) {
            dirX = -dirX;
        }
        else {
            dirY = -dirY;   
        }
    }
    
    public function reset(){
        this.x = 400;
		this.y = 300;
    }
}