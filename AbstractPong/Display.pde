int appWidth , appHeight ;
boolean screenCheck;
//
void display() {
  //Display Orientation: Landscape, not portrait nor square (sort of)
  appWidth = displayWidth; //Reminder: ensure Global Variable once DISPLAY() is function
  appHeight = displayHeight;
  if( appWidth >= appHeight) screenCheck = true;
  else screenCheck = false; // Ternary Operator, repeats IF-ELSE Structure
}//End display
