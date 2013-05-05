	import fisica.util.nonconvex.*; //Fisica Libraries
	import fisica.*; //Physical
	import ddf.minim.*; //The Audio Engine
	import TUIO.*; //Tangible User Interface



	//Add Global Declarations Here

	GameEngine appEngine;
	TuioProcessing tuioClient;
	Panel panelApp;
	FWorld FisicaWorld; //Global Access usage anywhere
	boolean isFisicaRunning;
        
	void setup(){

	size(800,600);
        isFisicaRunning=false;
	Fisica.init(this); 
	frameRate(30);
	//change the game state to splashscreen
	StateMachine.StateMachine=StateMachine.GameState_MAINMENU;
	//Setup the Fisica Library
	FisicaWorld=new FWorld();

	panelApp=new Panel();


	fill(233,200,190, 8);
	//Setup the GameEngine
	appEngine=new GameEngine();
	tuioClient=new TuioProcessing(this); //Instantiate the TUIO Client Library on this Application
	appEngine.addLevel("splash",new SplashScreen());
	appEngine.addLevel("mainmenu",new MainMenu());
	appEngine.addLevel("gamemenu",new GameMenu());
	appEngine.addLevel("educative",new EducationScreen());        
	appEngine.setStatusPanel(panelApp);


	}

	void draw(){
	  
	if(StateMachine.StateMachine == StateMachine.GameState_SPLASHSCREEN){
	//render the splash screen
	appEngine.setCurrentLevel("splash");
	appEngine.render();
	}
	else if(StateMachine.StateMachine == StateMachine.GameState_MAINMENU){
	appEngine.setCurrentLevel("mainmenu");
	appEngine.render();
	}
	else if(StateMachine.StateMachine == StateMachine.GameState_SELECTSCREEN){
	appEngine.setCurrentLevel("gamemenu");
	appEngine.render();
	}
	else if(StateMachine.StateMachine == StateMachine.GameState_GAMESTART){
	appEngine.setCurrentLevel("game");
       	appEngine.render();
	
        }
    else if(StateMachine.StateMachine == StateMachine.GameState_EDUCATIVESCREEN){
    appEngine.setCurrentLevel("educative");
    appEngine.render();	
    }
    else if (StateMachine.StateMachine ==StateMachine.GameState_SINGLE_LEVEL2) {
    appEngine.setCurrentLevel("level2");
    appEngine.render();    	
    }
    else if(StateMachine.StateMachine == StateMachine.GameState_SINGLE_LEVEL3){
    appEngine.setCurrentLevel("level3");
    appEngine.render();	
    }    
	//
        if(isFisicaRunning==true){
	FisicaWorld.step();
	FisicaWorld.draw();
	}
        }



	void contactStarted(FContact con){
        appEngine.getLevel().contactStartedHook(con);
	}
	void addTuioObject(TuioObject tobj){
	appEngine.getLevel().addTuioObjectHook(tobj);

	}
	void removeTuioObject(TuioObject tobj){
	//appEngine.getLevel().removeTuioObject(tobj);
	appEngine.getLevel().removeTuioObjectHook(tobj);	
	}
	void updateTuioObject(TuioObject tobj){
	//appEngine.getLevel().updateTuioObject(tobj);
	appEngine.getLevel().updateTuioObjectHook(tobj);	
	}
	void addTuioCursor(TuioCursor tcur){
	//appEngine.getLevel().addTuioCursor(tcur);
	appEngine.getLevel().addTuioCursorHook(tcur);	
	}
	void removeTuioCursor(TuioCursor tcur){
	//appEngine.getLevel().removeTuioCursor(tcur);
	appEngine.getLevel().removeTuioCursorHook(tcur);		
	}
	void updateTuioCursor(TuioCursor tcur){
	//appEngine.getLevel().updateTuioCursor(tcur);
	appEngine.getLevel().updateTuioCursorHook(tcur);	
	}
	void mouseMoved(){
		appEngine.getLevel().moved();
	}


