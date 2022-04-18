void display() {
  println (width, height, displayWidth, displayHeight);
  appWidth = width; // switch with displayWidth
  appHeight = height; // switch with displayHeight
  smallerDisplayDimension = ( appWidth <= appHeight ) ? appWidth : appHeight;
}//End Display
