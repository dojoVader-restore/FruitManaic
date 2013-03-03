/**
*@author Okeowo Aderemi
*@description A Simple Boilerplate to serve as Processing Game Engine
**/

class GameEngine{


	private StageDisplayable _levelHandler;
	private AudioPlayer _soundManager;
	private Panel _statusPanel;
	void addLevel(StageDisplayable obj){
	//if the current level is null then add to it if not make null
	if(null != _levelHandler){
	_levelHandler=null;
	_levelHandler=obj;
	
	}

	}

	StageDisplayable getLevel(){
	return this._levelHandler;
	}

	void setSoundManager(AudioPlayer sound){
	if(null != _soundManager){
	_soundManager=null;
	_soundManager=sound;
	
	}
	}

	AudioPlayer getSoundManager(){
	return _soundManager;
	}

	Panel getStatusPanel(){
	return _statusPanel;
	}

	void setStatusPanel(Panel panel){
	if(null != _statusPanel){
	_statusPanel=null;
	_statusPanel=panel;
	
	}
	}
}
/**
*@description Anything to be drawn on the stage must fulfill setup and draw since interface is missing
**/
interface StageDisplayable{
	public void setup();
	public void draw();
}
/**
*@description A Level that takes and draws the interface to the screen
**/

class Panel{
	private int time;
	private String stageStatus;
	private int scoresStatus;


}
/**
*StateMachine to Hold the Game States
**/
static class StateMachine{
public static int StateMachine=0;	
private static final int GameState_MAINSCREEN=2;
private static final int GameState_SELECTSCREEN=4;
private static final int GameState_GAMESTART=8;
private static final int GameState_GAMETIMEOUT=16;
private static final int GameState_GAMEOVER=32;
private static final int GameState_HIGHSCORES=64; 	
}

