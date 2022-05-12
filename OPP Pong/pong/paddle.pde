// Start paddle class
class Paddle {
  //Global Variables
  private color colour, colourResetWhite=#000000;
  private int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleLeftHeight, paddleRightHeight, paddleHeight, leftPaddleSpeed, rightPaddleSpeed, paddleLeftOrigin, paddleRightOrigin, yMove, paddleX, paddleY, reduction;
  private Boolean upLeft, downLeft, upRight, downRight, paddleLeftSpeed, paddleRightSpeed;
  public Boolean leftDrop = false, rightDrop = false;
  //Start Constructor
  Paddle (float widthParameter, float heightParameter) {
    //For the colours, everything is randomized between 80 and 220
    //This is because through testing, I found that the 0-80, 220-255 range was a bit too solid
    //In comparison, since the 80-220 range is smaller, all the colours have a relatively similar level of colour solidness
    //This in turn makes it easier on the eyes
    //This range is slightly larger than the ball class, because it would be boring if everything was the same
    if ( nightmode.nightMode == false ) this.colour = color ( int(random(80, 220)), int(random(80, 220)), int(random(80, 220)) ) ; 
    if ( nightmode.nightMode == true ) this.colour = color ( int(random(80, 220)), int(random(80, 220)), 0 ) ; 
    //Assigning Values
    paddleWidth = int(widthParameter*1/80); 
    paddleXLeft = int(widthParameter*1/40);
    paddleXRight = int(widthParameter*39/40) - paddleWidth;
    this.paddleLeftHeight = int(heightParameter*1/4);
    this.paddleRightHeight = int(heightParameter*1/4);
    reduction = int(heightParameter)*1/20;
    paddleLeftOrigin = int(heightParameter*1/2) - paddleLeftHeight*1/2;
    paddleRightOrigin = int(heightParameter*1/2) - paddleRightHeight*1/2;
    //Paddles Start middle
    this.paddleYLeft = paddleLeftOrigin;
    this.paddleYRight = paddleRightOrigin;
    //Variables to move the paddle and select speed
    this.upLeft = false;
    this.downLeft = false;
    this.upRight = false;
    this.downRight = false;
    this.paddleLeftSpeed = false;
    this.paddleRightSpeed = false;
  }
  //This paddle constructor is an easter egg when the score is one for either the left or right player
  //After a closer look, implementing my planned easter egg would just make my game look buggy rather than cool
  Paddle (float widthParameter, float heightParameter, String leftOrRight) {
    //For the colours, everything is randomized between 80 and 220
    //This is because through testing, I found that the 0-80, 220-255 range was a bit too solid
    //In comparison, since the 80-220 range is smaller, all the colours have a relatively similar level of colour solidness
    //This in turn makes it easier on the eyes
    //This range is slightly larger than the ball class, because it would be boring if everything was the same
    if ( nightmode.nightMode == false ) this.colour = color ( int(random(80, 220)), int(random(80, 220)), int(random(80, 220)) ) ; 
    if ( nightmode.nightMode == true ) this.colour = color ( int(random(80, 220)), int(random(80, 220)), 0 ) ; 
    //Assigning Values
    paddleWidth = int(displayWidth*1/80); 
    paddleX = int(widthParameter); // displayWidth*1/40 or widthParameter*39/40 - paddleWidth;
    paddleHeight = paddle.reduction;
    //Paddles Start middle
    this.paddleY = int(heightParameter);
  }
  //End Constructor
  //Start paddleMoveLeft() -- as title suggests, handles left paddle movement. 
  void paddleMoveLeft(){
    //Setting Speed key presses
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
    //Paddle won't go off screen
    if(Instruction.openInstructions == false){
      if ( paddleYLeft < displayHeight*0)this.upLeft = false;
      else this.upLeft = true;
      if ( paddleYLeft+paddleLeftHeight > displayHeight) this.downLeft = false;
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
  }
  // End paddleMoveLeft()
  //Start paddleMoveRight() -- as title suggests, handles right paddle movement. 
  void paddleMoveRight() {
    //Setting Speed key presses
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
    //Paddle won't go off screen
    if ( paddleYRight < (displayHeight*0)) this.upRight = false;
    if ( paddleYRight+paddleRightHeight > displayHeight) this.downRight = false;
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
  //End paddleMoveRight();
  //Start movement() -- Makes sure nothing moves when it is not supposed to 
  void movement(){
    if(screensaver.screenSaver == false) paddleMoveLeft();
    if(screensaver.screenSaver == false && singleplayer.singlePlayer == false) paddleMoveRight();
  }
  //end movement()
  //Start colourChange()
  void colourChange() {
    if(Scoreboard.leftGoalScore == true || Scoreboard.rightGoalScore == true ) {
      //Re assigns colours, cuz monotone would be boring
      if ( nightmode.nightMode == false ) this.colour = color ( int(random(80, 220)), int(random(80, 220)), int(random(80, 220)) ) ; 
      if ( nightmode.nightMode == true ) this.colour = color ( int(random(80, 220)), int(random(80, 220)), 0 ) ; 
    }
  }
  //End colourChange()
  //Start Draw -- draws left and right paddles()
  void draw() {
    leftPaddle();
    rightPaddle();
  }//End draw
  // Start leftpaddle()
  void leftPaddle() {
    //Changes colour
    colourChange();
    fill(colour);
    //Draws paddle and reduces paddle size based on the players score
    rect(paddleXLeft, paddleYLeft, paddleWidth, paddleLeftHeight-(Scoreboard.leftScore*reduction));
    fill(colourResetWhite);
  }
  //End leftPaddle
  //Start rightPaddle
  void rightPaddle() {
    //Changes Colour
    colourChange();
    fill(colour);
    //Draws paddle
    rect(paddleXRight, paddleYRight, paddleWidth, paddleRightHeight-(Scoreboard.rightScore*reduction));
    fill(colourResetWhite);
  }
  //End rightPaddle
  //Start Paddle Reduction
  void drawPaddles() {                   
    fill(paddle.colour);
    //Draws paddle and reduces paddle size based on the players score
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    if (paddleY < displayHeight+25) this.paddleY += 3;
    fill(colourResetWhite);
    }
  
}
//End Paddle class
