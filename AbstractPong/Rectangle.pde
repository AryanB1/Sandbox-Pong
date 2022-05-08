class Rectangle extends Shape {
  //Global Variables
  int yMove;
  Boolean moveUP, moveDOWN;
  //
  //Constructor
  Rectangle(float x, float y, float w, float h, color objectColour) {
    super(x, y, w, h, objectColour);
    this.yMove = 5; //currently not configurable (i.e ! this.) , but should be
    this.moveUP = false;
    this.moveDOWN = false;
  }//End Constructor

  //
  //Methods
  void draw() {
    if (moveUP==true) y-=yMove;
    if (moveDOWN==true) y+=yMove;
    if (y<=height*0) y = height*0;
    if (y>=height-h) y = height-h;
    fill(objectColour);
    rect(x, y, w, h);
    fill(base);
  }//End draw
  //
  //
  //Setters
  void movePaddleUP() {
    moveUP=true;
    moveDOWN=false;
  }//End movePaddleUP
  void movePaddleDOWN() {
    moveUP=false;
    moveDOWN=true;
  }//End movePaddleDOWN
  void movePaddleSTOP() {
    moveUP=false;
    moveDOWN=false;
  }//End movePaddleSTOP
  //
  //Common Metods
  void paddleBounceLeft(float x, float y, float w, float h) {
  }
  void paddleBounceRight(float x, float y, float h) {
  }
  //
}//End Rectangle
