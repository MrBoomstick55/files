class Bullet extends PVector {

  // initializes velocity values from player class
  PVector vel;

  // grab get player location and velocity from player
  Bullet(PVector loc, PVector vel) {
    super(loc.x, loc.y);
    this.vel = vel;
  }

  // creates bullet spawn area, shape, size, and color
  void display() {
    final byte bulletSize = 4;
    fill(255, 0, 0);
    rect(x+15, y-30, bulletSize, 10);
  }

  // bullet speed depending on 
  boolean update() {
    add(vel);
    return x > width || x < 0 || y > height || y < 0;
  }

  // move animation
  boolean run() {
    display();
    return update();
  }
}
