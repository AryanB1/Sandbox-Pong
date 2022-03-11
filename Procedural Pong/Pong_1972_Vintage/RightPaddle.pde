//Global Variables
int rightPaddleSpeed;
boolean moveRightPaddleDown = true;
boolean moveRightPaddleUp = true;
boolean rightPaddleMovement = false;
//Start rightPaddleDraw
void rightPaddleDraw() {
  //Initialize right paddle
  rightPaddleStart();
  // Ensures paddle does not move off of screen
  if ( yRightPaddle < (displayHeight*0)) moveRightPaddleUp = false;
  if ( yRightPaddle+heightPaddle > displayHeight) moveRightPaddleDown = false;
  //
}
//End rightPaddleDraw
//Start rightPaddleKeyPressed
void rightPaddleKeyPressed() {
  //Ensures screen saver and single player is not active
  if(singlePlayer == false && screenSaver == false){
    //Sets paddle speed based on key press
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
    //Moves Paddle Up
    if ( key==CODED && keyCode==UP && moveRightPaddleUp == true ){
      yRightPaddle -= rightPaddleSpeed;
      moveRightPaddleDown = true;  
  }
  //Moves Paddle Down
    if ( key==CODED && keyCode==DOWN && moveRightPaddleDown == true) { 
      yRightPaddle += rightPaddleSpeed;
      moveRightPaddleUp = true;
    }
  }
}
//End rightPaddlekeyPressed
//Start rightPaddleStart
void rightPaddleStart() {
  //draw rectangle
  rect(xRightPaddle, yRightPaddle, widthPaddle, heightPaddle);
}
//End rightPaddleStart
