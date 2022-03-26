private class Ball
{
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset=#FFFFFF;
  private int xSpeed, ySpeed;
  public Ball (float widthParameter, float heightParameter) { //Constructor Is ... hard coded, single visual object
    this.x = widthParameter*1/2; //Start Ball Location whereever
    this.y = heightParameter*1/2;
    xStart = widthParameter*1/2; // Location Specifically at Game Start, middle of field
    yStart = heightParameter*1/2;
    diameter = widthParameter*1/70; //same on all of them
    if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
    if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
    this.xSpeed = ((Scoreboard.leftScore+Scoreboard.rightScore)*1/4)+2;
    this.ySpeed = ((Scoreboard.leftScore+Scoreboard.rightScore)*1/4)+2;
    xDirection = 0;
    while ( xDirection == 0) { 
      this.xDirection = int ( random (-2, 2) );
    } //one line WHILE
    yDirection = 0;
    while ( yDirection == 0) { 
      this.yDirection = int ( random (-2, 2) );
    } //one line WHILE
  }//End Constructor
  //
  public void draw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(colourReset);
    //
    move();
    bounce();
    //bouncePaddle(); //See Main void draw
  }//End draw
  //
  private void move() {
    x += xSpeed;
    y += ySpeed;
  }//End move
  //
  private void bounce() {//not the bounce off the paddles
    if ( x-diameter*1/2 < displayWidth*0 || x+diameter*1/2 > displayWidth ) xSpeed *= -1; //Net Bounce, will change
    if ( y-diameter*1/2 < displayHeight*0 || y+diameter*1/2 > displayHeight ) ySpeed *= -1; //Top and Bottom
    if (ball.x >= paddle.paddleXLeft+paddle.paddleWidth && ball.x <= paddle.paddleXLeft+paddle.paddleWidth+(ball.diameter*1/2) && ball.y >= paddle.paddleYLeft && ball.y <= paddle.paddleYLeft+(paddle.paddleHeight)){  
      ball.xSpeed *= -1;
      if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
      if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
      //if(singlePlayer == true) leftScore += 1;
    }
    if (ball.x <= paddle.paddleXRight && ball.x >= paddle.paddleXRight-(ball.diameter*1/2) && ball.y >= paddle.paddleYRight && ball.y <= paddle.paddleYRight+(paddle.paddleHeight)){
      ball.xSpeed *= -1;
      if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
      if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
    }
      //Checking if ball hits paddles
    if (ball.x >= lines.x1RightNet-(ball.diameter*1/2)) {
      this.x = xStart;
      this.y = yStart;
      Scoreboard.rightGoalScore = true;
    } 
    if (ball.x <= lines.x1LeftNet+(ball.diameter*1/2)) {
      this.x = xStart;
      this.y = yStart;
      Scoreboard.leftGoalScore = true;
  }
  }//
  }//End Ball
