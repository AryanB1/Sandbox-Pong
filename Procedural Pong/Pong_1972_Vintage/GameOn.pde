//Start GameOn
void gameOn() {
  //Sets background colour
  background(Base);
  //sets fill colour for future rectangles
  fill(Contrast);
  //draws left paddle
  leftPaddleDraw();
  //draws right paddle
  rightPaddleDraw();
  //updates scoreboard
  scoreUpdate();
  // Sets line colour
  stroke(Contrast);
 //Drawing lines
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
  //Creating dashed lines for middle line
  for (int i = 0; i < y2MiddleLine; i += 20) {
    stroke(Base);
    line(x1MiddleLine, i, x2MiddleLine, (i+10));
  }
  //setting colours and drawing scoreboards
  fill(Base);
  stroke(Base);
  rect(xLeftScore, yLeftScore, widthScore, heightScore);
  rect(xRightScore, yRightScore, widthScore, heightScore);
  fill(Contrast);
  textAlign(CENTER);
  textSize(heightScore*1/2);
  text(leftScore, (xLeftScore+(widthScore*1/2)), (yLeftScore+(heightScore*1/2)));
  textAlign(CENTER);
  textSize(heightScore*1/2);
  text(rightScore, (xRightScore+(widthScore*1/2)), (yRightScore+(heightScore*1/2)));
  //drawing the ball
  ball();
}
// End gameOn
