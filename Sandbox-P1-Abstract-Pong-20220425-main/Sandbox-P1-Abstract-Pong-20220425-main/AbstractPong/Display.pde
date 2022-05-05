int appWidth , appHeight ;
//
void display() {
  //Display Orientation: Landscape, not portrait nor square (sort of)
  println(width, height, displayWidth, displayHeight);
  appWidth = width; //Reminder: ensure Global Variable once DISPLAY() is function
  appHeight = height;
  String ls="Landscape", p="portrait", DO="Display Orientation", instruct="Bru, turn your phun";
  String orientation = ( appWidth >= appHeight ) ? ls : p ; // Ternary Operator, repeats IF-ELSE Structure
  //Simply break APP, develop algorithm to fix app even if user makes a mistake
  if ( orientation==ls ) { 
    println("Good to Go");
  } else { //Break our app if not landscape
    println(instruct); //Should be to the CANVAS
    appWidth *= 0; //appWidth = appWidth *0
    appHeight *= 0;
  }//End Diplay Orientation
  //
}//End display
