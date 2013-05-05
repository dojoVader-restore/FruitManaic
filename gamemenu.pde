/**
*Stack is a representation of each level which handles its own draw and setup
**/

class GameMenu implements StageDisplayable{
	private PImage MenuImage;

public void contactStartedEvent(){
println("Event Contact Reached");  
}
	public void setup(){
	try 
        {
      //Start the Font
      
	  MenuImage=loadImage("ui/LevelMenu.jpg");
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
          


	GameMenu(){
		this.setup();
	}


void pressed(){
  
}

void moved(){
  
}
public void addTuioObjectHook(TuioObject tobj){
 int id=tobj.getSymbolID(); 
 if(0 == id){
   StateMachine.StateMachine=StateMachine.GameState_MAINMENU;
   println("****Changing Game Level back to Main Menu****");  
   }
 //start the game
 if(5 == id)
 {
  //set the Level to 1
  appEngine.setCurrentLevel("educative");
  EducationScreen levelObject=(EducationScreen)appEngine.getLevel();
  levelObject.setLevel(1);
  StateMachine.StateMachine=StateMachine.GameState_EDUCATIVESCREEN;
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
  //render the level menu
  image(MenuImage,0,0);     
	}
}
