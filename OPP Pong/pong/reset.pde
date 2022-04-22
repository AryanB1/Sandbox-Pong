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
    if(singleplayer.singlePlayer == true || screensaver.screenSaver == true){
      ball.x = ball.xStart;
      ball.y = ball.yStart;
    }
    else{
      for (int i=0; i<balls.size(); i++) {
        balls.get(i).x = ball.xStart;
        balls.get(i).y = (displayHeight-(i*(displayHeight/(balls.size()+2))))/2;
  }
    }
    endGame = false;
  }
  // End theGreatReset()
}
//End reset class
//Night Sky Game win stuff, new constructor -> copy code -> call it in a way such that the background is overrw
//Fireworks for goals
//Increase in speed near paddle
