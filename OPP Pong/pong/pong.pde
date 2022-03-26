// Global Variables & Objects
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
void setup(){
  fullScreen();
  frameRate(60);
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
}//End setup()
//Object is garbage collected here
//
void draw(){
  screencheck.gameRun();
  if (screencheck.check == false) noLoop();
  else{
    background(nightmode.Base);
    paddle.draw();
    Scoreboard.draw();
    lines.draw();
    ball.draw();
    if(screensaver.screenSaver == true) screensaver.activateSaver();
    if(singleplayer.singlePlayer == true) singleplayer.activateSinglePlayer();
    if(reset.endGame == true) reset.theGreatReset();
  }
}//End draw()
//
void keyPressed() {
    paddle.movement();
    nightmode.nightModeKeyPress();
    screensaver.checkSaver();
    singleplayer.checkSinglePlayer();
    reset.resetCheck();
}//End keyPressed()
//
void mousePressed() {

  }//End Constructor
