void screenValidity(){ 
  if(displayWidth <= displayHeight) {
    print("invalid display, change display settings to landscape.");
    noLoop();
  }
  else {
    gameOn();
  }
}
