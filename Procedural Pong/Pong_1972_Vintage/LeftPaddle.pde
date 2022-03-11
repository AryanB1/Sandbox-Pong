//Global Variable
int leftPaddleSpeed;
boolean moveLeftPaddleDown = true;
boolean moveLeftPaddleUp = true;
boolean leftPaddleMovement = false;
//Start leftPaddleDraw
void leftPaddleDraw() {
  //initializes left paddle
  leftPaddleStart(); 
  // Ensures paddle does not move off of screen
  if ( yLeftPaddle < displayHeight*0) moveLeftPaddleUp = false;
  if ( yLeftPaddle+heightPaddle > displayHeight) moveLeftPaddleDown = false;
}
//End leftPaddleDraw
//Start leftPaddleKeyPressed
void leftPaddleKeyPressed() {
  //Ensures screen saver is not active
  if(screenSaver == false) {
    //Sets paddle speed based on key press
    if(key=='N' || key=='n') {
      leftPaddleSpeed = 10;
      leftPaddleMovement = true;
    }
    if(key=='R'||key=='r'){
      leftPaddleSpeed = 20;
      leftPaddleMovement = true;
    }
    if(key=='G'||key=='g'){
      leftPaddleSpeed = 30;
      leftPaddleMovement = true;
    }
    //Moves Paddle Up
    if ( key=='W' && moveLeftPaddleUp == true|| key=='w' && moveLeftPaddleUp == true){ 
      yLeftPaddle -= leftPaddleSpeed;
      moveLeftPaddleDown = true;
    }
    //Moves Paddle Down
    if ( key=='S' && moveLeftPaddleDown == true || key=='s' && moveLeftPaddleDown == true){
      yLeftPaddle += leftPaddleSpeed;
      moveLeftPaddleUp = true;
    }
  }
}
//End leftPaddleDraw
//Start leftPaddleStart
void leftPaddleStart() {
  //Draw Paddle
  rect(xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle);
}
//End leftPaddleStart
