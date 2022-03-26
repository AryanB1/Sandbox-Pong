class Paddle {
  //Global Variables
  private color colour, colourResetWhite=#000000;
  private int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleHeight, leftPaddleSpeed, rightPaddleSpeed, paddleOrigin, yMove;
  private Boolean upLeft, downLeft, upRight, downRight, paddleLeftSpeed, paddleRightSpeed;
  //
  Paddle (float widthParameter, float heightParameter) { //General Population
    if ( nightmode.nightMode == false ) this.colour = color ( int(random(100, 255)), int(random(50, 255)), int(random(175, 255)) ) ; //random, different
    if ( nightmode.nightMode == true ) this.colour = color ( int(random(100, 255)), int(random(50, 255)), 0 ) ; //random, different
    //Game start, paddles in the middle
    paddleWidth = int(widthParameter*1/80); //no "this" thus no change ever
    paddleXLeft = int(widthParameter*1/40);
    paddleXRight = int(widthParameter*39/40) - paddleWidth;
    paddleHeight = int(heightParameter*1/4);
    paddleOrigin = int(heightParameter*1/2) - paddleHeight*1/2;
    this.paddleYLeft = paddleOrigin;
    this.paddleYRight = paddleOrigin;
    //Variables to move the paddle
    this.upLeft = false;
    this.downLeft = false;
    this.upRight = false;
    this.downRight = false;
    this.paddleLeftSpeed = false;
    this.paddleRightSpeed = false;
  }
  //Sets paddle speed based on key press
  void paddleMoveLeft(){
    if(key=='N' || key=='n') {
      leftPaddleSpeed = 10;
      this.paddleLeftSpeed = true;
      this.upLeft = true;
      this.downLeft = true;
    }
    if(key=='R'||key=='r'){
      leftPaddleSpeed = 20;
      this.paddleLeftSpeed = true;
      this.upLeft = true;
      this.downLeft = true;
    }
    if(key=='G'||key=='g'){
      leftPaddleSpeed = 30;
      this.paddleLeftSpeed = true;
      this.upLeft = true;
      this.downLeft = true;
    }
    if ( paddleYLeft < displayHeight*0)this.upLeft = false;
    else this.upLeft = true;
    if ( paddleYLeft+paddleHeight > displayHeight) this.downLeft = false;
    else this.downLeft = true;
    //Moves Paddle Up
    if ( key=='W' && this.upLeft == true|| key=='w' && this.upLeft == true){ 
       paddleYLeft -= leftPaddleSpeed;
       this.downLeft = true;
      }
    //Moves Paddle Down
    if ( key=='S' && this.downLeft == true || key=='s' && this.downLeft == true){
      paddleYLeft += leftPaddleSpeed;
      this.upLeft = true;
    }
  }
  void paddleMoveRight() {
   if(key=='M' || key=='m') {
      rightPaddleSpeed = 10;
      this.paddleRightSpeed = true;
      this.upRight = true;
      this.downRight = true;
    }
    if(key=='t'||key=='T'){
      rightPaddleSpeed = 20;
      this.paddleRightSpeed = true;
      this.upRight = true;
      this.downRight = true;
    }
    if(key=='h'||key=='H'){
      rightPaddleSpeed = 30;
      this.paddleRightSpeed = true;
      this.upRight = true;
      this.downRight = true;
    }
    if ( paddleYRight < (displayHeight*0)) this.upRight = false;
    if ( paddleYRight+paddleHeight > displayHeight) this.downRight = false;
    //Moves Paddle Up
    if ( key==CODED && keyCode==UP && this.upRight == true ){
      paddleYRight -= rightPaddleSpeed;
      this.downRight = true;  
  }
  //Moves Paddle Down
    if ( key==CODED && keyCode==DOWN && this.downRight == true) { 
      paddleYRight += rightPaddleSpeed;
      this.upRight = true;
    }
  }
  void movement(){
    if(screensaver.screenSaver == false) paddleMoveLeft();
    if(screensaver.screenSaver == false && singleplayer.singlePlayer == false) paddleMoveRight();
  }
  void colourChange() {
    if(Scoreboard.leftGoalScore == true || Scoreboard.rightGoalScore == true ) {
      if ( nightmode.nightMode == false ) this.colour = color ( int(random(100, 255)), int(random(50, 255)), int(random(175, 255)) ) ; //random, different
      if ( nightmode.nightMode == true ) this.colour = color ( int(random(100, 255)), int(random(50, 255)), 0 ) ; //random, different
    }
  }
  void draw() {
    leftPaddle();
    rightPaddle();
  }//End draw
  //
  void leftPaddle() {
    //Specific Colour - configuration?
    colourChange();
    fill(colour);
    rect(paddleXLeft, paddleYLeft, paddleWidth, paddleHeight);
    fill(colourResetWhite);
  }//End leftPaddle
  //
  void rightPaddle() {
    //Specific Colour - configuration?
    colourChange();
    fill(colour);
    rect(paddleXRight, paddleYRight, paddleWidth, paddleHeight);
    fill(colourResetWhite);
  }//End rigthPaddle
}// //End move
//End Paddle
