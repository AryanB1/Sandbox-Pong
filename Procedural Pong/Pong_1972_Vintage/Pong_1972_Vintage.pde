//Global Variables
float xBall, yBall, ballDiameter;
float xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle, xRightPaddle, yRightPaddle;
float xLeftScore, yLeftScore, xRightScore, yRightScore, widthScore, heightScore;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet;
float x1RightNet, y1RightNet, x2RightNet, y2RightNet;
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine;
int time, Base, Contrast;
boolean draw;
// Start Setup
void setup() {
  //Causes Processing to automatically determine screen size
  fullScreen();
  //Smooths animations
  smooth(6);
  //Locks frame per second
  frameRate(60);
  // populates Global Variables
  population();
  //Checks time to determine whether to use light mode or dark mode
  checkTime();
  // Prints instructions to console
  startingInstructions();
}
//End Setup
//Start Draw
void draw() {
  //Runs artificial intelligence function which contains all commands that can be run
  artificalIntelligence();
}
//End Draw
//Start keyPressed
void keyPressed() { //Listener
  //Checks for Right Paddle Key Presses
  rightPaddleKeyPressed();
  //Checks for Left Paddle Key Presses
  leftPaddleKeyPressed();

}
//End keyPressed
