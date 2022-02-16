int xMove, yMove; //see population
Boolean rigthGoalScore = false;

void ball() {
  ballStart();
  ballMove();
}//End ball()

void ballMove() {
  //Conditional for Goal Check and Moving the Ball on the x-axis
  if (xBall >= x1RightNet-(ballDiameter*1/2)) {
    xBall = displayWidth-ballDiameter*1/2;
  } else if (xBall <= x1LeftNet+(ballDiameter*1/2)) {
    xBall = (displayWidth*0)+(ballDiameter*1/2);
  } else {
    xBall += xMove;
    yBall += yMove;
  }
  //
  if ( xBall<=(displayWidth*0)+(ballDiameter*1/2) || xBall>=displayWidth-(ballDiameter*1/2) ) xMove*=-1;
  if ( yBall<=(displayHeight*0)+(ballDiameter*1/2) || yBall>=displayHeight-(ballDiameter*1/2) ) yMove*=-1;
  //
}//End ballMove

void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//End ballStart
