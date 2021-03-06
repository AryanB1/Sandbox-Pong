// Global Variables
Firework firewor;
Firework[] firework = new Firework[25]; //Change to Static Variable

void setup() {
  fullScreen(); //fullScreen(), displayWidth & displayHeight
  // Landscape vs. portrait views, leads to screenSize Checker
  //
  for (int i=0; i<firework.length; i++) {
    firework[i] = new Firework(width, height);
  }//End FOR
}// End setup()

void draw() {
  background(0);
  //
  for (int i=0; i<firework.length; i++) {
    firework[i].fireworkStep();
    firework[i].fireworkBounce();
    firework[i].fireworkDraw();
  }//End FOR
}//End draw()

void keyPressed () { // Review KeyBoard Input
}

void mousePressed() { // Review mouseX and mouseY Key Variables and curser position input
  firewor.start = true;
  }//End FOR
