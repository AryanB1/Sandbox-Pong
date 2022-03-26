//Start screenSaver class
class screenSaver {
  //Global Variable
  private boolean screenSaver;
  //Start constructor
  screenSaver() {
    //Assigns value
    screenSaver = false;
  }
  //End Constructor
  //Checks for key press
  void checkSaver() {
    if(key == 'f' || key == 'F') screenSaver = true;
  }
  //starts activateSaver()
  void activateSaver() {
    //Makes sure paddles always hit ball
    paddle.paddleYLeft = int(ball.y)-paddle.paddleHeight*1/2;
    paddle.paddleYRight = int(ball.y)-paddle.paddleHeight*1/2;
    //Makes sure user cannot move paddles
    paddle.upLeft = false;
    paddle.downLeft = false;
    paddle.upRight = false;
    paddle.downRight = false;
    paddle.paddleLeftSpeed = false;
    paddle.paddleRightSpeed = false;
    //sets scoreboards to 0
    Scoreboard.leftScore = 0;
    Scoreboard.rightScore = 0;
    //Makes sure paddles do not go off the screen
    if(paddle.paddleYLeft <=0 || paddle.paddleYRight <= 0) {
      paddle.paddleYLeft = 0;
      paddle.paddleYRight = 0;
    }
    if(paddle.paddleYLeft >= displayHeight-paddle.paddleHeight || paddle.paddleYRight >= displayHeight-paddle.paddleHeight){
      paddle.paddleYLeft = displayHeight-paddle.paddleHeight;
      paddle.paddleYRight = displayHeight-paddle.paddleHeight;  
  }
  }
  //End activateSaver()
}
//End screenSaver class
