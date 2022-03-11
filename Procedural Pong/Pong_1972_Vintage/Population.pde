//Start population
void population() {
  //Ball variables
  xBall = displayWidth*1/2;
  yBall = displayHeight*1/2;
  ballDiameter = displayWidth*1/50;
  //Middle Line variables
  x2MiddleLine= x1MiddleLine = displayWidth*1/2;
  //Left paddle and line variables
  xLeftPaddle = x2LeftNet = x1LeftNet = displayWidth*1/40;
  //Right line variables
  x2RightNet = x1RightNet = displayWidth*39/40;
  //Scoreboards, middle line, right line, and left line
  yLeftScore = yRightScore = y1MiddleLine = y1RightNet = y1LeftNet = displayHeight*0;
  //All three lines
  y2MiddleLine = y2RightNet = y2LeftNet = displayHeight;
  //Paddle Variables
  widthPaddle = displayWidth*1/100;
  heightPaddle = displayHeight*1/5;
  yLeftPaddle = (displayHeight*1/2) - (heightPaddle*1/2);
  yRightPaddle = (displayHeight*1/2)  - (heightPaddle*1/2);
  xRightPaddle = (displayWidth*39/40) - (widthPaddle);
  //Scoreboard variables
  widthScore = displayWidth*1/10;
  heightScore = displayHeight*1/10;
  xLeftScore = (displayWidth*1/4) - (widthScore*1/2);
  xRightScore = (displayWidth*3/4) - (widthScore*1/2);
  //Starts movement variables of ball
  while (xMove==0) xMove = int( random( -2, 2) );
  while (yMove==0) yMove = int( random( -2, 2) );
}
//End population
