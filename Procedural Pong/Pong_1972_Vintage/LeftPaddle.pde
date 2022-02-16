//Global Variable
int leftPaddleSpeed = 1;

void leftPaddleDraw() {
  leftPaddleStart(); //Might have to move outside draw()
  //
  if ( yLeftPaddle < displayHeight*0) yLeftPaddle = displayHeight*0;
  if ( yLeftPaddle+heightPaddle > displayHeight) yLeftPaddle = displayHeight;
  //
}//End leftPaddle

void leftPaddleKeyPressed() {
  //Left Paddle: 'W' & 'S' Keys
  if ( key=='W' || key=='w' ) yLeftPaddle -= 1.1*leftPaddleSpeed ; //yRightPaddle=yRightPaddle-1, yRightPaddle--
  if ( key=='S' || key=='s' ) yLeftPaddle += leftPaddleSpeed;
}//End rightPaddlekeyPressed

void leftPaddleStart() {
  rect(xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle);
}//End leftPaddleStart()
