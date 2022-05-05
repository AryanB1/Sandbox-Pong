/*Note: require an object that talks to different objects
 Ball Class, change to appWidth and appHeight
 To Do: fix the color() fill() bug between Circle{} and Rectangle{}
 */
//
//Global Variables & Other Items (Classes)
ArrayList<Shape> shapes = new ArrayList<Shape>();
Boolean instructionsOn=false, screensaver = false, singleplayer = false, nightmode;
int time, base, contrast;
//
//Annonymous Class, one time object
//These numbers in new shape don't matter since I declare the object again in setup after the displayWidth is set
Shape instructions = new Shape (0, 100, 200, 300) { //These hardcoded variables are minimum display, here
  //Global Variables
  color colourDayMode, resetNightMode;
  //No Constructor Needed
  void draw() {
    fill(255); //White, not night mode compatible due to BLUE
    rect(x, y, w, h); //background for instructions menu
    fill(0);
    String instructions[] = {
  "For single player: press j (You control the left paddle)",
  "To turn off single player: press z",
  "For screen saver: press f",
  "To turn off screen saver: press z",
  "To turn on night mode: press q",
  "To turn off night mode: press e",
  "To move the left paddle up, press w",
  "To move the left paddle down, press s",
  "To move the right paddle up, press the up key",
  "To move the right paddle down, press the down key",
  "For Left Paddle Speed, Press n (hard), r (normal), g (easy)",
  "For Right Paddle Speed, Press m (hard), t (normal), h (easy)",
  "To reset game press z",
  "Click any number key beteween 1-9 if you want to add or remove balls (there is one ball by default)",
  "A point is scored by getting a point into the enemy players net, or in the case of single player mode, hitting the ball", 
  "First one to 5 points wins!!",
  "Press v to close this window. It can be reopened at any time with the k key",
  "You can also use the k key to take a break",
  "When you have three points, try clicking somewhere in the middle of the screen",
  "When you have four points try the same thing!"
};
    for(int i = 0; i < instructions.length; i++) {
      textAlign(CENTER);
      float size = (h*1/2)/instructions.length;
      textSize(size);
      text(instructions[i], displayWidth*1/2,(((y+h)/4)+size+(size*i)) );
    }
    //Text Code Here
    fill(255); //Reset White, from colours of ink
  }
  //Methods for Possible Text Drawing
  //
  //Common Metods
  void paddleBounceLeft( float x, float y, float w, float h ) {
  }
  void paddleBounceRight( float x, float y, float h ) {
  }
  float xGetter() {
    return x;
  }
  float yGetter() {
    return y;
  }
  float wGetter() {
    return w;
  }
  float hGetter() {
    return h;
  }
  color colourDayModeGetter() {
    return colourDayMode;
  }
  color resetNightModeGetter() {
    return resetNightMode;
  }
}
; //Necessary Code
//
void setup()
{
  fullScreen(); //fullScreen(); //displayWidth, displayHeight
  display(); //Landscape manditory
  //
  //Local Variables & Object Setup
  //
  //Instructions, Features, and Hints for Easter Eggs
  time = hour();
  if(time < 8 || time > 18) nightmode = true;
  else nightmode = false;
  shapes.add(instructions); //Elememt 0
  // Redefine instruction location now that fullscreen has been called.
  shapes.get(0).x = displayWidth*3/40;
  shapes.get(0).y = displayHeight*3/40;
  shapes.get(0).w = displayWidth*35/40;
  shapes.get(0).h = displayHeight*35/40;
  //Paddles and Ball
  int yDiameter;
  int xDiameter = yDiameter = appWidth*1/90;
  int rectWidth = appWidth*1/80;
  int rectHeight = appHeight*1/4;
  int colourDayRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  int colourNightRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  int colourDayRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  int colourNightRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  int colourDayBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  int colourNightBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  Rectangle rHexLeft = new Rectangle(appWidth*1/40, appHeight*1/4, rectWidth, rectHeight, colourDayRectLeft, colourNightRectLeft);
  Rectangle rHexRight = new Rectangle(appWidth*38/40, appHeight*1/4, rectWidth, rectHeight, colourDayRectRight, colourNightRectRight);
  Rectangle lBoard = new Rectangle(appWidth/5, 0, appWidth/10, appHeight/10, 0, 255);
  Rectangle rBoard = new Rectangle(appWidth*3/5, 0, appWidth/10, appHeight/10, 0, 255);
  Circle cHex = new Circle(appWidth*1/2, appHeight*1/2, xDiameter, yDiameter, colourDayBall, colourNightBall);
  //
  //Shapes Global Variable, Shapes will not change
  shapes.add(rHexLeft); //Element 1, Left Paddle
  shapes.add(rHexRight); //Element 2, Right Paddle
  shapes.add(lBoard);
  shapes.add(rBoard);
  shapes.add(cHex); //Element 3, Pong BALL
  //
  //Reminder: all local objects are deleted, "Garbage Heap Collected"
}//End setup
//
void draw() {
  background(0);
  //
  int instructionElement = 0;
  int paddleLeftElement = 1;
  int paddleRightElement = 2;
  int ballElement = 5;
  //If nightmode is true, background is black, and foreground (text and lines) is white
  if (nightmode == true) {
    base = 0;
    contrast = 255;
  }
  //If nightmode is true, background is white, and foreground (text and lines) is black
  else {
    base = 255;
    contrast = 0;
  }
  //
  if ( instructionsOn==true ) shapes.get(instructionElement).draw(); //Annonymous Class
  //
  //Arithmetic
  if ( instructionsOn==false ) {
    shapes.get(ballElement).paddleBounceLeft( shapes.get(paddleLeftElement).xGetter(), shapes.get(paddleLeftElement).yGetter(), shapes.get(paddleLeftElement).wGetter(), shapes.get(paddleLeftElement).hGetter() );
    shapes.get(ballElement).paddleBounceRight( shapes.get(paddleRightElement).xGetter(), shapes.get(paddleRightElement).yGetter(), shapes.get(paddleRightElement).hGetter() );
    //Drawing where tokens should be
    /*for ( Shape s : shapes ) {
     s.draw();
     }
     */
    //Screensaver functional 
    if(screensaver == true) {
      shapes.get(paddleLeftElement).y = shapes.get(ballElement).y - shapes.get(paddleLeftElement).h/2;
      shapes.get(paddleRightElement).y = shapes.get(ballElement).y - shapes.get(paddleLeftElement).h/2;    
    }
    if(singleplayer == true) {
      shapes.get(paddleRightElement).y = shapes.get(ballElement).y - shapes.get(paddleLeftElement).h/2;
    }
    //Note: repeats basic FOR-Each like belowss
    for ( int i=1; i<shapes.size(); i++ ) {
      shapes.get(i).draw();
      //println("here", i);
    }

  }//End instructionsOn==false
  //
}//End draw
//
void keyPressed()
{
  int paddleLeftElement = 1;
  int paddleRightElement = 2;
  //Instructions: Instructions, Features, and Hints for Easter Eggs

  if ( key == CODED && key == 'I' || key == 'i' ) {
    if ( instructionsOn==true ) {
      instructionsOn=false;
    } else {
      instructionsOn=true;
    }
  }//End instructions
  //Note: .remove & .add combined in .set
  //
  //Left Paddle
  //Note: shapes.get(paddleLeftElement).movePaddleUp()
  if ( key == CODED && key == 'W' || key == 'w' ) {
    //shapes.get(paddleLeftElement)'
    // Create a new element
    Rectangle paddleLeft = new Rectangle (shapes.get(paddleLeftElement).xGetter(), shapes.get(paddleLeftElement).yGetter(), shapes.get(paddleLeftElement).wGetter(), shapes.get(paddleLeftElement).hGetter(), shapes.get(paddleLeftElement).colourDayModeGetter(), shapes.get(paddleLeftElement).resetNightModeGetter());
    // Call movement to the element
    paddleLeft.movePaddleUP(); //Changes the y-variable, compared to shapes.get(paddleLeftElement)
    // Add element to shapes
    shapes.set(paddleLeftElement, paddleLeft);
  }//End W Key
  if ( key == CODED && key == 'S' || key == 's' ) {
    Rectangle paddleLeft = new Rectangle (shapes.get(paddleLeftElement).xGetter(), shapes.get(paddleLeftElement).yGetter(), shapes.get(paddleLeftElement).wGetter(), shapes.get(paddleLeftElement).hGetter(), shapes.get(paddleLeftElement).colourDayModeGetter(), shapes.get(paddleLeftElement).resetNightModeGetter());
    paddleLeft.movePaddleDOWN(); //Changes the y-variable, compared to shapes.get(paddleLeftElement)
    shapes.set(paddleLeftElement, paddleLeft);
  }//End S Key
  if ( key == CODED && key == 'D' || key == 'd' ) {
    Rectangle paddleLeft = new Rectangle (shapes.get(paddleLeftElement).xGetter(), shapes.get(paddleLeftElement).yGetter(), shapes.get(paddleLeftElement).wGetter(), shapes.get(paddleLeftElement).hGetter(), shapes.get(paddleLeftElement).colourDayModeGetter(), shapes.get(paddleLeftElement).resetNightModeGetter());
    paddleLeft.movePaddleSTOP(); //Changes the y-variable, compared to shapes.get(paddleLeftElement)
    shapes.set(paddleLeftElement, paddleLeft);
  }//End D Key
  //
  //Right Paddle
  if ( key == CODED && keyCode == UP ) {
    Rectangle paddleRight = new Rectangle (shapes.get(paddleRightElement).xGetter(), shapes.get(paddleRightElement).yGetter(), shapes.get(paddleRightElement).wGetter(), shapes.get(paddleRightElement).hGetter(), shapes.get(paddleRightElement).colourDayModeGetter(), shapes.get(paddleRightElement).resetNightModeGetter());
    paddleRight.movePaddleUP(); //Changes the y-variable, compared to shapes.get(paddleRightElement)
    shapes.set(paddleRightElement, paddleRight);
  }//End UP Key
  if ( key == CODED && keyCode == DOWN ) {
    Rectangle paddleRight = new Rectangle (shapes.get(paddleRightElement).xGetter(), shapes.get(paddleRightElement).yGetter(), shapes.get(paddleRightElement).wGetter(), shapes.get(paddleRightElement).hGetter(), shapes.get(paddleRightElement).colourDayModeGetter(), shapes.get(paddleRightElement).resetNightModeGetter());
    paddleRight.movePaddleDOWN(); //Changes the y-variable, compared to shapes.get(paddleRightElement)
    shapes.set(paddleRightElement, paddleRight);
  }//End DOWN Key
  if ( key == CODED && keyCode == LEFT ) {
    Rectangle paddleRight = new Rectangle (shapes.get(paddleRightElement).xGetter(), shapes.get(paddleRightElement).yGetter(), shapes.get(paddleRightElement).wGetter(), shapes.get(paddleRightElement).hGetter(), shapes.get(paddleRightElement).colourDayModeGetter(), shapes.get(paddleRightElement).resetNightModeGetter());
    paddleRight.movePaddleSTOP(); //Changes the y-variable, compared to shapes.get(paddleRightElement)
    shapes.set(paddleRightElement, paddleRight);
  }//End LEFT Key
  //
  if(key == 'f' || key == 'F') screensaver = true;
  if(key == 'j' || key == 'J') singleplayer = true;
  if(key == 'q' || key == 'Q') nightmode = true;
}//End keyPressed
//
/*
void mousePressed() {
  //Note, trigger: this trigger will work anytime, actual trigger should be after celebration is complete
  //Be creative on your Pong BALL Triggers (i.e. add score +1 = number of new BALLs in play)
  int ballElement = 3;
  shapes.remove(ballElement); //Ball Element
  //
  //Copy and Pasting local variables is not best practice
  //Use for this lesson on leveraging local variables in garbage collection
  int yDiameter;
  int xDiameter = yDiameter = appWidth*1/90;
  int colourDayBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  int colourNightBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  Circle cHex = new Circle(appWidth*1/2, appHeight*1/2, xDiameter, yDiameter, colourDayBall, colourNightBall);
  //
  shapes.add(ballElement, cHex); //Replace BALL Element Hardcoded into void draw()
  //
}//End mousePressed
//
*/
//End MAIN (Driver) Program
