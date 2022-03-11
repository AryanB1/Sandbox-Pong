//start screenValidity
void screenValidity(){
  //Check if screen orientation is landscape
  // If screen orientation is not landscape, game will not run
  if(displayWidth <= displayHeight) {
    print("invalid display, change display settings to landscape.");
    noLoop();
  }
  else {
    gameOn();
  }
}
//end screenValidity
