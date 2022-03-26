class nightMode{
  private boolean nightMode;
  private int Base, Contrast, time;
  nightMode(){
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
  private void nightModeKeyPress() {
    if(key=='Q' || key=='q'){
      nightMode = true;
      Base = 0;
      Contrast = 255;
    }
    if(key=='E' || key=='e'){
      nightMode = false;
      Base = 255;
      Contrast = 0;
  }
  }
}
