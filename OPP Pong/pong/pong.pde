// Declaring Objects
screenSaver screensaver;
singlePlayer singleplayer;
nightMode nightmode;
ScoreBoard Scoreboard;
Ball ball;
Paddle paddle;
Instructions Instruction;
Lines lines;
screenCheck screencheck;
ArrayList<Ball> balls;
reset reset;
int changes = 0;
//Start setup()
void setup(){
  //Runs game at fullscreen (displayWidth, displayHeight)
  fullScreen();
  //Locks frameRate
  frameRate(60);
  //Initializing Objects
  nightmode = new nightMode();
  Instruction = new Instructions();
  lines = new Lines(displayWidth, displayHeight);
  Scoreboard = new ScoreBoard(displayWidth, displayHeight);
  ball = new Ball( displayWidth, displayHeight); //Start the first ball, need ballCounter
  balls = new ArrayList<Ball>();
  //for(int i = 0; i < balls.length; i++) {
  balls.add(new Ball(displayWidth, displayHeight-(displayHeight/2), 1));//balls[i] = new Ball(displayWidth, displayHeight-(i*(displayHeight/(balls.length+2))), 1);
   // if(i % 2 == 1) balls[i].ySpeed *= -1;  
    //if(i % 2 == 0) balls[i].xSpeed *= -1;
//}
  paddle = new Paddle( displayWidth, displayHeight);
  screencheck = new screenCheck( displayWidth, displayHeight);
  screensaver = new screenSaver();
  singleplayer = new singlePlayer();
  reset = new reset();
}
//End setup()
//Start draw()
void draw(){
  //makes sure screen is in landscape
  screencheck.gameRun();
  if (screencheck.check == false) noLoop();
  else{
    //draws and updates game visual elements
    background(nightmode.Base);
    paddle.draw();
    Scoreboard.draw();
    lines.draw();
    if(ball.numBalls > balls.size()) {
      balls.add(new Ball(displayWidth, displayHeight-(balls.size()*(displayHeight/(balls.size()+2))), 1));
      if(balls.size() % 2 == 0) balls.get(balls.size()-1).xSpeed *= -1;  
      if(balls.size() % 2 == 1) balls.get(balls.size()-1).ySpeed *= -1;  
  }
    if(ball.numBalls < balls.size()) balls.remove(balls.size()-1);
    //Activates screensaver mode
    if(screensaver.screenSaver == true){
      screensaver.activateSaver();
      ball.draw();
    } 
    //Activates singleplayer mode
    else if(singleplayer.singlePlayer == true){
      singleplayer.activateSinglePlayer();
      ball.draw();
    }
    else {
        for(int i = 0; i < balls.size(); i++) {
          balls.get(i).draw();
      }
    }
    if (Instruction.openInstructions == true) Instruction.draw();
    //resets game
    if(reset.endGame == true) reset.theGreatReset();
  }
}
//end draw()
//start keyPressed()
void keyPressed() {
  //Opens and closes instructions
  Instruction.openInstructions(); 
  //Sets paddle speeds, and movements
  paddle.movement();
  // Activates / deactivates nightmode
  nightmode.nightModeKeyPress();
  //activates screensaver
  screensaver.checkSaver();
  //activates singleplayer
  singleplayer.checkSinglePlayer();
  //resets game
  reset.resetCheck();
  //Spawn balls
  ball.nums();
}
//End keyPressed()
//Start mousePressed()
void mousePressed(){
  // Chase metaphor applied as an easter egg
  if(Scoreboard.leftScore == 4 && ball.mouseStop == false|| Scoreboard.rightScore == 4 && ball.mouseStop == false) {
    for (int i=0; i<balls.size(); i++) {
      if(mouseX > displayWidth*5/40 && mouseX < displayWidth*35/40) balls.get(i).setTargetX(mouseX); //Value of mouse-click
      if(mouseY > displayHeight*5/40 && mouseY < displayHeight*35/40) balls.get(i).setTargetY(mouseY); //Value of mouse-click
  }
    //Black hole metaphor applied as an easter egg. 
  if(Scoreboard.leftScore == 4 && ball.mouseStop == true && ball.blackholeStop == false|| Scoreboard.rightScore == 4 && ball.mouseStop == false && ball.blackholeStop == false){
  
  }
  }//End FOR

}
//End mousePressed()
