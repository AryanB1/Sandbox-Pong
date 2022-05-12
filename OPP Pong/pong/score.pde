//Start Score Class
class Score {
  //Define variables
  private int xL, xR, yL, yR, wid, hei;
  private String messageL, messageR;
  public boolean lDraw, rDraw;
  //Start Constructor
  Score() {
    xL = displayWidth*1/10;
    yL = displayHeight*4/10;
    xR = displayWidth*6/10;
    yR = displayHeight*4/10;
    wid = displayWidth*4/10;
    hei = displayHeight*2/10;
    messageL = "Left Player Scored!";
    messageR = "Right Player Scored!";
    this.lDraw = false;
    this.rDraw = false;
  }
//End Constructor
//Start drawLeft
  void drawLeft(){
    if(lDraw == true) {
      fill(nightmode.Contrast);
      textAlign(CENTER);
      textSize(hei*1/6);
      text(messageL, xL+(wid*1/2),yL+(hei*1/2));
      // Once the paddle drop is off the screen, make message disappear.
      if(paddles.get(paddles.size()-1).paddleY > displayHeight+600) lDraw = false;
    }
  }
  // End drawLeft
  // Start drawRight
  void drawRight(){
    if(rDraw == true) {
      fill(nightmode.Contrast);
      textAlign(CENTER);
      textSize(hei*1/6);
      text(messageR, xR+(wid*1/2),yR+(hei*1/2));
      // Once the paddle drop is off the screen, make message disappear.
      if(paddles.get(paddles.size()-1).paddleY > displayHeight+600) rDraw = false;
    }
  }
  // End drawRight
//End Draw
}
// End class
