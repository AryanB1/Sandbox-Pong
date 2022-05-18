class Circle extends Shape {
  //Global Variables
  float ballSpeedX, ballSpeedY, directionX=0, directionY=0, ballMoveX, ballMoveY;
  Boolean ballXGoal, lPaddle, rPaddle;
  //
  //Constructor
  Circle(float x, float y, float w, float h, color objectColour) {
    super(x, y, w, h, objectColour);
    this.ballSpeedX = ballRandomChooser(); //Best practice
    this.ballSpeedY = ballRandomChooser(); 
    this.lPaddle = false;
    this.rPaddle = false;
    while ( directionX == 0 ) {
      this.directionX = int (random (-2, 2) );
    }//End WHILE
    while ( directionY == 0 ) {
      this.directionY = int (random (-2, 2) );
      this.ballXGoal = false;
    }
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
  int ballRandomChooser() {
    return int( random (2, 4) );
  }//End ballRandomChooser
  //
  void ballPlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if (x < (width*0)+w ) { //Goal for left player
      for(int i = lenMiddle; i < shapes.size(); i++) {
        shapes.get(i).x = displayWidth*1/2;
        shapes.get(i).y = displayHeight*1/2; //Variable becomes "final" here
      }
      rScore += 1;
      shapes.get(2).h -= height*1/25;
      shapes.get(7).y = shapes.get(2).y+shapes.get(2).h;
      // Initiating a second ball on final point
      if(rScore == 4) numBalls += 1;
    }
    if ( x > width - w ) { //Goal for right player
      for(int i = lenMiddle; i < shapes.size(); i++) {
        shapes.get(i).x = displayWidth*1/2;
        shapes.get(i).y = displayHeight*1/2; //Variable becomes "final" here
      }
      lScore += 1;
      shapes.get(1).h -= height*1/25;
      shapes.get(6).y = shapes.get(1).y+shapes.get(1).h;
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
    x += ballMoveX;
    y += ballMoveY;
  }//End ballPlay()
  //My bouce algorithm is better than what is shown in the class
  //because it has a greater than and a less than
  //With the algorithm used in class, it is possible to cause the ball to get stuck behind the paddle
  //If the ball is moving at a high speed from the upwards angle.
  // Also my algorithm fixes a bug
  //Where sometimes the ball floats through the top of the paddle. 
  void paddleBounceLeft(float paddleX, float paddleY, float paddleWidth, float paddleHeight) {
    if (x >= paddleX+paddleWidth && x<=paddleX+paddleWidth+w*1/2 && y >= paddleY-w*1/2 && y <= paddleY+paddleHeight) directionX *= -1;
  }
  void paddleBounceRight(float paddleX, float paddleY, float paddleHeight) {
    if (x <= paddleX && x >= paddleX-w*1/2 && y >= paddleY-w*1/2 && y <= paddleY+paddleHeight) directionX *= -1;
  }
  void leftPaddleSpeed(){
  };
  void rightPaddleSpeed(){
  };
  void leftPaddleMove() {};
  void rightPaddleMove(){};
  //
  
}//End Circle
