//start screenCheck class
class screenCheck {
  //Global Variables
  private boolean check;
  private int geometryWidth, geometryHeight;
  //Start Constructor
  screenCheck(int screenWidth, int screenHeight){
    geometryWidth = screenWidth;
    geometryHeight = screenHeight;
    check = true;
  }
  //End Constructor
  //Start gameRun()
  private void gameRun() {
    //Check if screen orientation is landscape
    // If screen orientation is not landscape, game will not run
    if(displayWidth <= displayHeight) {
      check = false;
    }
    else {
      check = true;
  }
  }
  void draw() {
    fill(nightmode.Base);
    rect(displayWidth*2.5/10, displayHeight*4/10, displayWidth*1/2, displayHeight*2/10);
    fill(nightmode.Contrast);
    textAlign(CENTER);
    textSize(displayHeight*1/30);
    text("Please Switch your display to landscape mode", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
  }
  //end gameRun()
}
//end screenCheck class
