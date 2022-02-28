/*Best Practice: same variables are populated on the same line
 Variables should be organized to ease human reading
 */
void population() {
  xBall = displayWidth*1/2;
  yBall = displayHeight*1/2;
  ballDiameter = displayWidth*1/50;
  x2MiddleLine= x1MiddleLine = displayWidth*1/2;
  xLeftPaddle = x2LeftNet = x1LeftNet = displayWidth*1/40;
  x2RightNet = x1RightNet = displayWidth*39/40;
  yLeftScore = yRightScore = y1MiddleLine = y1RightNet = y1LeftNet = displayHeight*0;
  y2MiddleLine = y2RightNet = y2LeftNet = displayHeight;
  widthPaddle = displayWidth*1/100;
  heightPaddle = displayHeight*1/5;
  widthScore = displayWidth*1/10;
  heightScore = displayHeight*1/10;
  //
  yLeftPaddle = (displayHeight*1/2) - (heightPaddle*1/2);
  yRightPaddle = (displayHeight*1/2)  - (heightPaddle*1/2);
  xRightPaddle = (displayWidth*39/40) - (widthPaddle);
  //
  xLeftScore = (displayWidth*1/4) - (widthScore*1/2);
  xRightScore = (displayWidth*3/4) - (widthScore*1/2);
  //
  //int( random( -2, 2) ) biased to 0
  while (xMove==0) xMove = int( random( -2, 2) );
  while (yMove==0) yMove = int( random( -2, 2) );
  xMove = xMove + leftScore + rightScore;
  yMove = yMove + leftScore + rightScore;
  /* Below is valid WHILE but might run more code ... please check
  while (xMove==0 || yMove==0) {
    xMove = int( random( -2, 2) );
    yMove = int( random( -2, 2) );
  }
  */
  //Truncation removes decimals
}//End yMove WHILE
