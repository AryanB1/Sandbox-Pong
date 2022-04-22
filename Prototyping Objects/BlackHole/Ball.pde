//Starts private ball class
private class Ball
{
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset=#FFFFFF;
  private int xSpeed, ySpeed;
  public int targetX=50, targetY=50;
  public boolean xTargetSet=false, yTargetSet=false;
  //starts public ball class + constructor
  public Ball (float widthParameter, float heightParameter, float diameterParameter) {
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
  //End Constructor + public ball class
  //start draw()
  public void balldraw() {
    //Fills ball with colour
    fill(colour);
    //draws ball
    ellipse(x, y, diameter, diameter);
    //resets fill
    fill(colourReset);
    //checks for screen saver
  }
  //End draw()
  //start move()
  public void drawStar() {
    balldraw();
    starChase();
  }//End drawStar
  void starChase() {
    //sets movement to a target location if a click has been made
    if(xTargetSet == true && yTargetSet == true){
      float xNeeded = x - targetX;
      float yNeeded = y - targetY;
      xNeeded = xNeeded/60;
      yNeeded = yNeeded/60;
      if ( x != targetX) x -= xNeeded;
      if(y != targetY) y -= yNeeded;
      //Due to the nature of the algorithm, it will infinitely move close to the point clicked
      //This correction is set, so if the circle is unnoticably close to the target point
      //The ball will correct itself into the right position.
      //When implemented in OOP pong, this will help make sure the game runs smoothly
      //if a large number of balls are created
      if(x >= targetX-0.5 && x < targetX || x <= targetX+0.5 && x > targetX) x = targetX;
      if(y >= targetY-0.5 && y < targetY || y <= targetY+0.5 && y > targetY) y = targetY;
      if(x == targetX && y == targetY) x = displayWidth*7;
    }
  }
  //
  void setTargetX(int iParameter) {
    targetX = iParameter;
    xTargetSet = true;
  }//End setTargetX
  //
  void setTargetY(int iParameter) {
    targetY = iParameter;
    yTargetSet = true;
  }//End setTargetY
  // end bounce()
}
  //End Ball class
