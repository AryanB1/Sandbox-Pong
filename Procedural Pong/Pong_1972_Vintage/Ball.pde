//Global Variables
int xMove, yMove; //see population
Boolean rightGoalScore = false;
Boolean leftGoalScore = false;
//Start ball
void ball() {
  //initializes ball
  ballStart();
  //Starts ball movement in specific circumstances
  if (screenSaver == false && singlePlayer == false && leftPaddleMovement == true && rightPaddleMovement == true) ballMove();
  if(screenSaver == true) ballMove();
  if(singlePlayer == true && leftPaddleMovement == true) ballMove();
}
//End ball
//Start ballMove
void ballMove() {
  //Moving ball if it hits left or right, but not on paddle
  if (xBall >= x1RightNet-(ballDiameter*1/2)) {
    rightGoalScore = true;
    population();
  } 
  else if (xBall <= x1LeftNet+(ballDiameter*1/2)) {
    leftGoalScore = true;
    population();
  } else {
    //Setting ball speeds, and increasing ball speeds based on specific factors
    //Screen Saver movement
    if(screenSaver == true){
    xBall += xMove*7;
    yBall += yMove*7;
    }
    //Single player movement
    else if(singlePlayer == true) {
    xBall += xMove*((leftScore*1/2)+2);
    yBall += yMove*((leftScore*1/2)+2);
    }
    // normal movement
    else {
      xBall += xMove*(((leftScore+rightScore)*1/4)+2);
      yBall += yMove*(((leftScore+rightScore)*1/4)+2);
    }
  }
  //Moving ball if it hits top or bottom
  if ( xBall<=(width*0)+(ballDiameter*1/2) || xBall>=width-(ballDiameter*1/2) ){ 
    xMove*=-1;
}
  if ( yBall<=(height*0)+(ballDiameter*1/2) || yBall>=height-(ballDiameter*1/2) ){
    yMove*=-1;
  }
  //Checking if ball hits paddles
  if (xBall >= xLeftPaddle+widthPaddle && xBall <= xLeftPaddle+widthPaddle+(ballDiameter*1/2) && yBall >= yLeftPaddle && yBall <= yLeftPaddle+(heightPaddle)){
    xMove *= -1;
    if(singlePlayer == true) leftScore += 1;
  }
  if (xBall <= xRightPaddle && xBall >= xRightPaddle-(ballDiameter*1/2) && yBall >= yRightPaddle && yBall <= yRightPaddle+(heightPaddle)){
    xMove *= -1;
  }
}
//End ballMove
//Start ballStart
void ballStart() {
  //Draw ball
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}
//End ballStart
