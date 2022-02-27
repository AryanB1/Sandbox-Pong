//Global Variables
int rightPaddleSpeed;
boolean moveRightPaddleDown = true;
boolean moveRightPaddleUp = true;
void rightPaddleDraw() {
  rightPaddleStart();
  //
  if ( yRightPaddle < (displayHeight*0)) moveRightPaddleUp = false;
  if ( yRightPaddle+heightPaddle > displayHeight) moveRightPaddleDown = false;
  //
}//End rightPaddle

void rightPaddleKeyPressed() {
  //Right Paddle: ARROW Keys
  if(key=='N' || key=='n') {
    rightPaddleSpeed = 10;
  }
  if(key=='R'||key=='r'){
    rightPaddleSpeed = 20;
  }
  if(key=='G'||key=='g'){
    rightPaddleSpeed = 30;
  }
  if ( key==CODED && keyCode==UP && moveRightPaddleUp == true ){
    yRightPaddle -= rightPaddleSpeed; //yRightPaddle=yRightPaddle-1, yRightPaddle--
    moveRightPaddleDown = true;  
}
  if ( key==CODED && keyCode==DOWN && moveRightPaddleDown == true) { 
    yRightPaddle += rightPaddleSpeed;
    println(yRightPaddle);
    moveRightPaddleUp = true;
}
}
//End rightPaddlekeyPressed

void rightPaddleStart() {
  rect(xRightPaddle, yRightPaddle, widthPaddle, heightPaddle);
}//End rightPaddleStart
