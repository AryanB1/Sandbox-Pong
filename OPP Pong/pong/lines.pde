class Lines {
  private float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet;
  private float x1RightNet, y1RightNet, x2RightNet, y2RightNet;
  private float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine;
  Lines(int lineWidth, int lineHeight){
    //Middle Line variables
    x2MiddleLine= x1MiddleLine = lineWidth*1/2;
    //Left paddle and line variables
    x2LeftNet = x1LeftNet = lineWidth*1/40;
    //Right line variables
    x2RightNet = x1RightNet = lineWidth*39/40;
    //middle line, right line, and left line
    y1MiddleLine = y1RightNet = y1LeftNet = lineHeight*0;
    //All three lines
    y2MiddleLine = y2RightNet = y2LeftNet = lineHeight;
  }
    void draw() {
      stroke(nightmode.Contrast);
      line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
      line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
      line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
      for (int i = 0; i < y2MiddleLine; i += 20) {
        stroke(nightmode.Base);
        line(x1MiddleLine, i, x2MiddleLine, (i+10));
  }
   
  }
}
