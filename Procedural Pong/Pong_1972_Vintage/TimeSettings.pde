//Start checkTime
void checkTime(){
  //If the time is between 6 pm - 8 am, dark mode is enabled
  //Otherwise, light mode is enabled
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
//End checkTime
