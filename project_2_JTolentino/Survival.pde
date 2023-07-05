//Project Two: "Barricade" by Josiah Tolentino 100304547
class Survival {

  // initializes variables
  float x, y, direction, speed;

  // enemy spawns randomly and knows player position
  Survival() {
    x = width * round(random(1));
    y = random(height);
    direction = atan2(player.playerPos.x - x, player.playerPos.y - y);
    speed = 3;
  }

  //follows player position closes the gap with speed
  void move() {
    direction = atan2(player.playerPos.x - x, player.playerPos.y - y);
    x += sin(direction) * speed;
    y += cos(direction) * speed;
  }

  //creates enemy sprites and sets location/movement
  void display() {
    image(enemySprite, x, y);
  }
}
