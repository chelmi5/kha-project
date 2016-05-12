package;

import kha.Framebuffer;
import kha.input.Mouse;

import state.PlayState;
import state.MenuState;

enum GameState {
    Menu;
    Play;
    Retry;
}

class Pong {
    
    public var gameState:GameState;
    public var menuState:MenuState;
    public var playState:PlayState;
    
    public static inline var WIDTH = 800;
    public static inline var HEIGHT = 600;
    
	public function new(){
		setupStates();
        
        setMenuState();
        
        Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update(){
		switch (gameState){
            case GameState.Play:
                playState.update();
            
            default: return;
        }
	}

	public function render(framebuffer:Framebuffer){
        var graphics = framebuffer.g2;
        graphics.begin();
        
        switch (gameState){
            case GameState.Menu:
                menuState.render(graphics);
            case GameState.Play:
                playState.render(graphics);
            default: return;
        }
        
        graphics.end();
		
	}
    
    public function setupStates(){
        menuState = new MenuState();
        menuState.btnPlay.onClick = setPlayState;
        playState = new PlayState();
        playState.btnMenu.onClick = setMenuState;
    }
    
    public function setMenuState(){
        gameState = GameState.Menu;
    }
    
    public function setPlayState(){
        gameState = GameState.Play;
    }
    
    public function onMouseDown(button:Int, x:Int, y:Int){
		switch (gameState){
			case GameState.Menu:
				if (button == 0) menuState.btnPlay.onMouseDown(x, y);
			case GameState.Play:
				if (button == 0){
					playState.btnMenu.onMouseDown(x, y);
					playState.reset();
				}
		default: return;
		}
	}
}
