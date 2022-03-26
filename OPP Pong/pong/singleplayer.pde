//Start singlePlayer class
class singlePlayer {
  //Global Variables
  private boolean singlePlayer, singleUse;
  //Start Constructor
  singlePlayer() {
    //Assign values
    singlePlayer = false;
    singleUse = false;
  }
  //End Constructor
  //Check for key press
  void checkSinglePlayer() {
    if(key == 'j' || key == 'J'){
      singlePlayer = true;
      singleUse = true;
    }
  }
  //start activateSinglePlayer()
  void activateSinglePlayer() {
    //stop user input on right paddle
    paddle.paddleRightSpeed = false;
    paddle.upRight = false;
    paddle.downRight = false;
    ///resets score board once
    if(singleUse == true){
      Scoreboard.leftScore = 0;
      Scoreboard.rightScore = 0;
      singleplayer.singleUse = false;
    }
    //makes sure right paddle always hits ball and never goes off screen
    paddle.paddleYRight = int(ball.y)-paddle.paddleHeight*1/2;
    if(paddle.paddleYRight <= 0) paddle.paddleYRight = 0;
    if(paddle.paddleYRight >= displayHeight-paddle.paddleHeight) paddle.paddleYRight = displayHeight-paddle.paddleHeight;  
  }
  //End activateSinglePlayer()
}
//End singlePlayer class
