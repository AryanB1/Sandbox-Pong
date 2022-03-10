boolean screenSaver = false;
boolean singlePlayer = false;
void artificalIntelligence(){
  if(key == 'f' || key == 'F') screenSaver = true;
  if(key == 'z' || key == 'Z') screenSaver = false;
  if(key == 'j' || key == 'J') singlePlayer = true;
  if(key == 'q' || key == 'Q') singlePlayer = false;
  if(screenSaver == false){
    if (singlePlayer == true) {
      screenValidity();
      yRightPaddle = yBall-heightPaddle*1/2;
    }
    else {
      screenValidity();
    }
  }
  else if(screenSaver == true) {
    screenValidity();
    leftScore = 10;
    rightScore = 10;
    yLeftPaddle = yBall-heightPaddle*1/2;
    yRightPaddle = yBall-heightPaddle*1/2;
    if(yLeftPaddle <=0 || yRightPaddle <= 0) {
      yLeftPaddle = 0;
      yRightPaddle = 0;
    }
    if(yLeftPaddle >= displayHeight-heightPaddle || yRightPaddle >= displayHeight-heightPaddle){
      yLeftPaddle = displayHeight-heightPaddle;
      yRightPaddle = displayHeight-heightPaddle;  
  }
  }
}
