	/**
	*Stack is a representation of each level which handles its own draw and setup
	**/

	class SplashScreen implements StageDisplayable{
	  public void contactStartedEvent(){
	println("Event Contact Reached");  
	}
	    private PImage backgroundHolder,treeImage,nameImage;
		public void setup(){
		try {
		backgroundHolder=loadImage("background.jpg");
		treeImage=loadImage("tree.png");
		nameImage=loadImage("title.png");	
		} catch (NullPointerException e) {
		println("**There was a problem loading the image**");
		println(e.getMessage());

		}
		}

		SplashScreen(){
			this.setup();
	
		}
	void pressed(){
	  
	}

            public void contactStartedHook(FContact c){
           println(c.getBody1());
          }
          
	void moved(){
	    println("The TUIO has been added to the screen"); 
	}
	public void addTuioObjectHook(TuioObject tobj){
	   int id=tobj.getSymbolID(); //GET ID 1
	   if(1 == id)
	   {
	   StateMachine.StateMachine=StateMachine.GameState_MAINMENU;
	   println("****Changing Game Level to Game Menu****");
	   }
	        } 
	        /* this is called when an object becomes visible
	an object was removed from the table*/
	public void removeTuioObjectHook(TuioObject tobj){
		
	} 
	public void updateTuioObjectHook(TuioObject tobj){

	} //an object was moved on the table surface
	public void addTuioCursorHook(TuioCursor tcur){

	}
	//this is called when a new cursor is detected
	public void removeTuioCursorHook(TuioCursor tcur){
		
	} //a cursor was removed from the table
	public void updateTuioCursorHook(TuioCursor tcur){
		
		}/* a cursor was moving ton the table surface */

		public void draw(){
		//draw the screen element
		image(this.backgroundHolder,0, 0);
		image(this.treeImage,0,0);
		image(this.nameImage,width/6,height /3);
		}
	}
