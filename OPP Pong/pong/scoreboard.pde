//Start scoreBoard Class
class ScoreBoard {
  //Global Variables
  private int widthScore, heightScore, xLeftScore, yLeftScore, xRightScore, yRightScore, leftScore, rightScore;
  private boolean leftGoalScore, rightGoalScore;
  //Start Constructor
  ScoreBoard(int widthBoard, int heightBoard) {
    //Assigning values
    widthScore = widthBoard*1/10;
    heightScore = heightBoard*1/10;
    xLeftScore = (widthBoard*1/4) - (widthScore*1/2);
    yLeftScore = heightBoard*0;
    xRightScore = (widthBoard*3/4) - (widthScore*1/2);
    yRightScore = heightBoard*0;
    this.leftScore = 0;
    this.rightScore = 0;
    this.leftGoalScore = false;
    this.leftGoalScore = false;
  }
  //End Constructor
  //Start draw()
  void draw(){
    //Draws scoreboards, and inserts numbers
    fill(0);
    stroke(0);
    rect(xLeftScore, yLeftScore, widthScore, heightScore);
    rect(xRightScore, yRightScore, widthScore, heightScore);
    fill(255);
    textAlign(CENTER);
    textSize(heightScore*1/2);
    text(leftScore, (xLeftScore+(widthScore*1/2)), (yLeftScore+(heightScore*1/2)));
    textAlign(CENTER);
    textSize(heightScore*1/2);
    text(rightScore, (xRightScore+(widthScore*1/2)), (yRightScore+(heightScore*1/2)));
    //Adds point when goal is scored
    if(leftGoalScore == true) {
      rightScore += 1;
      leftGoalScore = false;
    }
    if(rightGoalScore == true){
      leftScore += 1;
      rightGoalScore = false;
    }
    //Ends game, and prints congratulations msg
    if(leftScore == 5) {
      println("Congratulations!! left player wins!");
      reset.endGame = true;
    }
    if(rightScore == 5) {
      println("Congratulations!! right player wins!");
      reset.endGame = true;
    }
  }
  //End draw()
}
//End ScoreBoard class
