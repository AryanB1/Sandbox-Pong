//Start reset class
class reset {
  //Global Variable
  private boolean endGame;
  //Start Constructor
  reset(){
    //Assign Value
    endGame = false;
  }
  //End Constructor
  //Start resetCheck() -- checks for keypress
  void resetCheck(){
    if(key == 'z' || key == 'Z') endGame = true;
  }
  //end resetCheck()
  //Starts theGreatReset()
  void theGreatReset() {
    //Resets the entire game
    screensaver.screenSaver = false;
    singleplayer.singlePlayer = false;
    paddle.upLeft = false;
    paddle.downLeft = false;
    paddle.upRight = false;
    paddle.downRight = false;
    paddle.paddleLeftSpeed = false;
    paddle.paddleRightSpeed = false;
    paddle.paddleYLeft = paddle.paddleOrigin;
    paddle.paddleYRight = paddle.paddleOrigin;
    Scoreboard.leftScore = 0;
    Scoreboard.rightScore = 0;
    ball.x = ball.xStart;
    ball.y = ball.yStart;
    endGame = false;
  }
  // End theGreatReset()
}
//End reset class
