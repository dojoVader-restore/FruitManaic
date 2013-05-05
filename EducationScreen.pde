/**
 *@author Okeowo Aderemi
 *@description This Class handles the Educative and dispersing information
 *@version 0.1
 * 
 */

class EducationScreen implements StageDisplayable{

public void contactStartedEvent(){
	println("Event Contact Reached");  
	}		
			//handle the logic to decide which has been picked or not
			private boolean APPLE_PICKED=false;
			private boolean MANGO_PICKED=false;
			private boolean MELON_PICKED=false;

		
			

			private int level=0; //handles which logic to handle
            private HashMap<Integer,String> FruitIDS; 
            private String textInfo="Please Display an Apple to Start the Game";
            private PImage bg;
            private PFont fontObject;
	    	private PImage eyeImage,treeImage,nameImage;
            private PImage pineapple;
            private PImage backgroungLevel;
            private int selectedFruit;
            private int timeElapsed=0;
            private HashMap<String,PImage> nutrientImages;
            private PImage rightImage,wrongImage;
            int xpos,ypos=0;
		public void setup(){
		try {
				nutrientImages=new HashMap();
				nutrientImages.put("apple",loadImage("nutrients/Apple.jpg"));
				nutrientImages.put("mango",loadImage("nutrients/Mango.jpg"));
				nutrientImages.put("melon",loadImage("nutrients/Melon.jpg"));
                FruitIDS=new HashMap();
                rightImage=loadImage("ui/right.png");
                wrongImage=loadImage("ui/wrong.png");
                
                FruitIDS.put(1,"Mango");
                FruitIDS.put(3,"Melon");
                FruitIDS.put(4,"Apple");
                 
		isFisicaRunning=false;
		} catch (NullPointerException e) {
		println("**There was a problem loading the image**");
		println(e.getMessage());

		}
		}
    
	EducationScreen(){
			this.setup();

		}
	void pressed(){
	  
	}
	public PImage getImageInstanceForDrawing(){
	PImage temp=createImage(0,0,ARGB);
	switch (this.level){
	case 1:
	if(this.backgroungLevel == null){
    temp=loadImage("ui/level1edu.jpg");
	}
    break;

    case 2:
	if(this.backgroungLevel == null){
    temp=loadImage("ui/level2edu.jpg");
	}
    break;

    case 3:
	if(this.backgroungLevel == null){
    temp=loadImage("ui/level3edu.jpg");
	}

    break;
	
	}

	return temp;
		
	}
	public void setLevel(int level){
		this.level=level;
	}
	public int getLevel(){
		return this.level;
	}

    public void contactStartedHook(FContact c)
    {

    }
          
	void moved(){
	   println("Position X:"+mouseX+" Y:"+mouseY);	 
	}

	public void addTuioObjectHook(TuioObject tobj)
	{ 
	   int id=tobj.getSymbolID(); //GET ID 1
	   if(10 == id)
	   {
	   StateMachine.StateMachine=StateMachine.GameState_MAINMENU;
	   println("****Changing Game Level to Game Menu****");
	   }

	   //check that the fruit is the same
	   if(FruitIDS.containsKey(id)){
	   //Checking if the Fruit is allowed
       if(id == 4)
       	{
       	//Apple has been Picked
       	if(!APPLE_PICKED)
       	{
       		APPLE_PICKED=true;
       	}
       	}
       //3
       if(id == 3)
       {
       		if(!MELON_PICKED)
       	{
       		MELON_PICKED=true;
       	}
       }

       if(id == 1)
       {
       		if(!MANGO_PICKED)
       	{
       		MANGO_PICKED=true;
       	}
       }


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
	    switch(this.level){
	    case 1:
	    //Render the first screen
	    if(!APPLE_PICKED){
        image(this.getImageInstanceForDrawing(), 0, 0);
	    }
	    else{
	    //Apple has been picked show the nutrient info
	    image(nutrientImages.get("apple"),0,0);
	    		if(timeElapsed == 0){
	    		timeElapsed=millis() + 2000;
	    		}
                if(millis() > timeElapsed){
                panelApp.setLevel(1);
                APPLE_PICKED=false;
                MANGO_PICKED=false;
                MELON_PICKED=false;	
                appEngine.addLevel("game",new SinglePlayer());
                StateMachine.StateMachine=StateMachine.GameState_GAMESTART;
                timeElapsed=0;  
                }	
	    }
	    break;
       
	    case 2:
	    image(this.getImageInstanceForDrawing(), 0, 0);
	    //Render the second screen
	    if(MANGO_PICKED && !MELON_PICKED){
	  
	    //draw the wrong sign below mango
	    image(rightImage,136,506);
	    println("mango picked && melon not picked");
	    }
	    else if (!MANGO_PICKED && MELON_PICKED) {
	   
	    //draw the wrong sign below mango
	    image(rightImage,630,506);
	    println("not mango picked && melon picked");	
	    }
	    else if (MANGO_PICKED && MELON_PICKED) {
	    println("Mango and Melon Picked");	
	    //move to the next
	    image(nutrientImages.get("mango"),0,0);
	    		if(timeElapsed == 0){
	    		timeElapsed=millis() + 2000;
	    		}
                if(millis() > timeElapsed){

                appEngine.addLevel("level2",new SinglePlayerLv2());
                //reset mango and melon
                APPLE_PICKED=false;
                MANGO_PICKED=false;
                MELON_PICKED=false;	
                StateMachine.StateMachine=StateMachine.GameState_SINGLE_LEVEL2;
                timeElapsed=0;  
                }	
	    }
	    else if(!MANGO_PICKED && !MELON_PICKED){
	    image(this.getImageInstanceForDrawing(), 0, 0);	
	    }

	    break;

	    case 3:
	    //Render the Third screen
	    //simple algorithm check that all apples are selected
	    image(this.getImageInstanceForDrawing(), 0, 0);
	    if(APPLE_PICKED){
	    //draw for apple
	     
	     image(rightImage,402,507);
	    }
	    if(MANGO_PICKED){
	    	
	     image(rightImage,638,507);	
	    }
	    if(MELON_PICKED){
	    	
	    	 image(rightImage,143,507);
	    }
	    if(APPLE_PICKED && MANGO_PICKED && MELON_PICKED){
	    image(nutrientImages.get("melon"),0,0);
	    		if(timeElapsed == 0){
	    		timeElapsed=millis() + 2000;
	    		}
                if(millis() > timeElapsed){

                appEngine.addLevel("level3",new SinglePlayerLv3());
                //reset mango and melon
                APPLE_PICKED=false;
                MANGO_PICKED=false;
                MELON_PICKED=false;	
                StateMachine.StateMachine=StateMachine.GameState_SINGLE_LEVEL3;
                timeElapsed=0;  
                }	

	    }
	    
	    break;	
	    }    
              
                
        } 
		
	}


