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
reset reset;
Ball[] balls = new Ball[2];
int changes = 0;
int time = 0;
//Start setup()
void setup(){
  //Runs game at fullscreen (displayWidth, displayHeight)
  fullScreen();
  //Locks frameRate
  frameRate(60);
  //Initializing Objects
  time = millis();
  nightmode = new nightMode();
  Instruction = new Instructions();
  Instruction.startingInstructions();
  lines = new Lines(displayWidth, displayHeight);
  Scoreboard = new ScoreBoard(displayWidth, displayHeight);
  ball = new Ball( displayWidth, displayHeight); //Start the first ball, need ballCounter

  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(displayWidth, displayHeight-(i*(displayHeight/(balls.length+2))), 1);
    balls[i].ySpeed *= -1;  
    if(i % 2 == 0) balls[i].xSpeed *= -1;
}
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
        for(int i = 0; i < balls.length; i++) {
          balls[i].draw();
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
}
//End keyPressed()
