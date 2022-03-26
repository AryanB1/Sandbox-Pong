//Start nightMode
class nightMode{
  //Global variables
  private boolean nightMode;
  private int Base, Contrast, time;
  //Start Constructor
  nightMode(){
    //Assigns values, and checks time
  nightMode = false;
      time = hour();
    if(time < 8 || time > 18) {
      Base = 0;
      Contrast = 255;
    }
    else{
      Base = 255;
      Contrast = 0;
  }
  }
  //End Constructor
  //Start nightModeKeyPress() -- Allows user to toggle nightmode via keypress
  private void nightModeKeyPress() {
    //Turn on night mode
    if(key=='Q' || key=='q'){
      nightMode = true;
      Base = 0;
      Contrast = 255;
    }
    //Turn off night mode
    if(key=='E' || key=='e'){
      nightMode = false;
      Base = 255;
      Contrast = 0;
  }
  }
  //End nightModeKeyPress()
}
//End nightMode
