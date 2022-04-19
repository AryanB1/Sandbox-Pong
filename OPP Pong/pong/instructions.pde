//Start Instructions class
class Instructions {
  private int x, y, wid, hei;
  boolean openInstructions;
  String instructions[] = {
  "For single player: press j (You control the left paddle)",
  "To turn off single player: press z",
  "For screen saver: press f",
  "To turn off screen saver: press z",
  "To turn on night mode: press q",
  "To turn off night mode: press e",
  "To move the left paddle up, press w",
  "To move the left paddle down, press s",
  "To move the right paddle up, press the up key",
  "To move the right paddle down, press the down key",
  "For Left Paddle Speed, Press n (hard), r (normal), g (easy)",
  "For Right Paddle Speed, Press m (hard), t (normal), h (easy)",
  "To reset game press z",
  "A point is scored by getting a point into the enemy players net, or in the case of single player mode, hitting the ball", 
  "First one to 5 points wins!!",
  "Press v to close this window. It can be reopened at any time with the k key",
  "You can also use the k key to take a break"
};
  //Start startingInstructions
  Instructions() {
    x = displayWidth*3/40;
    y = displayHeight*3/40;
    wid = displayWidth*35/40;
    hei = displayHeight*35/40;
    openInstructions = true;
  }
  void startingInstructions() {
    println(instructions[0]);
}
//End startingInstructions
  void draw(){
    fill(nightmode.Base);
    rect(x, y, wid, hei);
    for(int i = 0; i < instructions.length; i++) {
      fill(nightmode.Contrast);
      textAlign(CENTER);
      float size = (hei*1/2)/instructions.length;
      textSize(size);
      text(instructions[i], displayWidth*1/2,(((y+hei)/4)+size+(size*i)) );
    }
    
}
  void openInstructions(){
    if(key == 'k'|| key == 'K') openInstructions = true;
    if(key == 'v' || key == 'V') openInstructions = false;
  }
}
//End Instructions class
