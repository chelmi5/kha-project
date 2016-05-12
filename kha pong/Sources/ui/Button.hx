package ui;

/*
@: author lewis lepton 2016
font used : http://www.1001freefonts.com/rocko.font
*/

import kha.graphics2.Graphics;
import kha.Image;

class Button {
	public var x:Int;
	public var y:Int;
	public var image:Image;
	public var onClick:Void->Void;
	
	public function new(image:Image, ?x:Int, ?y:Int){
		this.x = x;
		this.y = y;
		this.image = image;
	}

	public function render(graphics:Graphics){
		graphics.drawImage(image, x, y);
	}
	
	public function onMouseDown(x:Int, y:Int){
		if (x >= this.x && x <= this.x + image.width && y >= this.y && y <= this.y + image.height){
			if (this.onClick != null) {
				onClick();
			}
			return true;
		}
		return false;
	}
}