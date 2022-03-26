class ScoreBoard {
  private int widthScore, heightScore, xLeftScore, yLeftScore, xRightScore, yRightScore, leftScore, rightScore;
  private boolean leftGoalScore, rightGoalScore;
  ScoreBoard(int widthBoard, int heightBoard) {
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
  void draw(){
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
    if(leftGoalScore == true) {
      rightScore += 1;
      leftGoalScore = false;
    }
    if(rightGoalScore == true){
      leftScore += 1;
      rightGoalScore = false;
    }
    if(leftScore == 5) {
      println("Congratulations!! left player wins!");
    
    }
    if(rightScore == 5) {
      println("Congratulations!! right player wins!");
    
    }
  }
}//End ScoreBoard
