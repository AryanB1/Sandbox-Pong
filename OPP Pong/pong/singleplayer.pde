class singlePlayer {
  private boolean singlePlayer;
  singlePlayer() {
    singlePlayer = false;
  }
  void checkSinglePlayer() {
    if(key == 'j' || key == 'J') singlePlayer = true;
  }
  void activateSinglePlayer() {
    paddle.paddleYRight = int(ball.y)-paddle.paddleHeight*1/2;
    if(paddle.paddleYRight <= 0) paddle.paddleYRight = 0;
    if(paddle.paddleYRight >= displayHeight-paddle.paddleHeight) paddle.paddleYRight = displayHeight-paddle.paddleHeight;  
  }
}
