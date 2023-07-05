class Enemy {

  // initializes variables
  float x, y;

  // enemy spawns randomly with and initial set speed
  Enemy() {
    x = random(30, 550);
    y = -40;
  }

  // enemy speed values increase depending on difficulty
  void easyMove() {
    y = y + random(1, 3);
  }

  void mediumMove() {
    y = y + random(2, 4);
  }

  void hardMove() {
    y = y + random(3, 4);
  }

  //creates enemy sprites and sets location/movement
  void display() {
    image(enemySprite, x, y);
  }
}
