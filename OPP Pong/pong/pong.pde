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
//Start setup()
void setup(){
  //Runs game at fullscreen (displayWidth, displayHeight)
  fullScreen();
  //Locks frameRate
  frameRate(60);
  //Initializing Objects
  nightmode = new nightMode();
  Instruction = new Instructions();
  Instruction.startingInstructions();
  lines = new Lines(displayWidth, displayHeight);
  Scoreboard = new ScoreBoard(displayWidth, displayHeight);
  ball = new Ball( displayWidth, displayHeight ); //Start the first ball, need ballCounter
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
    ball.draw();
    //Activates screensaver mode
    if(screensaver.screenSaver == true) screensaver.activateSaver();
    //Activates singleplayer mode
    if(singleplayer.singlePlayer == true) singleplayer.activateSinglePlayer();
    //resets game
    if(reset.endGame == true) reset.theGreatReset();
  }
}
//end draw()
//start keyPressed()
void keyPressed() {
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
