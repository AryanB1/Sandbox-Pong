//Global Variables and Objects
int NumberOfStars = 5; //Verseion of a Static Variable in Pure Java, final here
ArrayList<Ball> stars = new ArrayList<Ball>(5); //Processing Requires #, Pure Java allows static variable
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
  for (int i=0; i<stars.size(); i++) {
    stars.get(i).setTargetX(mouseX); //Value of mouse-click
    stars.get(i).setTargetY(mouseY); //Value of mouse-click
  }//End FOR
}//End mousePressed
//End Main Driver
