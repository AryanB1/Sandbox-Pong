float xBall, yBall, ballDiameter, xPaddleLeft, yPaddleLeft, widtPaddleLeft, heightPaddleLeft, xPaddleRight, yPaddleRight, widthPaddleRight, heightPaddleRight, x1NetLeftTop, y1NetLeftTop, x2NetLeftBottom, y2NetLeftBottom, x1NetMiddleTop, y1NetMiddleTop, x2NetMiddleBottom, y2NetMiddleBottom, x1NetRightTop, y1NetRightTop, x2NetRightBottom, y2NetRightBottom;
void setup(){
  //size(400, 400);
  fullScreen(); //displayWidth, displayHeight
  population();
  xPaddleLeft = x1NetLeftTop;
  yPaddleLeft = displayHeight*1/2;
  widtPaddleLeft = displayWidth*1/100;
  heightPaddleLeft = displayHeight*1/5;
} //End Setup

void draw(){
  ellipse(xBall, yBall, ballDiameter, ballDiameter); //ball
  rect(xPaddleLeft, yPaddleLeft, widtPaddleLeft, heightPaddleLeft); //left paddle
  rect(xPaddleRight, yPaddleRight, widthPaddleRight, heightPaddleRight); //right paddle
  line(x1NetLeftTop, y1NetLeftTop, x2NetLeftBottom, y2NetLeftBottom); //left net
  line(x1NetMiddleTop, y1NetMiddleTop, x2NetMiddleBottom, y2NetMiddleBottom); // middle line
  line(x1NetRightTop, y1NetRightTop, x2NetRightBottom, y2NetRightBottom); //right net
} //End Draw

void keyPressed(){}// End keyPressed

void mousePressed(){}//End mousePressed
