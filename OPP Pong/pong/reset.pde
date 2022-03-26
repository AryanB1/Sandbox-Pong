class reset {
  private boolean endGame;
  reset(){
    endGame = false;
  }
  void resetCheck(){
    if(key == 'z' || key == 'Z') endGame = true;
  }
  void theGreatReset() {
    screensaver.screenSaver = false;
    singleplayer.singlePlayer = false;
    paddle.upLeft = false;
    paddle.downLeft = false;
    paddle.upRight = false;
    paddle.downLeft = false;
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
  
}
