//Global Variables
int leftScore = 0, rightScore = 0;
//Start scoreUpdate
void scoreUpdate(){
  //Check if a goal has been scored, and update scoreboard
  if(leftGoalScore == true){
    rightScore += 1;
    leftGoalScore = false;
  }
  if(rightGoalScore == true){
    leftScore += 1;
    rightGoalScore = false;
  }
}
//End scoreUpdate
