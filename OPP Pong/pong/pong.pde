// Global Variables & Objects
screenSaver screensaver;
nightMode nightmode;
ScoreBoard Scoreboard;
Ball ball;
Paddle paddle;
Instructions Instruction;
Lines lines;
screenCheck screencheck;
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
}//End setup()
//Object is garbage collected here
//
void draw(){
  screencheck.gameRun();
  if (screencheck.check == false) noLoop();
  else{
    background(nightmode.Base); //Gray Scale, hardcoded for prototyping
    paddle.draw();
    Scoreboard.draw();
    ball.draw();
    lines.draw();
    if(screensaver.screenSaver == true) screensaver.activateSaver();
  }
}//End draw()
//
void keyPressed() {
    paddle.paddleMove();
    nightmode.nightModeKeyPress();
    screensaver.checkSaver();
}//End keyPressed()
//
void mousePressed() {

  }//End Constructor
