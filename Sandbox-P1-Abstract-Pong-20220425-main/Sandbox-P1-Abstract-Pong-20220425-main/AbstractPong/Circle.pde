class Circle extends Shape {
  //Global Variables
  color colourDayMode, resetNightMode;
  float ballSpeedX, ballSpeedY, directionX=0, directionY=0, ballMoveX, ballMoveY;
  Boolean ballXGoal;
  //
  //Constructor
  Circle(float x, float y, float w, float h, color colourDayParameter, color resetNightParameter) {
    super(x, y, w, h);
    this.colourDayMode = colourDayParameter;
    this.resetNightMode = resetNightParameter;
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
    fill(colourDayMode);
    ellipse(x, y, w, h);
    fill(resetNightMode);
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
    //Top and Bottom Boundary Bounce, accounting for increased ball movement per "step"
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( (y >= height*0 && y <= height*0+w) || ( y <= height && y >= height-w ) ) directionY =  directionY * (-1);
    if ( y < 0 || y > height ) {
      directionY =  directionY * (-1);
      if (y < 0) y = height*0 - (w/2);
      if (y > height) y = height - (w/2);
    }
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
  //
  //Getters
  float xGetter() {
    return x;
  }
  float yGetter() {
    return y;
  }
  float wGetter() {
    return w;
  }
  float hGetter() {
    return h;
  }
  color colourDayModeGetter() {
    return colourDayMode;
  }
  color resetNightModeGetter() {
    return resetNightMode;
  }
  //
  //Setters
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
