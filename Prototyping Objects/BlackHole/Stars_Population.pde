void starsPopulation() {
  int geometry = ( displayWidth <= displayHeight ) ? displayWidth : displayHeight;  
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
