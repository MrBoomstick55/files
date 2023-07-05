class Bombs {

  // initializes float and boolean values
  float x, y, w, h;
  float initialY;

  boolean kill = true;
  boolean lock = false;

  // grabs coordinates from methods
  Bombs (float _x, float _y, float _w, float _h) {

    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }

  void run() {
    //Uses pushpop matrix to keep the dynamite objects on screen
    pushMatrix();
    fill(0);
    //draws shaft
    rect(x, 520, 10, 100);

    handle();
    popMatrix();
  }

  // sees if mouse is over the handle
  boolean isOver()
  {
    return (x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y);
  }

  void handle() {
    //handle
    fill(255, 0, 0);
    rect(x-10, y, w, h);

    //get mouseInput and map it
    float my = constrain(mouseY, 520, height - h - initialY );
    if (lock) y = my;

    // if the handle reaches the bottom of the screen it clears the stage once per handle
    if (kill) {
      if ( h > source.height -10) {
        enemies.clear();
        kill = false;
      }
    }
  }
}
