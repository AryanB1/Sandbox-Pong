class Rectangle extends Shape {
  //Global Variables
  int lPaddleSpeed, rPaddleSpeed, paddleSpeed;
  //
  //Constructor
  Rectangle(float x, float y, float w, float h, color objectColour) {
    super(x, y, w, h, objectColour);
    //Reconfigurable
    this.lPaddleSpeed = 30;
    this.rPaddleSpeed = 30;
  }
  Rectangle(float x, float y, float w, float h, color objectColour, String LorR) {
    super(x, y, w, h, objectColour);
    // Not Reconfigurable
    paddleSpeed = 2;
  }
  //End Constructor
  //Start second Constructor

  //
  //Methods
  void draw() { 
    if(shapes.get(6).y < displayHeight+60) shapes.get(6).y += paddleSpeed;
    if(shapes.get(7).y < displayHeight+60) shapes.get(7).y += paddleSpeed;
    fill(objectColour);
    rect(x, y, w, h);
    fill(base);
  }//End draw
  //
  //
  /*
  After showing this game to a few of my friends,
  I realised that most people will probably just 
  skip the instructions. So I will initially set both paddles to 
  the highest speed (This makes the game easier).
  */
  void leftPaddleSpeed() {
    if(key == 'n' || key == 'N') this.lPaddleSpeed = 10;
    if(key == 'r' || key == 'R') this.lPaddleSpeed = 20;
    if(key == 'g' || key == 'G') this.lPaddleSpeed = 30;

  }
  void rightPaddleSpeed() {
    if(key == 'm' || key == 'M') this.rPaddleSpeed = 10;
    if(key == 't' || key == 'T') this.rPaddleSpeed = 20;
    if(key == 'h' || key == 'H') this.rPaddleSpeed = 30;
  }
  void leftPaddleMove() {
    //Up
    if ( key == 'W' || key == 'w' ) y -= lPaddleSpeed;
    //Down
    if ( key == 'S' || key == 's' ) y += lPaddleSpeed;
    //Keep Paddle On Screen
    if (y <= 0) this.y = 0;
    if (y >= height-h) this.y = height-h;
  }
  
  void rightPaddleMove() {
    //Up
    if ( key == CODED && keyCode == UP ) y -= rPaddleSpeed;
    //Down
    if ( key == CODED && keyCode == DOWN ) y += rPaddleSpeed;
    // Keep Paddle On Screen
    if (y <= 0) this.y = 0;
    if (y >= height-h) this.y = height-h;
  }
  //
  //Common Metods
  void paddleBounceLeft(float x, float y, float w, float h) {
  }
  void paddleBounceRight(float x, float y, float h) {
  }
  void ballSpeed() {}
  //
}//End Rectangle
