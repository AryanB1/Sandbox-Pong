int leftScore = 0, rightScore = 0;
void leftScoreUpdate(){
  if(leftGoalScore == true){
    leftScore += 1;
    leftGoalScore = false;
  }
  if(rightGoalScore == true){
    rightScore += 1;
    rightGoalScore = false;
  }
  
}
