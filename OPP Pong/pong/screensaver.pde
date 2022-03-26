class screenSaver {
  private boolean screenSaver;
  screenSaver() {
    screenSaver = false;
  }
  void checkSaver() {
    if(key == 'f' || key == 'F') screenSaver = true;
    if(key == 'z' || key == 'Z') screenSaver = false;
  }
  void activateSaver() {
    paddle.paddleYLeft = int(ball.y)-paddle.paddleHeight*1/2;
    paddle.paddleYRight = int(ball.y)-paddle.paddleHeight*1/2;
    Scoreboard.leftScore = 0;
    Scoreboard.rightScore = 0;
    if(paddle.paddleYLeft <=0 || paddle.paddleYRight <= 0) {
      paddle.paddleYLeft = 0;
      paddle.paddleYRight = 0;
    }
    if(paddle.paddleYLeft >= displayHeight-paddle.paddleHeight || paddle.paddleYRight >= displayHeight-paddle.paddleHeight){
      paddle.paddleYLeft = displayHeight-paddle.paddleHeight;
      paddle.paddleYRight = displayHeight-paddle.paddleHeight;  
  }
  }
}
