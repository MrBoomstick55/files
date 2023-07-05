//Project Two: "Barricade" by Josiah Tolentino 100304547
class Screens {

  // initialize values
  int y = 540;
  int easy = 50;
  int medium = 225;
  int hard = 400;
  int mode1x = 125;
  int mode2x = 325;
  int modey = 450;
  boolean alive = true;
  boolean mode = false;

  // creates buttons for difficulty select
  void startScreen() {
    background(menu);
    fill(255);
    textAlign(CENTER);
    text("Set Starting Health", 300, 100);

    //Select Health Value
    fill(0, 255, 0);
    rect(50, 150, 150, 50);
    fill(0);
    text("1", 125, 180);

    fill(0, 0, 255);
    rect(225, 150, 150, 50);
    fill(0);
    text("2", 300, 180);

    fill(255, 0, 0);
    rect(400, 150, 150, 50);
    fill(0);
    text("3", 475, 180);

    // Select Bomb Value
    fill(255);
    text("Set Starting Bombs", 300, 225);

    fill(0, 255, 0);
    rect(50, 250, 150, 50);
    fill(0);
    text("1", 125, 280);

    fill(0, 0, 255);
    rect(225, 250, 150, 50);
    fill(0);
    text("2", 300, 280);

    fill(255, 0, 0);
    rect(400, 250, 150, 50);
    fill(0);
    text("3", 475, 280);

    // show health and bomb values
    fill(255);
    text("Health:", 300, 360);
    text(health, 300, 380);

    text("Bombs:", 300, 400);
    text(bombs, 300, 420);

    // select game mode
    fill(0, 255, 0);
    rect(125, 450, 150, 50);
    fill(0);
    text("Barricade", 200, 475);

    fill(255, 0, 0);
    rect(325, 450, 150, 50);
    fill(0);
    text("Last Stand", 400, 475);

    // show game mode
    fill(255);
    text("Game Mode:", 300, 515);
    if (mode) {
      text("Last Stand", 300, 535);
    } else {
      text("Barricade", 300, 535);
    }


    //each difficutly comes with a specific color
    fill(0, 255, 0);
    rect(50, 540, 150, 50);
    fill(0);
    text("Easy", 125, 570);

    fill(0, 0, 255);
    rect(225, 540, 150, 50);
    fill(0);
    text("Medium", 290, 570);

    fill(255, 0, 0);
    rect(400, 540, 150, 50);
    fill(0);
    text("Hard", 475, 570);
  }

  void startGame() {

    if (mousePressed) {

      // set health on button click
      if (mouseX>easy && mouseX <easy+150 && mouseY>150 && mouseY <150+50) {

        health=1;
      }
      if (mouseX>medium && mouseX <medium+150 && mouseY>150 && mouseY <150+50) {

        health=2;
      }
      if (mouseX>hard && mouseX <hard+150 && mouseY>150 && mouseY <150+50) {
        health=3;
      }

      // set bomb on button click
      if (mouseX>easy && mouseX <easy+150 && mouseY>250 && mouseY <250+50) {

        bombs=1;
      }
      if (mouseX>medium && mouseX <medium+150 && mouseY>250 && mouseY <250+50) {

        bombs=2;
      }
      if (mouseX>hard && mouseX <hard+150 && mouseY>250 && mouseY <250+50) {
        bombs=3;
      }
      // set game mode
      if (mouseX>mode1x && mouseX <mode1x+150 && mouseY>modey && mouseY <modey+50) {
        mode = false;
      }

      if (mouseX>mode2x && mouseX <mode2x+150 && mouseY>modey && mouseY <modey+50) {
        mode = true;
      }

      // button click changes difficulty
      if (mouseX>easy && mouseX <easy+150 && mouseY>y && mouseY <y+50) {
        // if last stand mode is selected, send to that screen 
        if (mode) {
          gameScreen=5;
        } else {
          gameScreen=1;
        }
      }
      if (mouseX>medium && mouseX <medium+150 && mouseY>y && mouseY <y+50) {
        if (mode) {
          gameScreen=6;
        } else {
          gameScreen=2;
        }
      }
      if (mouseX>hard && mouseX <hard+150 && mouseY>y && mouseY <y+50) {
        if (mode) {
          gameScreen=7;
        } else {
          gameScreen=3;
        }
      }
    }
  }

  //each difficulty increases the speed and rate of enemies showing up
  void easygameplayScreen() {

    //calls player class
    player.movePlayer();
    player.displayPlayer();
    player.shoot();
    handleBullets();
    printScore();
    barricade();
    killButton();

    //load enemies in array
    for (int i = enemies.size()-1; i>=0; i--) {

      Enemy e = (Enemy) enemies.get(i);
      //set movement to easy difficulty
      e.easyMove();
      e.display();

      for (Bullet blt : bullets) {
        //if the distance between the bullet and enemy is less than the enemy's width
        if (dist(blt.x, blt.y, e.x, e.y) < enemySprite.width-5) {
          //remove the enemy
          enemies.remove(e);
          score += 1;
        }
      }

      // if enemy hits barricade remove enemy and - 1 life
      if (alive) {
        if (e.y > source.height - 90) {
          health--;
          enemies.remove(e);
        }
      }           

      // if the enemy reaches the bottom of the screen game over
      if (e.y > source.height -10) {
        gameOver();
      }
    }

    // spawn enemies based off frame rate
    if (frameCount%45==0) {
      enemies.add(new Enemy());
    }
  }

  void mediumgameplayScreen() {

    player.movePlayer();
    player.displayPlayer();
    player.shoot();
    handleBullets();
    printScore();
    barricade();
    killButton();

    for (int i = enemies.size()-1; i>=0; i--) {

      Enemy e = (Enemy) enemies.get(i);
      e.mediumMove();
      e.display();


      for (Bullet blt : bullets) {
        //if the distance between the bullet and enemy is less than the enemy's width
        if (dist(blt.x, blt.y, e.x, e.y) < enemySprite.width-5) {
          //remove the enemy
          enemies.remove(e);
          score += 1;
        }
      }

      // if enemy hits barricade remove enemy and - 1 life
      if (alive) {
        if (e.y > source.height - 90) {
          health--;
          enemies.remove(e);
        }
      } 

      if (e.y > source.height -10) {
        gameOver();
      }
    }

    if (frameCount%30==0) {
      enemies.add(new Enemy());
    }
  }

  void hardgameplayScreen() {
    player.movePlayer();
    player.displayPlayer();
    player.shoot();
    handleBullets();
    printScore();
    barricade();
    killButton();


    for (int i = enemies.size()-1; i>=0; i--) {

      Enemy e = (Enemy) enemies.get(i);
      e.hardMove();
      e.display();

      for (Bullet blt : bullets) {
        //if the distance between the bullet and enemy is less than the enemy's width
        if (dist(blt.x, blt.y, e.x, e.y) < enemySprite.width-5) {
          //remove the enemy
          enemies.remove(e);
          score += 1;
        }
      }

      // if enemy hits barricade remove enemy and - 1 life
      if (alive) {
        if (e.y > source.height - 90) {
          health--;
          enemies.remove(e);
        }
      } 

      if (e.y > source.height -10) {
        gameOver();
      }
    }

    if (frameCount%15==0) {
      enemies.add(new Enemy());
    }
  }

  //last stand mode difficulty settings
  void easysurvivalScreen() {

    //calls player class
    player.movePlayer();
    player.displayPlayer();
    player.shoot();
    handleBullets();
    printScore();
    killButton();

    //load enemies in array
    for (int i = survive.size()-1; i>=0; i--) {

      Survival e = (Survival) survive.get(i);
      //set movement to easy difficulty
      e.display();
      e.move();

      for (Bullet blt : bullets) {
        //if the distance between the bullet and enemy is less than the enemy's width
        if (dist(blt.x, blt.y, e.x, e.y) < enemySprite.width-5) {
          //remove the enemy
          survive.remove(e);
          score += 1;
        }
      }

      // if the enemy touches the player -1 health
      if (dist(player.playerPos.x, player.playerPos.y, e.x, e.y) < enemySprite.width-5) {
        health--;
        survive.remove(e);
      }
    }

    // setting game over to when health drops to 0
    if (health == 0) {
      gameOver();
    }

    // spawn enemies based off frame rate
    if (frameCount%45==0) {
      survive.add(new Survival());
    }
  }

  void mediumsurvivalScreen() {

    //calls player class
    player.movePlayer();
    player.displayPlayer();
    player.shoot();
    handleBullets();
    printScore();
    killButton();

    //load enemies in array
    for (int i = survive.size()-1; i>=0; i--) {

      Survival e = (Survival) survive.get(i);
      //set movement to easy difficulty
      e.display();
      e.move();

      for (Bullet blt : bullets) {
        //if the distance between the bullet and enemy is less than the enemy's width
        if (dist(blt.x, blt.y, e.x, e.y) < enemySprite.width-5) {
          //remove the enemy
          survive.remove(e);
          score += 1;
        }
      }

      // if the enemy touches the player -1 health
      if (dist(player.playerPos.x, player.playerPos.y, e.x, e.y) < enemySprite.width-5) {
        health--;
        survive.remove(e);
      }
    }

    // setting game over to when health drops to 0
    if (health == 0) {
      gameOver();
    }

    if (frameCount%30==0) {
      survive.add(new Survival());
    }
  }

  void hardsurvivalScreen() {
    //calls player class
    player.movePlayer();
    player.displayPlayer();
    player.shoot();
    handleBullets();
    printScore();
    killButton();

    //load enemies in array
    for (int i = survive.size()-1; i>=0; i--) {

      Survival e = (Survival) survive.get(i);
      //set movement to easy difficulty
      e.display();
      e.move();

      for (Bullet blt : bullets) {
        //if the distance between the bullet and enemy is less than the enemy's width
        if (dist(blt.x, blt.y, e.x, e.y) < enemySprite.width-5) {
          //remove the enemy
          survive.remove(e);
          score += 1;
        }
      }

      // if the enemy touches the player -1 health
      if (dist(player.playerPos.x, player.playerPos.y, e.x, e.y) < enemySprite.width-5) {
        health--;
        survive.remove(e);
      }
    }

    // setting game over to when health drops to 0
    if (health == 0) {
      gameOver();
    }

    if (frameCount%15==0) {
      survive.add(new Survival());
    }
  }

  void gameOver() {
    gameScreen=4;
  }

  void gameOverScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Score", 300, 100);
    text(score, 300, 190);

    text("Game Over", height/2, width/2 - 20);
    textSize(15);
    text("Click to Restart", height/2, width/2 + 10);
  }

  void restart() {
    //reset values and return to difficulty select
    enemies.clear();
    survive.clear();
    gameScreen = 0;
    score = 0;
    alive = true;
    health = 3;
    bombs = 3;
    // when reseting put player in center of screen
    if (mode) {
      player.playerPos.x = 300; 
      player.playerPos.y = 300;
    }
  }

  void printScore() {
    // displays score and difficulty
    textAlign(CENTER);
    fill(255);
    textSize(30); 
    text("Kills:", 530, 90);
    text(score, 580, 90);
    text("Health:", 520, 120);
    text(health, 580, 120);
    text("Bombs:", 520, 150);
    text(bombs, 580, 150);

    if (gameScreen == 1) {
      fill(0, 255, 0);
      text("Easy", 550, 40);
    }
    if (gameScreen == 2) {
      fill(0, 0, 255);
      text("Medium", 520, 40);
    }
    if (gameScreen == 3) {
      fill(255, 0, 0);
      text("Hard", 550, 40);
    }
    if (gameScreen == 5) {
      fill(0, 255, 0);
      text("Easy", 550, 40);
    }
    if (gameScreen == 6) {
      fill(0, 0, 255);
      text("Medium", 520, 40);
    }
    if (gameScreen == 7) {
      fill(255, 0, 0);
      text("Hard", 550, 40);
    }
  }

  // sets barrier to boolean and life value
  void barricade() {

    if (health > 0) {
      alive = true;

      fill(255, 0, 0);
      //rect(0, 520, 600, 10);
      image(wall, 50, 520, 120, 70);
      image(wall, 150, 520, 120, 70);
      image(wall, 250, 520, 120, 70);
      image(wall, 350, 520, 120, 70);
      image(wall, 450, 520, 120, 70);
      image(wall, 550, 520, 120, 70);
    } else {
      alive = false;
      fill(255, 0, 0);
      rect(0, 620, 600, 10);
    }
  }

  //pressing the g button will throw a grenade and clear the screen
  void killButton() {

    if (bombs > 0) {
      if (keyPressed) {
        if (key == 'G' || key =='g') {
          enemies.clear();
          survive.clear();
          bombs--;
        }
      }
    }
  }
}
