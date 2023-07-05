//Project Two: "Barricade" by Josiah Tolentino 100304547

class Player {

  // initialize variables
  final PVector playerPos = new PVector();
  final PVector playerSpd = new PVector();
  final  byte playerVel = 3;
  final static byte bulletVel = 3;
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.05f;

  // playe movement limitations fort left and right of the screen
  void movePlayer() {
    playerPos.add(playerSpd);
    if (playerPos.x > width ) 
      playerPos.x = width;
    else if (playerPos.x < 0)    
      playerPos.x = 0;
    else if (playerPos.x > 500)    
      playerPos.x = 500;
    else if (playerPos.y < 20)    
      playerPos.y = 20;
    else if (playerPos.y > 580)    
      playerPos.y = 580;
  }

  // player image
  void displayPlayer() {

    // sets angle depending on mouse location
    angle = atan2(playerPos.y - mouseY, playerPos.x - mouseX);

    //sets rotation value using mouse angle and initial player angle
    float dir = (angle - targetAngle) / TWO_PI;
    dir -= round( dir );
    dir *= TWO_PI;

    //ultimate rotation calculations
    targetAngle += dir * easing;

    //push pop lets player rotation
    // values depend on their location and draws player sprite
    pushMatrix();
    translate( playerPos.x, playerPos.y );
    rotate( targetAngle );
    image(playerSprite, 0, 0);
    popMatrix();
  }

  //every 20th frame to simulate a rate of fire
  void shoot() {
    final byte bulletGap = 20;
    if (mousePressed && frameCount % bulletGap == 0)
      player.addBullet();
  }

  // bulletSpd gets mouse position, gets the player position
  // translates value so bullets can read information
  void addBullet() {
    final PVector bulletSpd = new PVector();
    bulletSpd.set(mouseX, mouseY, 0);
    bulletSpd.sub(playerPos);
    bulletSpd.normalize();
    bulletSpd.mult(7);
    bullets.add( new Bullet(playerPos, bulletSpd) );
  }
}
