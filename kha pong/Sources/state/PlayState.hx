package state;

import kha.graphics2.Graphics;
import kha.Image;
import kha.Assets;
import kha.Key;
import kha.input.Keyboard;

import Pong;
import ui.Button;
import char.Player;
import char.Ball;

class PlayState {
	
	public var leftPlayer:Player;
	public var rightPlayer:Player;
	public var ball:Ball;
    
    public var imgMenu:Image;
    public var btnMenu:Button;
    
    public function new() {
        imgMenu = Assets.images.menu;
		btnMenu = new Button(imgMenu, Pong.WIDTH - 42, 8);
		
		leftPlayer = new Player(75, 250);
		rightPlayer = new Player(725, 250);
		ball = new Ball(400, 300);
		
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		playersMove();
		checkBounds();
	}

	public function render(graphics:Graphics):Void {
		btnMenu.render(graphics);
		leftPlayer.render(graphics);
		rightPlayer.render(graphics);
		ball.render(graphics);
	}
	
	public function playersMove(){
		//leftPlayer
		if(leftPlayer.goingUp) {
			leftPlayer.y -= 4;
		}
		if (leftPlayer.goingDown){
			leftPlayer.y += 4;
		}
		//rightPlayer
		if(rightPlayer.goingUp) {
			rightPlayer.y -= 4;
		}
		if (rightPlayer.goingDown){
			rightPlayer.y += 4;
		}
	}
	
	public function checkBounds(){
		if(leftPlayer.y <= 0) {
			leftPlayer.y = 0;
		}
		
		if (leftPlayer.y + leftPlayer.height >= 600){
			leftPlayer.y = 600 - leftPlayer.height;
		}
		
		if(rightPlayer.y <= 0) {
			rightPlayer.y = 0;
		}
		
		if (rightPlayer.y + rightPlayer.height >= 600){
			rightPlayer.y = 600 - rightPlayer.height;
		}
	}
	
	public function onKeyDown(key:Key, value:String){
		switch (key){
			case CHAR:
				if (value == "w"){
					leftPlayer.upTrue();
				}
				if (value == "s"){
					leftPlayer.downTrue();
				}
			case UP:
				rightPlayer.upTrue();
			case DOWN:
				rightPlayer.downTrue();
		default: return;
		}
	}
	
	public function onKeyUp(key:Key, value:String){
		switch (key){
			case CHAR:
				if (value == "w"){
					leftPlayer.upFalse();
				}
				if (value == "s"){
					leftPlayer.downFalse();
				}
			case UP:
				rightPlayer.upFalse();
			case DOWN:
				rightPlayer.downFalse();
		default: return;
		}
	}
    
    public function reset(){
		ball.x = 400;
		ball.y = 300;
		leftPlayer.x = 75;
		leftPlayer.y = 250;
		rightPlayer.x = 725;
		rightPlayer.y = 250;
	}
    
}