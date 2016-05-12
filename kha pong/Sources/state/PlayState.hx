package state;

import kha.graphics2.Graphics;
import kha.Image;
import kha.Assets;

import Pong;
import ui.Button;

class PlayState {
    
    public var imgMenu:Image;
    public var btnMenu:Button;
    
    public function new() {
        imgMenu = Assets.images.menu;
		btnMenu = new Button(imgMenu, Pong.WIDTH - 42, 8);
	}

	public function update():Void {
		
	}

	public function render(graphics:Graphics):Void {
		btnMenu.render(graphics);
	}
    
    public function reset(){
		// ball.x = 400;
		// ball.y = 30;
		// player.x = 400;
		// player.y = 550;
	}
    
}