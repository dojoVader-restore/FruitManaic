		/**
		*@author Okeowo Aderemi
		*@description A Simple Boilerplate to serve as Processing Game Engine
		**/

		class GameEngine {

		   

			public StageDisplayable _levelHandler; 
			private AudioPlayer _soundManager;
			private Panel _statusPanel;
			private HashMap <String,StageDisplayable> _ArrayOfLevels; //Holds the Stages

			 GameEngine(){
			 //initialize the HashMap
			 _ArrayOfLevels=new HashMap();
		     }
		    public HashMap getLevelHolder(){
		    return _ArrayOfLevels;
		    }
		    public void addLevel(String name,StageDisplayable level){
		    if(!_ArrayOfLevels.containsKey(name)){
		    _ArrayOfLevels.put(name,level);
		    }
		    else{
		    	println("***Error:[This Item already exist]***");
		    }
		    _ArrayOfLevels.put(name,level);	
		    }
		    void setCurrentLevel(String name){
		    if(_ArrayOfLevels.containsKey(name)){
		    //set the current level as the one to be pulled
		    _levelHandler=_ArrayOfLevels.get(name);	
		    }
		    else{
		    //The level doesn't exist set splash
		    println("****Error:[No Screen has been Selected,Please Specify One]***");	
		    }	
		    }

			

			StageDisplayable getLevel(){
			return this._levelHandler;
			}
		        //this will be called from the Callback in the Processing Object
		        void handleMousePress(){
		        this._levelHandler.pressed();
		        } 
		        void handleMouseMove(){
		         this._levelHandler.moved(); 
		        }
		       

			void render(){
				if(this._levelHandler == null){
					println("**There is no Level to Render**");
				}
				this._levelHandler.draw();
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
			
			_statusPanel=panel;
			
			
			}
		}
		/**
		*@description Anything to be drawn on the stage must fulfill setup and draw since interface is missing
		**/

		//NOTE:: Add TUIO Callbacks Later
		interface StageDisplayable{
			public void setup();
			public void draw();
		        public void pressed();
		        public void moved();
		           public void addTuioObjectHook(TuioObject tobj); // this is called when an object becomes visible
				public void removeTuioObjectHook(TuioObject tobj); //an object was removed from the table
				public void updateTuioObjectHook(TuioObject tobj); //an object was moved on the table surface
				public void addTuioCursorHook(TuioCursor tcur); //this is called when a new cursor is detected
				public void removeTuioCursorHook(TuioCursor tcur); //a cursor was removed from the table
		        public void updateTuioCursorHook(TuioCursor tcur); //a cursor was moving ton the table surface 
		  public void contactStartedHook(FContact contact);
		}


		/**
		*@description A Level that takes and draws the interface to the screen
		**/


		/**
		*StateMachine to Hold the Game States
		**/

		static class StateMachine{
		public static int StateMachine=0;	
		private static final int GameState_SPLASHSCREEN=1;
		private static final int GameState_MAINMENU=2;
		private static final int GameState_SELECTSCREEN=4;
		private static final int GameState_GAMESTART=8;
		private static final int GameState_GAMETIMEOUT=16;
		private static final int GameState_GAMEOVER=32;
		private static final int GameState_HIGHSCORES=64;
		private static final int GameState_EDUCATIVESCREEN=128;
		private static final int GameState_SINGLE_LEVEL2=256;
		private static final int GameState_SINGLE_LEVEL3=512;
		}

		class FBasket extends FBox{
		private PImage basketAsset;

		FBasket(){
		super(81,43);
		basketAsset=loadImage("Player.png");
		setup();
		}
		void draw(PGraphics applet) {
		    super.draw(applet);

		    preDraw(applet);
		    image(basketAsset,-40.5,-21.5);
		    postDraw(applet);
		  }
		void setup(){
		setNoStroke();
		setNoFill();
		setRestitution(0);
		setStatic(true);
		}  
		  
		  
		 

		}


		class Apple extends FBox {
		private PImage fruitAsset;
		private float w,h;

		Apple(float w,float h){
		super(w,h); 
		this.w=w;
		this.h=h;  
		fruitAsset=loadImage("apple.png");
		setup();
		}
		void draw(PGraphics applet) {
		    super.draw(applet);
		    preDraw(applet);
		    image(fruitAsset,0,0,w,h);
		     postDraw(applet);
		  }
		  
		void setup(){
		setNoStroke();
              setNoFill();

		}  
		}
		class Orange extends FBox {
		private PImage fruitAsset;
		private float w,h;

		Orange(float w,float h){
		super(w,h); 
		this.w=w;
		this.h=h;  
		fruitAsset=loadImage("orange.png");
		setup();
		}
		void draw(PGraphics applet) {
		    super.draw(applet);
		    preDraw(applet);
		    image(fruitAsset,0,0,w,h);
		     postDraw(applet);
		  }
		  
		void setup(){
		setNoStroke();
              setNoFill();

		}  
		}
		//Support for Handling Animation for the Fruits
		class Mango extends FBox {
		private PImage fruitAsset;
		private float w,h;

		Mango(float w,float h){
		super(w,h); 
		this.w=w;
		this.h=h;  
		fruitAsset=loadImage("Mango-icon.png");
		setup();
		}
		void draw(PGraphics applet) {
		    super.draw(applet);
		    preDraw(applet);
		    image(fruitAsset,0,0,w,h);
		     postDraw(applet);
		  }
		  
		void setup(){
		setNoStroke();
              setNoFill();

		}  
		}

		class Pineapple extends FBox {
		private PImage fruitAsset;
		private float w,h;

		Pineapple(float w,float h){
		super(w,h); 
		this.w=w;
		this.h=h;  
		fruitAsset=loadImage("pineapple.png");
		setup();
		}
		void draw(PGraphics applet) {
		    super.draw(applet);
		    preDraw(applet);
		    image(fruitAsset,0,0,w,h);
		     postDraw(applet);
		  }
		  
		void setup(){
		setNoStroke();
              setNoFill();

		}  
		}

		class Melon extends FBox {
		private PImage fruitAsset;
		private float w,h;

		Melon(float w,float h){
		super(w,h); 
		this.w=w;
		this.h=h;  
		fruitAsset=loadImage("water-melon-icon.png");
		setup();
		}
		void draw(PGraphics applet) {
		    super.draw(applet);
		    preDraw(applet);
		    image(fruitAsset,0,0,w,h);
		     postDraw(applet);
		  }
		  
		void setup(){
		setNoStroke();
              setNoFill();

		}  
		}





