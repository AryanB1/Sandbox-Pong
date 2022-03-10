boolean screenSaver = false;
boolean singlePlayer = false;
int screenSaverSpeed = 5;
void artificalIntelligence(){
  if(key == 'f' || key == 'F') screenSaver = true;
  if(key == 'z' || key == 'Z') screenSaver = false;
  if(key == 'j' || key == 'J') singlePlayer = true;
  if(key == 'q' || key == 'Q') singlePlayer = false;
  if(screenSaver == true){
    screenValidity();
    screenSaverSpeed = 0;
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
  else if(singlePlayer == true) {
    yRightPaddle = yBall-heightPaddle*1/2;
    if(yRightPaddle <= 0) yRightPaddle = 0;
    if(yRightPaddle >= displayHeight-heightPaddle) yRightPaddle = displayHeight-heightPaddle;
  }
  else{
    screenValidity();
  }
}
