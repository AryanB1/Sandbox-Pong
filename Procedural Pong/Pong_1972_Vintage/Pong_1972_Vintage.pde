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
  //Objects use variables to ID purpqwose of function
  background(0);
  fill(255);
  leftPaddleDraw(); //Another Purpose of developer-written functions
  rightPaddleDraw();
  stroke(255);
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine); //Needs to be dotted
  for(int i = 0; i < y2MiddleLine; i += 20) {
    stroke(0);
    line(x1MiddleLine, i, x2MiddleLine, (i+10));
  }
  fill(0);
  stroke(0);
  rect(xLeftScore, yLeftScore, widthScore, heightScore);
  rect(xRightScore, yRightScore, widthScore, heightScore);
  fill(255);
  ball();
}//End draw

void keyPressed() { //Listener
  rightPaddleKeyPressed();
  leftPaddleKeyPressed();
  smooth();
}//End keyPressed

void mousePressed() {
}//End mousePressed
