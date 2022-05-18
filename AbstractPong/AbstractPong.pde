/*Note:
Figure out how to support multiple balls
Create the metaphors / Other needed features
Submit and become elite waterloo engineer
 */
//
//Global Variables & Other Items (Classes)
ArrayList<Shape> shapes = new ArrayList<Shape>();
Boolean instructionsOn=true, screensaver = false, singleplayer = false, nightmode;
// Variables for niight mode
int time, base, contrast;
// Variables for colour
int colourBall, colourRectLeft, colourRectRight;
// Variable for dotted middle line
int lenMiddle;
// Variables for left and right score board
int lScore = 0, rScore = 0;
// Variable for number of balls 
int numBalls = 1;
//Variables for ball speed;
//Annonymous Class, one time object
//These numbers in new shape don't matter since I declare the object again in setup after the displayWidth is set
Shape instructions = new Shape (0, 100, 200, 300, base) { //These hardcoded variables are minimum display, here
  //Global Variables
  //No Constructor Needed
  void draw() {
    fill(base); //White, not night mode compatible due to BLUE
    rect(x, y, w, h); //background for instructions menu
    fill(contrast);
    String instructions[] = {
  "Please set your screen in landscape mode",
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
    fill(base); //Reset White, from colours of ink
  }
  //Methods for Possible Text Drawing
  //
  //Common Metods
  void paddleBounceLeft( float x, float y, float w, float h ) {
  }
  void paddleBounceRight( float x, float y, float h ) {
  }
  void leftPaddleSpeed(){};
  void rightPaddleSpeed(){};
  void leftPaddleMove() {};
  void rightPaddleMove(){};
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
  shapes.add(instructions); //Elememt 0
  // Redefine instruction location now that fullscreen has been called.
  //Creating Local Variables
  int yDiameter;
  int xDiameter = yDiameter = appWidth*1/90;
  int rectWidth = appWidth*1/80;
  int rectHeight = appHeight*1/4;
  // Ensures that the outlines of objects are invisible
  stroke(base);
  // Assigning Colours
  if(nightmode == true) {
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  }
  else {
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  }
  //Creating circle and rectangle objects 
  Rectangle rHexLeft = new Rectangle(appWidth*1/40, appHeight*1/4, rectWidth, rectHeight, colourRectLeft);
  Rectangle rHexRight = new Rectangle(appWidth*39/40-rectWidth, appHeight*1/4, rectWidth, rectHeight, colourRectRight);
  Rectangle rectDropL = new Rectangle(appWidth*1/40, appHeight, rectWidth, appHeight*1/25, colourRectLeft, "Left");
  Rectangle rectDropR = new Rectangle(appWidth*39/40-rectWidth, appHeight, rectWidth, appHeight*1/25, colourRectRight, "Right");
  Rectangle lBoard = new Rectangle(appWidth/5, 0, appWidth/10, appHeight/10, base);
  Rectangle rBoard = new Rectangle(appWidth*3/5, 0, appWidth/10, appHeight/10, base);
  Rectangle leftLine = new Rectangle(appWidth*1/40, 0, 5, appHeight, base);
  Rectangle rightLine = new Rectangle(appWidth*39/40, 0, 6, appHeight, base);
  Rectangle middleLine = new Rectangle(appWidth*1/2, 0, 5, appHeight, base);
  Rectangle screenBox = new Rectangle(appWidth*2.5/10, appHeight*4/10, appWidth*1/2, appHeight*2/10, base);
  Circle cHex = new Circle(appWidth*1/2, appHeight*1/2, xDiameter, yDiameter, colourBall);
  //
  //Elements 1-10
  shapes.add(rHexLeft); 
  shapes.add(rHexRight); 
  shapes.add(lBoard);
  shapes.add(rBoard);
  shapes.add(screenBox);
  shapes.add(rectDropL);
  shapes.add(rectDropR);
  shapes.add(rightLine);
  shapes.add(middleLine);
  shapes.add(leftLine);
  for (int i = 15; i < displayHeight; i += 50) {
    //sets colour, to create dotted effect
    Rectangle dots = new Rectangle(appWidth*1/2, i, 5, 25, contrast);
    shapes.add(dots);
  }
  lenMiddle = shapes.size();
  shapes.add(cHex);
}
//End setup
//
void draw() {
  if (nightmode == true) {
    base = 0;
    contrast = 255;
  }
  else {
    base = 255;
    contrast = 0;
  }
  int sBox = 5;
  if (screenCheck == false ) {
    background(base);
    shapes.get(sBox).objectColour = base;
    shapes.get(sBox).draw();
    fill(contrast);
    textAlign(CENTER);
    textSize(displayHeight*1/30);
    text("Please Switch your display to landscape mode", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
    noLoop();
}
else {
  //If nightmode is true, background is white, and foreground (text and lines) is black
  background(base);
  stroke(base);
  // Things to call
  int instructionElement = 0;
  int paddleLeftElement = 1;
  int paddleRightElement = 2;
  int lBoardElement = 3;
  int rBoardElement = 4;
  int lLine = 10;
  int rLine = 8;
  int mLine = 9;
  int rectL = 6;
  int rectR = 7;
  int mDot = 11;
  int ballElement = lenMiddle;
  shapes.get(instructionElement).x = displayWidth*3/40;
  shapes.get(instructionElement).y = displayHeight*3/40;
  shapes.get(instructionElement).w = displayWidth*35/40;
  shapes.get(instructionElement).h = displayHeight*35/40;
  if(lScore == 0 && rScore == 0) {
    shapes.get(paddleLeftElement).h = appHeight*1/4;
    shapes.get(paddleRightElement).h = appHeight*1/4;
  }
  if(shapes.size() - lenMiddle < numBalls) {
    Circle ballNew = new Circle(appWidth*1/2, appHeight*1/2, appWidth*1/90, appWidth*1/90, colourBall);
    shapes.add(ballNew);
  }
  //
  if ( instructionsOn==true ) shapes.get(instructionElement).draw(); //Annonymous Class
  //
  //Arithmetic
  if ( instructionsOn==false ) {
    if(lScore == 5) {
      shapes.get(sBox).objectColour = base;
      shapes.get(sBox).draw();
      fill(contrast);
      textAlign(CENTER);
      textSize(displayHeight*1/30);
      text("Congratulations! Left Player Wins! Press Z to reset game!", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
    }
    if(rScore == 5) {
      shapes.get(sBox).objectColour = base;
      shapes.get(sBox).draw();
      fill(contrast);
      textAlign(CENTER);
      textSize(displayHeight*1/30);
      text("Congratulations! Right Player Wins! Press Z to reset game!", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
    }
    else{
      shapes.get(paddleLeftElement).objectColour = colourRectLeft;
      shapes.get(paddleRightElement).objectColour = colourRectRight;
      shapes.get(lBoardElement).objectColour = base;
      shapes.get(rBoardElement).objectColour = base;
      shapes.get(sBox).objectColour = base;
      shapes.get(lLine).objectColour = contrast;
      shapes.get(rLine).objectColour = contrast;
      shapes.get(mLine).objectColour = contrast;
      shapes.get(rectL).objectColour = colourRectLeft;
      shapes.get(rectR).objectColour = colourRectRight;
      for(int i = mDot; i < lenMiddle; i++) shapes.get(i).objectColour = base;
      shapes.get(ballElement).objectColour = colourBall;
      shapes.get(ballElement).paddleBounceLeft( shapes.get(paddleLeftElement).x, shapes.get(paddleLeftElement).y, shapes.get(paddleLeftElement).w, shapes.get(paddleLeftElement).h );
      shapes.get(ballElement).paddleBounceRight( shapes.get(paddleRightElement).x, shapes.get(paddleRightElement).y, shapes.get(paddleRightElement).h ); 
      //Drawing where tokens should be
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
      fill(contrast);
      stroke(contrast);
      textAlign(CENTER);
      textSize(shapes.get(lBoardElement).h/2);
      text(lScore, (shapes.get(lBoardElement).x+(shapes.get(lBoardElement).w*1/2)), (shapes.get(lBoardElement).y+(shapes.get(lBoardElement).h*1/2)));
      text(rScore, (shapes.get(rBoardElement).x+(shapes.get(rBoardElement).w*1/2)), (shapes.get(rBoardElement).y+(shapes.get(rBoardElement).h*1/2)));
    }
  }//End instructionsOn==false
}
  //
}
//End draw
// Start keyPressed
void keyPressed() {
  int paddleLeftElement = 1;
  int paddleRightElement = 2;
  int rectL = 6;
  int rectR = 7;
  // Opens And Closes Instructions
  if ( key == 'I' || key == 'i' ) {
    if ( instructionsOn==true ) {
      instructionsOn=false;
    } else {
      instructionsOn=true;
    }
  }
  shapes.get(paddleLeftElement).leftPaddleSpeed();
  shapes.get(paddleRightElement).rightPaddleSpeed();
  shapes.get(paddleLeftElement).leftPaddleMove();
  shapes.get(paddleRightElement).rightPaddleMove();
  // Turn On Screen Saver
  if(key == 'f' || key == 'F'){
    screensaver = true;
  }
  // Turn On Single Player
  if(key == 'j' || key == 'J'){
    singleplayer = true;
  }
  // Turn On Night Mode 
  if(key == 'q' || key == 'Q') {
    nightmode = true;
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  }
  // Turn Off Night Mode
  if(key == 'e' || key == 'E') {
    nightmode = false;
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  }
  //Setting Paddle Speeds 
  // Reset Game
  if(key == 'z' || key == 'Z') {
    //Scoreboards to original
    lScore = 0;
    rScore = 0;
    //Paddle position to original
    shapes.get(paddleLeftElement).y = appHeight*1/4;
    shapes.get(paddleRightElement).y = appHeight*1/4;
    shapes.get(rectL).y = height;
    shapes.get(rectR).y = height;
    // Ball to original
    shapes.get(lenMiddle).x = displayWidth*1/2;
    shapes.get(lenMiddle).y = displayHeight*1/2;
    // Single player and screen saver turned off
    singleplayer = false;
    screensaver = false;
    // Turn on instructions
    instructionsOn = true;
  }
}
//End keyPressed
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
