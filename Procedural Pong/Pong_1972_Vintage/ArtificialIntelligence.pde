//Global Variables
boolean screenSaver = false;
boolean singlePlayer = false;
boolean introScreen = false;
boolean victory = false;
boolean verify = true;
//Start artificialIntelligence
void artificalIntelligence(){
  //Determines Victory, and displays victory message
  if(leftScore == 5  && verify == true|| rightScore == 5 && verify == true) {
    //Victory Message
    println("Congratulations on your victory!!");
    println("press Z to reset game");
    //sets victory to true
    victory = true;
    //Prevents if statement from looping
    verify = false;
  }
  // if statement to check if victory is true
  if (victory == true){
    //Stops game
    screenSaver = false;
    singlePlayer = false;
    leftPaddleMovement = false;
    rightPaddleMovement = false;
    gameOn();
  }
  //key press if statements
  if(key == 'f' || key == 'F') screenSaver = true;
  if(key == 'z' || key == 'Z') introScreen = true;
  if(key == 'j' || key == 'J') singlePlayer = true;
  // Comands that are executed as a result of the key presses
  //Universal back button
  if(introScreen == true) {
    screenSaver = false;
    singlePlayer = false;
    leftPaddleMovement = false;
    rightPaddleMovement = false;
    victory = false;
    verify = true;
    population();
    introScreen = false;
  }
  //Runs screen saver
  if(screenSaver == true){
    screenValidity();
    yLeftPaddle = yBall-heightPaddle*1/2;
    yRightPaddle = yBall-heightPaddle*1/2;
    leftScore = 0;
    rightScore = 0;
    if(yLeftPaddle <=0 || yRightPaddle <= 0) {
      yLeftPaddle = 0;
      yRightPaddle = 0;
    }
    if(yLeftPaddle >= displayHeight-heightPaddle || yRightPaddle >= displayHeight-heightPaddle){
      yLeftPaddle = displayHeight-heightPaddle;
      yRightPaddle = displayHeight-heightPaddle;  
  }
  }
  //Runs single player mode
  else if(singlePlayer == true) {
    screenValidity();
    leftScore = 0;
    rightScore = 0;
    yRightPaddle = yBall-heightPaddle*1/2;
    if(yRightPaddle <= 0) yRightPaddle = 0;
    if(yRightPaddle >= displayHeight-heightPaddle) yRightPaddle = displayHeight-heightPaddle;
  }
  //Runs normal mode
  else{
    screenValidity();
  }
}
//End Artificial Intelligence
