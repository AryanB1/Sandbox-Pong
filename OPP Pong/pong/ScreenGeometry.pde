class screenCheck {
  private boolean check;
  private int geometryWidth, geometryHeight;
  screenCheck(int screenWidth, int screenHeight){
    geometryWidth = screenWidth;
    geometryHeight = screenHeight;
    check = true;
  //Check if screen orientation is landscape
  // If screen orientation is not landscape, game will not run
  }
  private void gameRun() {
    //Check if screen orientation is landscape
    // If screen orientation is not landscape, game will not run
    if(displayWidth <= displayHeight) {
      println("invalid display, change display settings to landscape.");
      check = false;
    }
    else {
      check = true;
  }
  }
}
