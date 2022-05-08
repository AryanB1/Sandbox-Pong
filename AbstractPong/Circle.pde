class Circle extends Shape {
  //Global Variables
  float ballSpeedX, ballSpeedY, directionX=0, directionY=0, ballMoveX, ballMoveY;
  Boolean ballXGoal;
  //
  //Constructor
  Circle(float x, float y, float w, float h, color objectColour) {
    super(x, y, w, h, objectColour);
    this.ballSpeedX = ballRandomChooser(); //Best practice
    this.ballSpeedY = ballRandomChooser(); 
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
    return int( random (1, 5) );
  }//End ballRandomChooser
  //
  void ballPlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if ( x < (width*0)+w || x > width - w) { //Net Detection
      ballXGoal = true;
      if (x < (width*0)+w ) { //Goal for left player
        x = (width*0)+(w/4);
        y = y; //Variable becomes "final" here
      }
      if ( x > width - w ) { //Goal for right player
        x = (width)-(w/4);
        y = y; //Variable becomes "final" here
      }
    } //End Net Detection
    //
    //Top and Bottom bounce
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( y-w*1/2 < displayHeight*0 || y+w*1/2 > displayHeight ) directionY *= -1;
    //
    //Ball "Step"
    if (ballXGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
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
  void paddleBounceLeft(float paddleX, float paddleY, float paddleWidth, float paddleHeight) {
    if (x >= paddleX+paddleWidth && x<=paddleX+paddleWidth+w*1/2 && y >= paddleY-w*1/2 && y <= paddleY+paddleHeight) directionX *= -1;
  }
  void paddleBounceRight(float paddleX, float paddleY, float paddleHeight) {
    if (x <= paddleX && x >= paddleX-w*1/2 && y >= paddleY-w*1/2 && y <= paddleY+paddleHeight) directionX *= -1;
  }
  //
  
}//End Circle
