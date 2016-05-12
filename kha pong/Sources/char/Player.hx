package char;

import kha.graphics2.Graphics;

class Player {
    public var x:Int;
    public var y:Int;
    public var width(get, null):Int;
    public var height(get, null):Int;
    
    public function get_width():Int {
        return this.width;
    }
    
    public function get_height():Int {
        return this.height;
    }
    
    public function new(x, y){
        this.x = x;
        this.y = y;
        width = 124;
        height = 12;
    }
    
    public function update(){
		
	}
	
	public function render(graphics:Graphics){
		graphics.fillRect(x, y, width, height);
	}
}