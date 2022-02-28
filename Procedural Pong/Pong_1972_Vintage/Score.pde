int leftScore = 10, rightScore = 0;
void scoreUpdate(){
  if(leftGoalScore == true){
    rightScore += 1;
    leftGoalScore = false;
  }
  if(rightGoalScore == true){
    leftScore += 1;
    rightGoalScore = false;
  }
}
