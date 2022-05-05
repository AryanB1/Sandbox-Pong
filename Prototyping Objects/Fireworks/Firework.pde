class Firework {
  //Variables
  float x;
  float y;
  float diameter;
  color colour;
  float fireSpeedX;
  float fireSpeedY;
  float gravity;
  boolean start;
  //Constructor (Populates Variables)
  Firework (float width, float height) {
    //Fixed issue, the firework array now is not visible in the corner. 
    start = false;
    if(start == false) {
      this.x = displayWidth*2;
      this.y = displayHeight*5;
    }
    else{
      this.x = width*1/2;
      this.y = height*1/2;
    }
    this.colour = color (random(255), random(255), random(255) );
    this.diameter = random (width*1/150, width*1/30);
    this.xSpeed = random (-5, 5);
    this.ySpeed = random (-5, 5);
    gravity = 0.5;
  }//End Constructor

  //Methods
  void fireworkStep() {
    x += xSpeed*3;
    y += ySpeed;
    ySpeed += gravity;
  }//End step()

  void fireworkBounce() {
    if (y < 0+diameter*1/2 || y > height-diameter*1/2) { //
      ySpeed = ySpeed*-1;
      if(xSpeed > 0 && xSpeed < 2.5) xSpeed = 12;
      if(xSpeed < 0 && xSpeed > -2.5) xSpeed = -12;
    }//End height bounces
    if (x < 0+diameter*1/2 || x > width-diameter*1/2) {
      diameter = 0;
    }// End left and right bounces
  }//End bounce()

  void fireworkDraw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(0);
  }//End draw()
} //End Firework Class
