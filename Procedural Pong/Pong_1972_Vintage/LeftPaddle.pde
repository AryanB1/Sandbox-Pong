//Global Variable
int leftPaddleSpeed;
boolean moveLeftPaddleDown = true;
boolean moveLeftPaddleUp = true;
void leftPaddleDraw() {
  leftPaddleStart(); //Might have to move outside draw()
  //
  if ( yLeftPaddle < displayHeight*0) moveLeftPaddleUp = false;
  if ( yLeftPaddle+heightPaddle > displayHeight) moveLeftPaddleDown = false;
  //
}//End leftPaddle

void leftPaddleKeyPressed() {
  if(key=='N' || key=='n') {
    leftPaddleSpeed = 10;
  }
  if(key=='R'||key=='r'){
    leftPaddleSpeed = 20;
  }
  if(key=='G'||key=='g'){
    leftPaddleSpeed = 30;
  }
  if ( key=='W' && moveLeftPaddleUp == true|| key=='w' && moveLeftPaddleUp == true){ 
    yLeftPaddle -= leftPaddleSpeed; //yRightPaddle=yRightPaddle-1, yRightPaddle--
    moveLeftPaddleDown = true;
  }
  if ( key=='S' && moveLeftPaddleDown == true || key=='s' && moveLeftPaddleDown == true){
    yLeftPaddle += leftPaddleSpeed;
    moveLeftPaddleUp = true;
  }
}//End rightPaddlekeyPressed

void leftPaddleStart() {
  rect(xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle);
}//End leftPaddleStart()
