/*
WHAT I ACCOMPLISHED:
Overall, the difference between what was provided in the base code
and what I have in my code is efficiency. I eliminated multiple
unnecessary for loops. I removed the redo while loop entirely.
In the check to make sure that no overlap occurred, rather than 
running the entire while loop, I simply corrected the overlapping value
and then ran the overlap detection algorithm again. These changes have
made it so that when the start key is pressed with 15 stars, the program
window immediately opens and shows the 15 circles. Under the previous 
base code, there would have been a blank screen for a few seconds before
an image would have been displayed.
*/
//Global Variables and Objects
int NumberOfStars = 25;
/*
NOTE TO SELF:
If I ever need to update this project to support more stars, change the below 
array into a hashtable
*/
Ball[] stars = new Ball[NumberOfStars];
int geometry;
//Start setup
void setup() {
  /*I am using size(displayWidth, displayHeight) because this arrangement
  creates the close and minimize features in the top right corner on windows. 
 This provides a better quality of life for user. Any future versions of pong
 will contain a key to choose between fullScreen() and size(displayWidth, displayHeight)
 */
  fullScreen();
  geometry = ( displayWidth <= displayHeight ) ? displayWidth : displayHeight;
  //
  for (int i=0; i<stars.length; i++) {
    //Randomly choose parameters
    float diameterRandom = random ( geometry*1/8, geometry*1/4); //Consider user Input (eye sentitivity)
    float xRandom = random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 ); //No stars in net
    float yRandom = random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 ); //Entire displayHeight OK
    stars[i] = new Ball (xRandom, yRandom, diameterRandom);
    /* Switched the loops to normal if statements, since the loops seemed
    unnecessary, and the if statements are more efficient
    */ 
    if ( xRandom-diameterRandom*1/2 > stars[i].x && xRandom+diameterRandom*1/2 < stars[i].x ) {
      xRandom = random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 );
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      }
    if ( yRandom-diameterRandom*1/2 > stars[i].x && yRandom+diameterRandom*1/2 < stars[i].x ) {
      yRandom = random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 );
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
    //
  }//End FOR
  }
  for (int i=0; i<stars.length; i++) {
  for ( int j=stars.length-1; j>i; j--) {
    /*Checks distance between stars and then ensures that the distance is greater
     than the average diameter of the two stars. If the average diameter is larger
     than the distance, a new ball is made, and the algorithm repeats
    */
    if(dist(stars[i].x, stars[i].y, stars[j].x, stars[j].y) <= ((stars[i].diameter+stars[j].diameter)*1/2)){
      float diameterRandom = random ( geometry*1/8, geometry*1/4); //Consider user Input (eye sentitivity)
      float xRandom = random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 ); //No stars in net
      float yRandom = random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 ); //Entire displayHeight OK
      stars[i] = new Ball (xRandom, yRandom, diameterRandom);
      i = 0;
      j = stars.length;
    }
    }//End nested FOR
  }//End Final Check
}//End setup
//Start draw
void draw() {
  //Background set to black in order to create the night sky vibe
  background(0);
  // For each loop, checks for number of elements in the stars array and runs through them.
  for ( Ball stary : stars) {
    stary.drawStar();
  }//End FOR
}//End draw
// start keypressed
void keyPressed() {
}//End keyPressed
// start mousepressed
void mousePressed() {
}//End mousePressed
//End Main Driver
