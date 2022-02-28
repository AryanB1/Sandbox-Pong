int xMove, yMove; //see population
Boolean rightGoalScore = false;
Boolean leftGoalScore = false;
void ball() {
  ballStart();
  ballMove();
}//End ball()

void ballMove() {
  //Conditional for Goal Check and Moving the Ball on the x-axis
  if (xBall >= x1RightNet-(ballDiameter*1/2)) {
    rightGoalScore = true;
    xBall = displayWidth*1/2;
    yBall = displayHeight*1/2;
  } else if (xBall <= x1LeftNet+(ballDiameter*1/2)) {
    leftGoalScore = true;
    xBall = displayWidth*1/2;
    yBall = displayHeight*1/2;
  } else {
    xBall += xMove;
    yBall += yMove;
  }
  //
  if ( xBall<=(width*0)+(ballDiameter*1/2) || xBall>=width-(ballDiameter*1/2) ){ 
    xMove*=-1;
}
  if ( yBall<=(height*0)+(ballDiameter*1/2) || yBall>=height-(ballDiameter*1/2) ){
    yMove*=-1;
  }
  if (xBall >= xLeftPaddle+widthPaddle && xBall <= xLeftPaddle+(2*widthPaddle) && yBall <= yLeftPaddle-widthPaddle && yLeftPaddle >= yLeftPaddle+(2*widthPaddle)){
    xMove *= -1;
  }
  if (xBall+widthPaddle >= xRightPaddle && xBall <= xRightPaddle+(2*widthPaddle) && yBall <= yLeftPaddle-widthPaddle && yLeftPaddle >= yLeftPaddle+(2*widthPaddle)){
    xMove *= -1;
  }
  //
}//End ballMove
void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//End ballStart
