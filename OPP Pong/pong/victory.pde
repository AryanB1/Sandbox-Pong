//Start Victory Class
class Victory {
  //Define variables
  private int x, y, wid, hei;
  String message;
  //Start Constructor
  Victory() {
    x = displayWidth*3/10;
    y = displayHeight*4/10;
    wid = displayWidth*4/10;
    hei = displayHeight*2/10;
  }
//End Constructor
//Start Draw
  void draw(){
    if(Scoreboard.leftScore == 5) message = "Left Player Wins!! (Press Z to reset game)";
    if(Scoreboard.rightScore == 5) message = "Right Player Wins!! (Press Z to reset game)";
    fill(nightmode.Base);
    rect(x, y, wid, hei);
    fill(nightmode.Contrast);
    textAlign(CENTER);
    textSize(hei*1/6);
    text(message, x+(wid*1/2),y+(hei*1/2));
  }
//End Draw
}
// End class
