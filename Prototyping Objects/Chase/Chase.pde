//Global Variables and Objects
int NumberOfStars = 5; //Verseion of a Static Variable in Pure Java, final here
Ball[] stars = new Ball[NumberOfStars]; //Processing Requires #, Pure Java allows static variable
//
int appWidth, appHeight; //final variables
int smallerDisplayDimension; //final variable
//
Boolean redo=true;
//
void setup() {
  fullScreen(); //fullScreen, displayWidth, displayHeight
  //Protrait, not landscape or square
  display();
  starsPopulation();
  //
}//End setup
//
void draw() {
  background(0);
  for ( Ball star : stars ) { //See FOR-Each Example for explanation
    star.drawStar();
  }//End FOR
}//End draw
//
void keyPressed(){
}//End keyPressed
//
void mousePressed() {
  for (int i=0; i<stars.length; i++) {
    stars[i].setTargetX(mouseX); //Value of mouse-click
    stars[i].setTargetY(mouseY); //Value of mouse-click
  }//End FOR
}//End mousePressed
//End Main Driver
