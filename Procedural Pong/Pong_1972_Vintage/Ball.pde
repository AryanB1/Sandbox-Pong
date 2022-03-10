int xMove, yMove; //see population
Boolean rightGoalScore = false;
Boolean leftGoalScore = false;
void ball() {
  ballStart();
  if (screenSaver == false && singlePlayer == false && leftPaddleMovement == true && rightPaddleMovement == true) ballMove();
  if(screenSaver == true) ballMove();
  if(singlePlayer == true && leftPaddleMovement == true) ballMove();
}//End ball()

void ballMove() {
  //Conditional for Goal Check and Moving the Ball on the x-axis
  if (xBall >= x1RightNet-(ballDiameter*1/2)) {
    rightGoalScore = true;
    xBall = displayWidth*1/2;
    yBall = displayHeight*1/2;
  } 
  else if (xBall <= x1LeftNet+(ballDiameter*1/2)) {
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
  if (xBall >= xLeftPaddle+widthPaddle && xBall <= xLeftPaddle+widthPaddle+(ballDiameter*1/2) && yBall >= yLeftPaddle && yBall <= yLeftPaddle+(heightPaddle)){
    xMove *= -1;
  }
  if (xBall <= xRightPaddle && xBall >= xRightPaddle-(ballDiameter*1/2) && yBall >= yRightPaddle && yBall <= yRightPaddle+(heightPaddle)){
    xMove *= -1;
  }
  //
}//End ballMove
void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//End ballStart
