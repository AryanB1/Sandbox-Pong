//Global Variables
int rightPaddleSpeed;
boolean moveRightPaddleDown = true;
boolean moveRightPaddleUp = true;
boolean rightPaddleMovement = false;
void rightPaddleDraw() {
  rightPaddleStart();
  //
  if ( yRightPaddle < (displayHeight*0)) moveRightPaddleUp = false;
  if ( yRightPaddle+heightPaddle > displayHeight) moveRightPaddleDown = false;
  //
}//End rightPaddle

void rightPaddleKeyPressed() {
  //Right Paddle: ARROW Keys
  if(singlePlayer == false && screenSaver == false){
    if(key=='M' || key=='m') {
      rightPaddleSpeed = 10;
      rightPaddleMovement = true;
    }
    if(key=='t'||key=='T'){
      rightPaddleSpeed = 20;
      rightPaddleMovement = true;
    }
    if(key=='h'||key=='H'){
      rightPaddleSpeed = 30;
      rightPaddleMovement = true;
    }
    if ( key==CODED && keyCode==UP && moveRightPaddleUp == true ){
      yRightPaddle -= rightPaddleSpeed; //yRightPaddle=yRightPaddle-1, yRightPaddle--
      moveRightPaddleDown = true;  
  }
    if ( key==CODED && keyCode==DOWN && moveRightPaddleDown == true) { 
      yRightPaddle += rightPaddleSpeed;
      moveRightPaddleUp = true;
    }
    if(key =='p' || key == 'P' ) yRightPaddle = yBall;
  }
}
//End rightPaddlekeyPressed

void rightPaddleStart() {
  rect(xRightPaddle, yRightPaddle, widthPaddle, heightPaddle);
}//End rightPaddleStart
