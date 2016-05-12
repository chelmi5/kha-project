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
	
	public var leftPoints:Int;
	public var rightPoints:Int;
    
    public function new() {
        imgMenu = Assets.images.menu;
		btnMenu = new Button(imgMenu, Pong.WIDTH - 42, 8);
		
		leftPlayer = new Player(75, 250);
		rightPlayer = new Player(725, 250);
		ball = new Ball(400, 300);
		
		leftPoints = 0;
		rightPoints = 0;
		
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update() {
		ball.update();
		leftPlayer.update();
		rightPlayer.update();
		playerBallCheck();
		pointCheck();
		//Keeping score, need way to display it?
	}

	public function render(graphics:Graphics) {
		btnMenu.render(graphics);
		leftPlayer.render(graphics);
		rightPlayer.render(graphics);
		ball.render(graphics);
	}
	
	public function pointCheck() {
		//if either of these happen, means player missed the ball
        if(ball.x <= 0) {
            //right player gets a point
			rightPoints++;
			trace("Current Score: ");
			trace("Right Player: " + rightPoints);
			trace("Left Player: " + leftPoints);
            ball.resetAndRandomize();
		}
		
		if(ball.x + ball.width >= Pong.WIDTH) {
            //left player gets a point
			leftPoints++;
			trace("Current Score: ");
			trace("Right Player: " + rightPoints);
			trace("Left Player: " + leftPoints);
            ball.resetAndRandomize();
		}
	}
	
	public function playerBallCheck() {
		if(overlaps(ball, leftPlayer) || overlaps(ball, rightPlayer)) {
			ball.dirX = -ball.dirX;
		}
	}
	
	public function overlaps(ball:Ball, player:Player):Bool {
    return ball.x <= player.x + player.width && 
           ball.x + ball.width >= player.x && 
           ball.y <= player.y + player.height && 
           ball.y + ball.height >= player.y;
  }
	
	public function onKeyDown(key:Key, value:String) {
		switch (key) {
			case CHAR:
				if (value == "w"){
					leftPlayer.goingUp = true;
				}
				if (value == "s"){
					leftPlayer.goingDown = true;
				}
			case UP:
				rightPlayer.goingUp = true;
			case DOWN:
				rightPlayer.goingDown = true;
		default: return;
		}
	}
	
	public function onKeyUp(key:Key, value:String) {
		switch (key) {
			case CHAR:
				if (value == "w"){
					leftPlayer.goingUp = false;
				}
				if (value == "s"){
					leftPlayer.goingDown = false;
				}
			case UP:
				rightPlayer.goingUp = false;
			case DOWN:
				rightPlayer.goingDown = false;
		default: return;
		}
	}
    
    public function reset() {
		ball.reset();
		leftPlayer.x = 75;
		leftPlayer.y = 250;
		rightPlayer.x = 725;
		rightPlayer.y = 250;
	}
    
}