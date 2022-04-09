//Starts private ball class
private class Ball
{
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset=#FFFFFF;
  private int xSpeed, ySpeed;
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
  }//End drawStar
  //

  // end bounce()
}
  //End Ball class
