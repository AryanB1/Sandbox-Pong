//Global Variables
//Best Practice: initialization on similar lines
float xBall, yBall, ballDiameter;
float xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle, xRightPaddle, yRightPaddle;
float xLeftScore, yLeftScore, xRightScore, yRightScore, widthScore, heightScore;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet;
float x1RightNet, y1RightNet, x2RightNet, y2RightNet;
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine;

void setup() {
  //Geomtery Communication and Variables for GUI Ratios
  fullScreen();
  frameRate(60);
  population(); //One purpose of developer-written functions
  // 
}//End setup

void draw() {
  //Objects use variables to ID purpose of function
  background(0);
  leftPaddleDraw(); //Another Purpose of developer-written functions
  rightPaddleDraw();
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine); //Needs to be dotted
  rect(xLeftScore, yLeftScore, widthScore, heightScore);
  rect(xRightScore, yRightScore, widthScore, heightScore);
  ball();
}//End draw

void keyPressed() { //Listener
  rightPaddleKeyPressed();
  leftPaddleKeyPressed();
  smooth();
}//End keyPressed

void mousePressed() {
}//End mousePressed
