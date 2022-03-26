//Starts private ball class
private class Ball
{
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset=#FFFFFF;
  private int xSpeed, ySpeed;
  //starts public ball class + constructor
  public Ball (float widthParameter, float heightParameter) {
    //Sets Parameters
    //Ball start locations
    this.x = widthParameter*1/2; 
    this.y = heightParameter*1/2;
    xStart = widthParameter*1/2; 
    yStart = heightParameter*1/2;
    //ball diameter
    diameter = widthParameter*1/70; //same on all of them
    //For the colours, everything is randomized between 100 and 200
    //This is because through testing, I found that the 0-100, 200-255 range was a bit too solid
    //In comparison, since the 100-200 range is smaller, all the colours have a relatively similar level of colour solidness
    //This in turn makes it easier on the eyes
    //Also the night mode commonly creates a greenish color which gives a hacker vibe
    if ( nightmode.nightMode == false ) this.colour = color( random(100, 200), random(100, 200), random(100, 200) );
    if ( nightmode.nightMode == true ) this.colour = color( random(100, 200), random(100, 200), 0 ); //Third number set to 0 for ease on eyes.
    //sets x speed
    this.xSpeed = ((Scoreboard.leftScore+Scoreboard.rightScore)*1/4)+2;
    //sets y speed
    this.ySpeed = ((Scoreboard.leftScore+Scoreboard.rightScore)*1/4)+2;
    //sets xDirection
    this.xDirection = 0;
    //For this piece of code, I only changed it so that it fit on one line.
    //Overall this is the best algorithm for this specific task.
    while ( xDirection == 0) this.xDirection = int ( random (-2, 2) );
    //sets yDirection
    this.yDirection = 0;
    //For this piece of code, I only changed it so that it fit on one line.
    //Overall this is the best algorithm for this specific task.
    while ( yDirection == 0) this.yDirection = int ( random (-2, 2) );
  }
  //End Constructor + public ball class
  //start draw()
  public void draw() {
    //Fills ball with colour
    fill(colour);
    //draws ball
    ellipse(x, y, diameter, diameter);
    //resets fill
    fill(colourReset);
    //checks for screen saver
    if(screensaver.screenSaver == true) {
      move();
      bounce();
    }
    //Checks for single player, and a defined left paddle speed
    if(singleplayer.singlePlayer == true && paddle.paddleLeftSpeed == true) {
      move();
      bounce();
    }
    //Checks for a defined left and right paddle speed
    if(paddle.paddleLeftSpeed == true && paddle.paddleRightSpeed == true){
      move();
      bounce();
    }
  }
  //End draw()
  //start move()
  private void move() {
    //Moves ball
    x += xSpeed;
    y += ySpeed;
  }
  //End move()
  //Starts Bounce
  private void bounce() {
    //Checks for top and bottom bounces
    if ( y-diameter*1/2 < displayHeight*0 || y+diameter*1/2 > displayHeight ) ySpeed *= -1;
    //Checks for left paddle bounces
    if (ball.x >= paddle.paddleXLeft+paddle.paddleWidth && ball.x <= paddle.paddleXLeft+paddle.paddleWidth+(ball.diameter*1/2) && ball.y >= paddle.paddleYLeft && ball.y <= paddle.paddleYLeft+(paddle.paddleHeight)){  
      ball.xSpeed *= -1;
      //Changes up paddle colours, cuz one colour would just be boring
      if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
      if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
      //In singleplayer mode, the score gets increased when the player hits the ball with paddle. 
      if(singleplayer.singlePlayer == true) Scoreboard.leftScore += 1;
    }
    //Checks for right paddle bounces
    if (ball.x <= paddle.paddleXRight && ball.x >= paddle.paddleXRight-(ball.diameter*1/2) && ball.y >= paddle.paddleYRight && ball.y <= paddle.paddleYRight+(paddle.paddleHeight)){
      ball.xSpeed *= -1;
      //Changes up paddle colours, cuz one colour would just be boring
      if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
      if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
    }
      //Checks if ball hits right net
    if (ball.x >= lines.x1RightNet-(ball.diameter*1/2)) {
      this.x = xStart;
      this.y = yStart;
      Scoreboard.rightGoalScore = true;
    } 
    // Checks if ball hits left net
    if (ball.x <= lines.x1LeftNet+(ball.diameter*1/2)) {
      this.x = xStart;
      this.y = yStart;
      Scoreboard.leftGoalScore = true;
  }
  }
  // end bounce()
}
  //End Ball class
