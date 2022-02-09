float xBall, yBall, ballDiameter;
float xPaddleLeft, yPaddleLeft, widthPaddleLeft, heightPaddleLeft;
float xPaddleRight, yPaddleRight, widthPaddleRight, heightPaddleRight;
float x1NetLeftTop, y1NetLeftTop, x2NetLeftBottom, y2NetLeftBottom;
float x1NetMiddleTop, y1NetMiddleTop, x2NetMiddleBottom, y2NetMiddleBottom;
float x1NetRightTop, y1NetRightTop, x2NetRightBottom, y2NetRightBottom;
float xLeftScore, yLeftScore, widthScore, heightScore, xRightScore, yRightScore;

void setup(){
  //size(400, 400);
  fullScreen(); //displayWidth, displayHeight
  population();

} //End Setup

void draw(){
  ellipse(xBall, yBall, ballDiameter, ballDiameter); //ball
  rect(xPaddleLeft, yPaddleLeft, widthPaddleLeft, heightPaddleLeft); //left paddle
  rect(xPaddleRight, yPaddleRight, widthPaddleRight, heightPaddleRight); //right paddle
  line(x1NetLeftTop, y1NetLeftTop, x2NetLeftBottom, y2NetLeftBottom); //left net
  line(x1NetMiddleTop, y1NetMiddleTop, x2NetMiddleBottom, y2NetMiddleBottom); // middle line
  line(x1NetRightTop, y1NetRightTop, x2NetRightBottom, y2NetRightBottom); //right net
  rect(xLeftScore, yLeftScore, widthScore, heightScore);
  rect(xRightScore, yRightScore, widthScore, heightScore);
} //End Draw

void keyPressed(){}// End keyPressed

void mousePressed(){}//End mousePressed
