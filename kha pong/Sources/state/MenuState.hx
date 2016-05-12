package state;

import kha.graphics2.Graphics;
import kha.Image;
import kha.Assets;

import Pong;
import ui.Button;

class MenuState {
    
    public var imgHeader:Image;
    public var imgPlay:Image;
    public var btnPlay:Button;
    
    public function new() {
		imgHeader = Assets.images.header;
        imgPlay = Assets.images.play;
        btnPlay = new Button(imgPlay, 336, 400);
	}

	public function update() {
		
	}

	public function render(graphics:Graphics) {
		graphics.drawImage(imgHeader, Pong.WIDTH / 2 - imgHeader.width / 2, 50);
        btnPlay.render(graphics);
	}
    
}