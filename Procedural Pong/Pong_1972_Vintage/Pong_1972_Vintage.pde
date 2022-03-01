//Global Variables
//Best Practice: initialization on similar lines
float xBall, yBall, ballDiameter;
float xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle, xRightPaddle, yRightPaddle;
float xLeftScore, yLeftScore, xRightScore, yRightScore, widthScore, heightScore;
float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet;
float x1RightNet, y1RightNet, x2RightNet, y2RightNet;
float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine;
int time, Base, Contrast;
void setup() {
  //Geomtery Communication and Variables for GUI Ratios
  fullScreen();
  frameRate(60);
  population(); //One purpose of developer-written functions
  time = hour();
  if(time < 8 || time > 18) {
    Base = 0;
    Contrast = 255;
  }
  else{
    Base = 255;
    Contrast = 0;
  }  // 
}//End setup

void draw() {
  //Objects use variables to ID purpqwose of function
  background(Base);
  fill(Contrast);
  leftPaddleDraw(); //Another Purpose of developer-written functions
  rightPaddleDraw();
  scoreUpdate();
  stroke(Contrast);
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine); //Needs to be dotted
  for(int i = 0; i < y2MiddleLine; i += 20) {
    stroke(Base);
    line(x1MiddleLine, i, x2MiddleLine, (i+10));
  }
  fill(Base);
  stroke(Base);
  rect(xLeftScore, yLeftScore, widthScore, heightScore);
  rect(xRightScore, yRightScore, widthScore, heightScore);
  fill(Contrast);
  textAlign(CENTER);
  textSize(heightScore*1/2);
  text(leftScore, (xLeftScore+(widthScore*1/2)), (yLeftScore+(heightScore*1/2)));
  textAlign(CENTER);
  textSize(heightScore*1/2);
  text(rightScore, (xRightScore+(widthScore*1/2)), (yRightScore+(heightScore*1/2)));
  ball();
}//End draw

void keyPressed() { //Listener
  rightPaddleKeyPressed();
  leftPaddleKeyPressed();
  smooth();
}//End keyPressed

void mousePressed() {
}//End mousePressed
