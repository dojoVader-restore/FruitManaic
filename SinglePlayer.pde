        /**
        *Stack is a representation of each level which handles its own draw and setup
        **/

        class SinglePlayer implements StageDisplayable {
            private PFont _font;
            private PImage _background;
            private int widthBound;
            private FBasket basketObject;
            private Apple apple;
            private int posY=0;
            private float tick=0;
            private int countApples=0;
            private float tuioPosX;
            private int fruitsCaught=0;
            private int animatedYPos;
            private int animatedXPos;
            private int animeStartOffset=0;
            private int animeEndOffset=0;
            private PImage animBG;
            private int delay=0;
            private boolean GameHasEnded = false;
            private int NO_OF_APPLES=15;
          public void contactStartedHook(FContact c){
          //At least if one of the object is a Basket then Delete the Apple
          if(c.getBody1() == basketObject){
          FBody appleRemove=c.getBody2();
          FisicaWorld.remove(appleRemove);
         
          }
         else if(c.getBody2() == basketObject)
        {
          FBody appleRemove=c.getBody1();
          FisicaWorld.remove(appleRemove);

        } 
        fruitsCaught++;
          panelApp.setScore(fruitsCaught); 
          
          }
          
            public void setup(){
               try 
               {
                   isFisicaRunning=true;
                   _background=loadImage("widescreen.png");
                   animBG=loadImage("ui/ScoreSkin.png");
                   animeEndOffset=(screen.height -animBG.height) / 2;
                   
                   basketObject=new FBasket();
                   FisicaWorld.add(basketObject);

                 
               } 
               catch 
               (NullPointerException e) 
               {
                   println("**There was a problem loading the image**");
                   println(e.getMessage());       

               }
           }

           SinglePlayer(){
              setup();
              
          }


          public void pressed(){}
          public void moved(){}
         

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
         if(3 == tobj.getSymbolID()){
         if(!GameHasEnded){         
         tuioPosX=tobj.getScreenX(width);
          }         
         }
        	
        } //an object was moved on the table surface
        public void addTuioCursorHook(TuioCursor tcur){

        }
        //this is called when a new cursor is detected
        public void removeTuioCursorHook(TuioCursor tcur){
        	
        } //a cursor was removed from the table

        public void updateTuioCursorHook(TuioCursor tcur){
       
        }/* a cursor was moving ton the table surface */

        public void printScores(int xpos,int ypos){
        PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
        font = loadFont("fonts/ShowcardGothic-Reg-48.vlw"); 
        textFont(font, 48); 
         
        String fruitCaughtStr="Fruit Caught  : " +str(fruitsCaught / 2);
        String fruitMissedStr="Fruit Missed  :  "+str(countApples -(fruitsCaught) / 2);
        //render the text to screen
        fill(0);
        text("Stage 1",xpos+150,ypos-50);
        text(fruitCaughtStr, xpos, ypos,500,100);
        text(fruitMissedStr,xpos,ypos + 100,500,100);
        //reset textFont
        
        }
        	public void draw(){
                image(_background,0,0);
                //println("Number of Apples:"+countApples);
                 if(countApples == NO_OF_APPLES){
                //Omly Set Delay if delay hasn't been set else ignore
                if(delay == 0){
                  delay=millis() + 10000; 
                } 
                } 
                if(countApples <= NO_OF_APPLES){
                
                if (frameCount % 64 == 0) {
                    apple = new Apple(40,40);
                    apple.setPosition(random(0+10, width-10),0);
                    apple.setRotation(posY*=2);
                    apple.setVelocity(.2 * tick,.5 * tick);
                    tick++;
                    //println("Ticking:"+tick);
                    
                    FisicaWorld.add(apple);
                    countApples++;
                }
              }
              else
              {
               //println("Out of Apples");
               if(millis() > delay){
               
               
               
               
                FisicaWorld.clear(); //remove all fisica entity
                println("Game ended make a switch ?");
                GameHasEnded=false;
                appEngine.setCurrentLevel("educative");
                EducationScreen levelObject=(EducationScreen)appEngine.getLevel();
                levelObject.setLevel(2);
                panelApp.setLevel(2);
                StateMachine.StateMachine=StateMachine.GameState_EDUCATIVESCREEN;
              }
              else{
                //animation code
               image(animBG,(width - animBG.width)/2,(animeStartOffset + 100));
               printScores(((width - animBG.width)/2)+45,animeStartOffset+250);
               //print the scores
               GameHasEnded=true;
               //switch to Level 2
              }

                 
              }
                
                if(mouseX >= width){
                    basketObject.setPosition(tuioPosX,(height-22)); 
                    }else{ 
                        basketObject.setPosition(tuioPosX,(height-22));
                    }
                    
                    
                    

            //println("Basket Coords:[X]:"+basketObject.getX()+"[Y]:"+basketObject.getY());
            
            
            
            
            try{
                appEngine.getStatusPanel().drawSinglePlay(); 
                }catch(Exception e){
                   println("Error");
                   
               } 
               

               
               
           }
       }
