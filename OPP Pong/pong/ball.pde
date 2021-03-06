//Starts private ball class
private class Ball
{
  //Global Variables
  private float x, y, diameter, xStart, yStart;
  private color colour, colourReset=#FFFFFF;
  private int xSpeed, ySpeed;
  public int targetX, targetY, blackHoleX, blackHoleY;
  public boolean xTargetSet=false, yTargetSet=false, mouseStop=false, blackholeStop=false, xBlackHoleSet=false, yBlackHoleSet=false, changeNums = true;
  public int numBalls =1;
  float fireSpeedX;
  float fireSpeedY;
  float gravity;
  boolean start;
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
  }
  //End Constructor + public ball class
  public Ball (float widthParameter, float heightParameter, float diameterParameter) {
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
  }
  public Ball (float widthParameter, float heightParameter, float diameterParameter, float paramfour) {
    //Sets Parameters
    //Ball start locations
    x = int ( widthParameter ); //casting here is truncating decimals
    y = int ( heightParameter );
    diameter = int ( diameterParameter );
    //For the colours, everything is randomized between 100 and 200
    //This is because through testing, I found that the 0-100, 200-255 range was a bit too solid
    //In comparison, since the 100-200 range is smaller, all the colours have a relatively similar level of colour solidness
    //This in turn makes it easier on the eyes
    //Also the night mode commonly creates a greenish color which gives a hacker vibe
    colour = color( random(100, 200), random(100, 200), random(100, 200) );
  }
  public Ball (float widthParameter, float heightParameter, float diameterParameter, float paramfour, float paramfive) {
     //Fixed issue, the firework array now is not visible in the corner. 
    this.x = displayWidth*2;
    this.y = displayHeight*5;
    if(start == true){
      this.x = width*1/2;
      this.y = height*1/2;
    }
    this.colour = color (random(255), random(255), random(255) );
    this.diameter = random (width*1/150, width*1/30);
    this.fireSpeedX = random (-5, 5);
    this.fireSpeedY = random (-5, 5);
    gravity = 0.5;
  }
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
      pointChase();
      blackHole();
      if(xTargetSet == false && yTargetSet == false && xBlackHoleSet == false && yBlackHoleSet == false){
        move();
        bounce();
      }
    }
  }
  //End draw()
  //start move()
  private void move() {
    //Moves ball
    if(Instruction.openInstructions == false){
    x += xSpeed;
    y += ySpeed;
    }
  }
  //End move()
  //Starts Bounce
  private void bounce() {
    //Checks for top and bottom bounces
    if ( y-diameter*1/2 < displayHeight*0 || y+diameter*1/2 > displayHeight ) ySpeed *= -1;
    //Checks for left paddle bounces
    if (x >= paddle.paddleXLeft+paddle.paddleWidth && x <= paddle.paddleXLeft+paddle.paddleWidth+(diameter*1/2) && y >= paddle.paddleYLeft && y <= paddle.paddleYLeft+(paddle.paddleLeftHeight)){  
      xSpeed *= -1;
      //Changes up paddle colours, cuz one colour would just be boring
      if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
      if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
      //In singleplayer mode, the score gets increased when the player hits the ball with paddle. 
      if(singleplayer.singlePlayer == true) Scoreboard.leftScore += 1;
    }
    //Checks for right paddle bounces
    if (x <= paddle.paddleXRight && x >= paddle.paddleXRight-(diameter*1/2) && y >= paddle.paddleYRight && y <= paddle.paddleYRight+(paddle.paddleRightHeight)){
      xSpeed *= -1;
      //Changes up paddle colours, cuz one colour would just be boring
      if ( nightmode.nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
      if ( nightmode.nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
    }
      //Checks if ball hits right net
    if (x >= lines.x1RightNet-(diameter*1/2)) {
      if(singleplayer.singlePlayer == true){
        this.x = xStart;
        this.y = yStart;
        Scoreboard.rightGoalScore = true;
        paddle.paddleLeftHeight -= paddle.reduction;
        score.lDraw = true;
        paddles.add(new Paddle(paddle.paddleXLeft, paddle.paddleYLeft+paddle.paddleLeftHeight, "new left paddle"));
        paddles.get(paddles.size()-1).Ldrop = true;  
    }
      else{
        for(int i = 0; i < balls.size(); i ++) {
          balls.get(i).x = xStart; 
          balls.get(i).y = (ball.y + i*50);
          start = true;
          Scoreboard.rightGoalScore = true;
          paddle.paddleLeftHeight -= paddle.reduction;
          score.lDraw = true;
          paddles.add(new Paddle(paddle.paddleXLeft, paddle.paddleYLeft+paddle.paddleLeftHeight, "new left paddle"));
          paddles.get(paddles.size()-1).Ldrop = true; 
        }
        }
    } 
    // Checks if ball hits left net
    if (x <= lines.x1LeftNet+(diameter*1/2)) {
      if(singleplayer.singlePlayer == true){
        this.x = xStart;
        this.y = yStart;
        Scoreboard.leftGoalScore = true;
        paddle.paddleRightHeight -=Scoreboard.rightScore*paddle.reduction;
        score.rDraw = true;
        paddles.add(new Paddle(paddle.paddleXRight, paddle.paddleYRight+paddle.paddleRightHeight, "new right paddle"));
        paddles.get(paddles.size()-1).Rdrop = true; 
      }
    else{
      for(int i = 0; i < balls.size(); i ++) {
        balls.get(i).x = xStart; 
        balls.get(i).y = (ball.y + i*50);
        start = true;
        Scoreboard.leftGoalScore = true;
        paddle.paddleRightHeight -=Scoreboard.rightScore*paddle.reduction;
        score.rDraw = true;
        paddles.add(new Paddle(paddle.paddleXRight, paddle.paddleYRight+paddle.paddleRightHeight, "new right paddle"));
        paddles.get(paddles.size()-1).Rdrop = true; 
      }
  }
  }
  }
  //End bouce
  // Chase Metaphor.
  //Start setTargetX
  void setTargetX(int iParameter) {
    if(mouseStop == false){
      targetX = iParameter;
      xTargetSet = true;
    }
  }//End setTargetX
  // Start setTargetY
  void setTargetY(int iParameter) {
    if(mouseStop == false){
      targetY = iParameter;
      yTargetSet = true;
    }
  }
  //End setTargetY
  //Start pointChase
  void pointChase() {
    //sets movement to a target location if a click has been made
    if(xTargetSet == true || yTargetSet == true){
      float xNeeded = x - targetX;
      float yNeeded = y - targetY;
      mouseStop = true;
      xNeeded = xNeeded/20;
      yNeeded = yNeeded/20;
      if ( x != targetX) x -= xNeeded;
      if(y != targetY) y -= yNeeded;
      //Due to the nature of the algorithm, it will infinitely move close to the point clicked
      //This correction is set, so if the ball is somewhat close to the point clicked, the ball
      //then moves normally. 
      if(x >= targetX-5 && x < targetX || x <= targetX+5 && x > targetX) xTargetSet = false;
      if(y >= targetY-5 && y < targetY || y <= targetY+5 && y > targetY) yTargetSet = false;
    }
}
//End pointChase
//End Chase Metaphor
//Start nums ( adds / removes balls based on key inputs)
  void nums() {
    if(changeNums == true){
      if(key == '1') numBalls = 1;
      if(key == '2') numBalls = 2;
      if(key == '3') numBalls = 3;
      if(key == '4') numBalls = 4;
      if(key == '5') numBalls = 5;
      if(key == '6') numBalls = 6;
      if(key == '7') numBalls = 7;
      if(key == '8') numBalls = 8;
      if(key == '9') numBalls = 9;
    }
  }
  //End nums
  
  void setBlackHoleX(int iParameter) {
    if(blackholeStop == false){
      blackHoleX = iParameter;
      xBlackHoleSet = true;
    }
  }//End setBlackHoleX
  // Start setBlackHoleY
  void setBlackHoleY(int iParameter) {
    if(blackholeStop == false){
      blackHoleY = iParameter;
      yBlackHoleSet = true;
    }
  }
  //What this metaphor is accomplishing
  //is it sets one ball to the position clicked and then causes
  //all other balls to disappear for a moment and then reappear at their start points.
  void blackHole() {
    //sets movement to a target location if a click has been made
    if(xBlackHoleSet == true || yBlackHoleSet == true){
      blackholeStop = true;
      x = blackHoleX;
      y = blackHoleY;
      while(balls.size() > 1) balls.remove(balls.size()-1);
      xBlackHoleSet = false;
      yBlackHoleSet = false;
}
  }
  //End Black Hole
  //Start Firework metaphor stuff.
    void fireworkStep() {
    x += fireSpeedX*3;
    y += fireSpeedY;
    fireSpeedY += gravity;
  }//End step()

  void fireworkBounce() {
    if (y < 0+diameter*1/2 || y > height-diameter*1/2) { //
      fireSpeedY = fireSpeedY*-1;
      if(fireSpeedX > 0 && fireSpeedX < 2.5) fireSpeedX = 12;
      if(fireSpeedX < 0 && fireSpeedX > -2.5) fireSpeedX = -12;
    }//End height bounces
    if (x < 0+diameter*1/2 || x > width-diameter*1/2) {
      diameter = 0;
    }// End left and right bounces
  }//End bounce()

  void fireworkDraw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(0);
  }//End fireworkdraw()
  //End firework metaphor stuff. 
  
}
//End Ball class
