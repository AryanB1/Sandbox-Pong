void checkTime(){
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
