int xMove = 1, yMove = 1;
Boolean rigthGoalScore = false;

void ball() {
  ballStart();
  ballMove();
}//End ball()

void ballMove() {
  if ( xBall<=(width*0)+(ballDiameter*1/2) || xBall>=width-(ballDiameter*1/2) ) xMove*=-1;
  if ( yBall<=(height*0)+(ballDiameter*1/2) || yBall>=height-(ballDiameter*1/2) ) yMove*=-1;
  xBall += xMove;
  if (rigthGoalScore==false) yBall += yMove;
  //Stop ball when goal is scored
  goalCheck();
}//End ballMove

void goalCheck() {
  if ( xBall >= x1RightNet-(ballDiameter*1/2) )
  {
    rigthGoalScore = true;
    xBall = width-ballDiameter*1/2;
  }//End rightNet
}//End goalCheck

void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//End ballStart
