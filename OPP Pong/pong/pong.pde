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
Victory victory;
ArrayList<Ball> balls;
ArrayList<Paddle> paddles = new ArrayList<Paddle>();
Ball[] stars= new Ball[25];
Ball[] fireworks = new Ball[25];
reset reset;
int changes = 0;
boolean runBlackholeOnce = true, runChaseOnce = true, startFireworks = false;
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
  balls.add(new Ball(displayWidth, displayHeight, 1));//balls[i] = new Ball(displayWidth, displayHeight-(i*(displayHeight/(balls.length+2))), 1);
  paddle = new Paddle( displayWidth, displayHeight);
  screencheck = new screenCheck( displayWidth, displayHeight);
  screensaver = new screenSaver();
  singleplayer = new singlePlayer();
  victory = new Victory();
  paddles.add(new Paddle(displayWidth, displayHeight, "Neither, this is here so that I have an object"));
  reset = new reset();
  for (int i=0; i<fireworks.length; i++) {
    fireworks[i] = new Ball(width, height, 0, 0, 0);
  }
  int geometry = ( displayWidth <= displayHeight ) ? displayWidth : displayHeight;
    //
  for (int i=0; i<stars.length; i++) {
      //Randomly choose parameters
      float diameterRandom = random ( geometry*1/8, geometry*1/4); //Consider user Input (eye sentitivity)
      float xRandom = random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 ); //No stars in net
      float yRandom = random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 ); //Entire displayHeight OK
      stars[i] = new Ball (xRandom, yRandom, diameterRandom, 0);
      /* Switched the loops to normal if statements, since the loops seemed
      unnecessary, and the if statements are more efficient
      */ 
      if ( xRandom-diameterRandom*1/2 > stars[i].x && xRandom+diameterRandom*1/2 < stars[i].x ) {
        xRandom = random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 );
        stars[i] = new Ball (xRandom, yRandom, diameterRandom, 0);
        }
      if ( yRandom-diameterRandom*1/2 > stars[i].x && yRandom+diameterRandom*1/2 < stars[i].x ) {
        yRandom = random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 );
        stars[i] = new Ball (xRandom, yRandom, diameterRandom, 0);
      //
    }//End FOR
    }
    for (int i=0; i<stars.length; i++) {
    for ( int j=stars.length-1; j>i; j--) {
      /*Checks distance between stars and then ensures that the distance is greater
       than the average diameter of the two stars. If the average diameter is larger
       than the distance, a new ball is made, and the algorithm repeats
      */
      if(dist(stars[i].x, stars[i].y, stars[j].x, stars[j].y) <= ((stars[i].diameter+stars[j].diameter)*1/2)){
        float diameterRandom = random ( geometry*1/8, geometry*1/4); //Consider user Input (eye sentitivity)
        float xRandom = random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 ); //No stars in net
        float yRandom = random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 ); //Entire displayHeight OK
        stars[i] = new Ball (xRandom, yRandom, diameterRandom, 0);
        i = 0;
        j = stars.length;
      }
      }//End nested FOR
    }
}
//End setup()
//Start draw()
void draw(){
  //makes sure screen is in landscape
  screencheck.gameRun();
  if (screencheck.check == false) noLoop();
  else if(Scoreboard.leftScore == 5 || Scoreboard.rightScore == 5) {
    background(nightmode.Base);
    for(Ball star : stars){
      star.draw();
    }
    victory.draw();
  }
  else{
    //draws and updates game visual elements
    background(nightmode.Base);
    paddle.draw();
    Scoreboard.draw();
    lines.draw();
    //Automatically checks for when a new paddle drop needs to happen rather than me manually checking
    // Through boolean statements 
    for(int i = 0; i < paddles.size(); i++) {
      paddles.get(i).drawPaddles();
    }
    if(ball.start == true) startFireworks = true;
    //if(startFireworks == true){
     // print(2);
      //for (int i=0; i<fireworks.length; i++) {
       // print(1);
   //     fireworks[i].fireworkStep();
     //   fireworks[i].fireworkBounce();
       // fireworks[i].fireworkDraw();
     // startFireworks = false;
  //}//End FOR
    //}
    if(ball.numBalls > balls.size()) {
      balls.add(new Ball(displayWidth, (ball.y + balls.size()*50)*2, 1));
      if(balls.size() % 2 == 0) balls.get(balls.size()-1).xSpeed *= -1;  
      if(balls.size() % 3 == 1) balls.get(balls.size()-1).ySpeed *= -1;  
  }
    if(ball.numBalls < balls.size()) balls.remove(balls.size()-1);
    if(runBlackholeOnce == false) {
      if(balls.size() > 1) balls.remove(balls.size()-1);
    }
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
  if(Scoreboard.leftScore == 3 && runChaseOnce == true|| Scoreboard.rightScore == 3 && runChaseOnce == true) {
    runChaseOnce = false;
    for (int i=0; i<balls.size(); i++) {
      if(mouseX > displayWidth*5/40 && mouseX < displayWidth*35/40) balls.get(i).setTargetX(mouseX); //Value of mouse-click
      if(mouseY > displayHeight*5/40 && mouseY < displayHeight*35/40) balls.get(i).setTargetY(mouseY); //Value of mouse-click
  }
  }
   //Black hole metaphor applied as an easter egg. 
  else if(Scoreboard.leftScore == 4 && runBlackholeOnce == true|| Scoreboard.rightScore == 4 && runBlackholeOnce == true){
    runBlackholeOnce = false;
    for (int i=0; i<balls.size(); i++) {
      if(mouseX > displayWidth*5/40 && mouseX < displayWidth*35/40) balls.get(i).setBlackHoleX(mouseX); //Value of mouse-click
      if(mouseY > displayHeight*5/40 && mouseY < displayHeight*35/40) balls.get(i).setBlackHoleY(mouseY); //Value of mouse-click
  }
  }
  
  }//End FOR


//End mousePressed()
