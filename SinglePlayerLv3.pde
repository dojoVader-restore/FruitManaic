        /**
        *Stack is a representation of each level which handles its own draw and setup
        **/

        class SinglePlayerLv3 implements StageDisplayable {
            private PFont _font;
            private PImage _background;
            private int widthBound;
            private FBasket basketObject;
            private Apple apple;
            private Melon melon;
            private Pineapple pineapple;
            private int posY=0;
            private float tick=0;
            private int countApples=0;
            private float tuioPosX;
            private int NO_OF_APPLES=20;
            
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
          
          }
          
            public void setup(){
               try 
               {
                   isFisicaRunning=true;
                   _background=loadImage("widescreen.png");
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

           SinglePlayerLv3(){
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
         tuioPosX=tobj.getScreenX(width);
         
         }
        	
        } //an object was moved on the table surface
        public void addTuioCursorHook(TuioCursor tcur){

        }
        //this is called when a new cursor is detected
        public void removeTuioCursorHook(TuioCursor tcur){
        	
        } //a cursor was removed from the table

        public void updateTuioCursorHook(TuioCursor tcur){
       
        }/* a cursor was moving ton the table surface */

        	public void draw(){
                image(_background,0,0);
                //println("Number of Apples:"+countApples);
                if(countApples < NO_OF_APPLES){
                if (frameCount % 64 == 0) {
                    int w=(int) random(0,3);
                    if(w == 0){
                    pineapple = new Pineapple(64,64);
                    pineapple.setPosition(random(0+10, width-10),0);
                    pineapple.setRotation(posY*=2);
                    pineapple.setVelocity(.2 * tick,.5 * tick);
                    tick++;
                    //println("Ticking:"+tick);
                    
                    FisicaWorld.add(pineapple);
                  }
                  else if (w == 1){
                   melon = new Melon(64,64);
                    melon.setPosition(random(0+10, width-10),0);
                    melon.setRotation(posY*=2);
                    melon.setVelocity(.2 * tick,.5 * tick);
                    tick++;
                   FisicaWorld.add(melon); 
                  }
                  else if(w == 2){
                    apple = new Apple(64,64);
                    apple.setPosition(random(0+10, width-10),0);
                    apple.setRotation(posY*=2);
                    apple.setVelocity(.2 * tick,.5 * tick);
                    tick++;
                   FisicaWorld.add(apple);  
                    
                  }
                    countApples++;
                }
              }
              else
              {
               //println("Out of Apples"); 
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
