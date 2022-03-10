//Global Variables
//Best Practice: initialization on similar lines
float xBall, yBall, ballDiameter;
float xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle, xRightPaddle, yRightPaddle;
float xLeftScore, yLeftScore, xRightScore, yRightScore, widthScore, heightScore;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet;
float x1RightNet, y1RightNet, x2RightNet, y2RightNet;
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine;
int time, Base, Contrast;
boolean draw;
void setup() {
  //Geomtery Communication and Variables for GUI Ratios
  fullScreen();
  frameRate(60);
  population(); //One purpose of developer-written functions
  checkTime();
  startingInstructions();
}

void draw() {
  artificalIntelligence();
}//End draw

void keyPressed() { //Listener
  rightPaddleKeyPressed();
  leftPaddleKeyPressed();
  smooth();
}//End keyPressed
