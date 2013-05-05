  /**
  *Stack is a representation of each level which handles its own draw and setup
  **/

  class MainMenu implements StageDisplayable{
  	private PImage MenuImage;
  

  public void contactStartedEvent(){
  println("Event Contact Reached");  
  }
  	public void setup(){
  	try 
          {
      MenuImage=loadImage("ui/MainMenu.jpg"); 
  	} 
        catch 
        (NullPointerException e) 
          {
  	println("**There was a problem loading the image**");
  	println(e.getMessage());       

  	}
  	}
            public void contactStartedHook(FContact c){
           println(c.getBody1());
          }
          

  	MainMenu(){
  		this.setup();
  	}


  void pressed(){
    
  }

  void moved(){
    
  }

  public void addTuioObjectHook(TuioObject tobj){
      int id=tobj.getSymbolID(); //GET ID 1
     if(2 == id)
     {
     StateMachine.StateMachine=StateMachine.GameState_SELECTSCREEN;
     println("****Changing Game Level to Game Menu****");
     }
     
          } 
          
          /* this is called when an object becomes visible
  an object was removed from the table*/
    public void removeTuioObjectHook(TuioObject tobj){
  	
    } 

    public void updateTuioObjectHook(TuioObject tobj){

  }
   //an object was moved on the table surface
    public void addTuioCursorHook(TuioCursor tcur){

  }

  //this is called when a new cursor is detected
    public void removeTuioCursorHook(TuioCursor tcur){
  	
    } 

    //a cursor was removed from the table
    public void updateTuioCursorHook(TuioCursor tcur){
  	
  	}/* a cursor was moving ton the table surface */

    public void draw(){
    //render the mainmenu to the screen
    image(MenuImage,0,0);           
  	}
  }
