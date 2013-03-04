/**
*Stack is a representation of each level which handles its own draw and setup
**/

class SplashScreen implements StageDisplayable{
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

	public void draw(){
	//draw the screen element
	image(this.backgroundHolder,0, 0);
	image(this.treeImage,0,0);
	image(this.nameImage,width/6,height /3);
	}
}
