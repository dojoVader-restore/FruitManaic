	/**
	*@author Okeowo Aderemi
	*@description This is a class to handle the 
	*/
	class Panel
	{	
	 private boolean isSingleMode;
	 private int pheight=48;
	 private int scores=0;
	 private int level=0;
	 private int timer=0;
	 private PFont _font;
	 private SinglePlayer level1Panel;
	 private SinglePlayerLv2 level2Panel;
	 private SinglePlayerLv3 level3Panel;



		


		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		Panel () {
		isSingleMode=true;
			
		}
		public void setLevel(int mode){
			this.level=mode;
		}
		public void setScore(int score){
			this.scores=score;
		}

	        

		public void drawSinglePlay() throws Exception{
		//draw the panel if single smode is one
		if(!isSingleMode){
		throw new Exception("Single Mode can not Run in Multi-Mode Now Calling Multi Mode");
		
		}
		else{
		switch(this.level){
		//draw the Single Mode with dummy data first
		//change the color to any random
		case 1:
		fill(255);
	    noStroke();
		rect(0,0,width,pheight);
		fill(0);
		//draw the scores
		
		//draw the guage
		image(loadImage("guage.png"),40,10);
	        _font=loadFont("fonts/Ubuntu-15.vlw");  
	        textFont(_font,15);
	        text(str(scores),5,28);
	        //render the level text
	        text("Stage 1 (Catch All Apples)",250,28);
	    break;

	    case 2:
	    fill(255);
	        noStroke();
		rect(0,0,width,pheight);
		fill(0);
		//draw the scores
		
		//draw the guage
		image(loadImage("guage.png"),40,10);
	        _font=loadFont("fonts/Ubuntu-15.vlw");  
	        textFont(_font,15);
	        text(str(scores),5,28);
	        //render the level text
	        text("Stage 2 (Catch All Mangos and Melon)",250,28);
	     break;
	     
	     case 3:
				fill(255);
		        noStroke();
			rect(0,0,width,pheight);
			fill(0);
			//draw the scores
			
			//draw the guage
			image(loadImage("guage.png"),40,10);
		        _font=loadFont("fonts/Ubuntu-15.vlw");  
		        textFont(_font,15);
		        text(str(scores),5,28);
		        //render the level text
		        text("Stage 3 (Catch All Mangos,Melon and Apples)",250,28);
	     break;


 

	    }
		}
		}
		private void drawMultiplay(){
			println("MultiMode Drawing Now");
		}
	}
