class Circle extends Shape {
  //Global Variables
  float ballSpeedX, ballSpeedY, directionX=0, directionY=0, ballMoveX, ballMoveY, ballSpeed = 3;
  Boolean ballXGoal, lPaddle, rPaddle;
  //
  //Constructor
  Circle(float x, float y, float w, float h, color objectColour) {
    super(x, y, w, h, objectColour);
    //Increases Ball Speed as time passes
    this.ballSpeedX = ballSpeed;
    this.ballSpeedY = ballSpeed; 
    while ( directionX == 0 ) {
      this.directionX = int (random (-2, 2) );
    }//End WHILE
    while ( directionY == 0 ) {
      this.directionY = int (random (-2, 2) );
      this.ballXGoal = false;
    }
  }//End Constructor
  //Start
  Circle(float x, float y, float w, float h, color objectColour, int numberofStars) {
    super(x, y, w, h, objectColour);
    int numStars = numberofStars;
  }//End Constructor
  //
  //Methods
  void draw() {
    fill(objectColour);
    ellipse(x, y, w, h);
    fill(base);
    ballPlay();
  }//End draw
  //
  void ballSpeed() {
     if(key == 'u' || key == 'U') ballSpeed = 3 + (0.2*(lScore+rScore));
     if(key == 'o' || key == 'O') ballSpeed = 4 + (0.2*(lScore+rScore));
     if(key == 'p' || key == 'P') ballSpeed = 5 + (0.2*(lScore+rScore));
     
  }
  void ballPlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if (x < (width*0)+w ) { //Goal for left player
      for (int i = lenMiddle; i < shapes.size(); i++) {
        shapes.get(i).x = displayWidth*1/2;
        shapes.get(i).y = displayHeight*1/2; //Variable becomes "final" here
      }
      rScore += 1;
      shapes.get(2).h -= height*1/25;
      shapes.get(7).y = shapes.get(2).y+shapes.get(2).h;
      //Increase ball speed
      ballSpeed += 0.2;
      if(lScore >= 5 || rScore >= 5) ballSpeed = 3;
      // Initiating a second ball on final point
      if (rScore == 4) numBalls += 1;
    }
    if ( x > width - w ) { //Goal for right player
      for (int i = lenMiddle; i < shapes.size(); i++) {
        shapes.get(i).x = displayWidth*1/2;
        shapes.get(i).y = displayHeight*1/2; //Variable becomes "final" here
      }
      lScore += 1;
      shapes.get(1).h -= height*1/25;
      shapes.get(6).y = shapes.get(1).y+shapes.get(1).h;
    //Increase ball speed
      ballSpeed += 0.2;
      if(lScore >= 5 || rScore >= 5) ballSpeed = 3;
      // Initiating a second ball for the final point 
      if (lScore == 4) numBalls += 1;
    }
    //End Net Detection
    //
    //Top and Bottom bounce
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( y-w*1/2 < 0 || y+w*1/2 > height ) directionY *= -1;
    //  
    //Ball "Step"
    ballMoveX = ballSpeedX*directionX;
    ballMoveY = ballSpeedY*directionY;
    if(xMouse != 0 && yMouse != 0) {
      xMouse = int(shapes.get(lenMiddle).x - mouseX);
      yMouse = int(shapes.get(lenMiddle).y - mouseY);
      if(shapes.get(lenMiddle).x != mouseX || shapes.get(lenMiddle).y != mouseY ){
        shapes.get(lenMiddle).x -= xMouse/3;
        shapes.get(lenMiddle).y -= yMouse/3;
      }
      if(shapes.get(lenMiddle).x >= mouseX-5 && shapes.get(lenMiddle).x < mouseX || shapes.get(lenMiddle).x <= mouseX+5 && shapes.get(lenMiddle).x > mouseX) {
        shapes.get(lenMiddle).x = mouseX;
        xMouse = 0;
        yMouse = 0;
      }
      if(shapes.get(lenMiddle).y >= mouseY-5 && shapes.get(lenMiddle).y < mouseY || shapes.get(lenMiddle).y <= mouseY+5 && shapes.get(lenMiddle).y > mouseY){
        shapes.get(lenMiddle).y = mouseY;
        yMouse = 0; 
        xMouse = 0;
      }
    }
    else {
    x += ballMoveX;
    y += ballMoveY;
    }  
}//End ballPlay()
  //My bouce algorithm is better than what is shown in the class
  //because it has a greater than and a less than
  //With the algorithm used in class, it is possible to cause the ball to get stuck behind the paddle
  //If the ball is moving at a high speed from the upwards angle.
  // Also my algorithm fixes a bug
  //Where sometimes the ball floats through the top of the paddle. 
  //Also my algorithms fixes anothe bug where it is possible for the bug to get stuck in the paddle
  //If bouncing from a steep angle, since the X is pushed off the paddle.
  void paddleBounceLeft(float paddleX, float paddleY, float paddleWidth, float paddleHeight) {
    if (x >= paddleX+paddleWidth && x<=paddleX+paddleWidth+w*1/2 && y >= paddleY-w*1/2 && y <= paddleY+paddleHeight){
      this.x += 5;
      directionX *= -1;
      if(singleplayer == true){
        lScore += 1;
        shapes.get(1).h -= height*1/25;
        shapes.get(6).y = shapes.get(1).y+shapes.get(1).h;
        ballSpeed += 0.2;
      }
    }
  }
  void paddleBounceRight(float paddleX, float paddleY, float paddleHeight) {
    if (x <= paddleX && x >= paddleX-w*1/2 && y >= paddleY-w*1/2 && y <= paddleY+paddleHeight){
      this.x -= 5;
      directionX *= -1;
    }
  }
  void leftPaddleSpeed() {
  };
  void rightPaddleSpeed() {
  };
  void leftPaddleMove() {
  };
  void rightPaddleMove() {
  };
  //
}//End Circle
