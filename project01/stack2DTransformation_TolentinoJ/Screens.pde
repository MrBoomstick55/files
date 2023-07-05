class Screens {
  
  // initialize values
  int x = 225;
  int easy = 150;
  int medium = 250;
  int hard = 350;
  
  // creates buttons for difficulty select
  void startScreen() {
    background(55);
    fill(255);
    textAlign(CENTER);
    text("Select Difficulty", 300, 100);

    //each difficutly comes with a specific color
    fill(0, 255, 0);
    rect(225, 150, 150, 50);
    fill(0);
    text("Easy", 250, 175);

    fill(0, 0, 255);
    rect(225, 250, 150, 50);
    fill(0);
    text("Medium", 260, 275);

    fill(255, 0, 0);
    rect(225, 350, 150, 50);
    fill(0);
    text("Hard", 250, 375);
  }

  void startGame() {

    // button click changes difficulty
    if (mousePressed) {
      if (mouseX>x && mouseX <x+150 && mouseY>easy && mouseY <easy+50) {
        gameScreen=1;
      }
      if (mouseX>x && mouseX <x+150 && mouseY>medium && mouseY <medium+50) {
        gameScreen=2;
      }
      if (mouseX>x && mouseX <x+150 && mouseY>hard && mouseY <hard+50) {
        gameScreen=3;
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

    // loads dynamite
    for (Bombs b : bomb) {
      b.run();
    }

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

    for (Bombs b : bomb) {
      b.run();
    }

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

      if (e.y > source.height -10) {
        gameOver();
      }
    }

    if (frameCount%15==0) {
      enemies.add(new Enemy());
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
    gameScreen = 0;
    score = 0;
  }

  void printScore() {
    // displays score and difficulty
    textAlign(CENTER);
    fill(255);
    textSize(30); 
    text("Kills:", 530, 40);
    text(score, 580, 40);

    if (gameScreen == 1) {
      fill(0, 255, 0);
      text("Easy", 550, 90);
    }
    if (gameScreen == 2) {
      fill(0, 0, 255);
      text("Medium", 520, 90);
    }
    if (gameScreen == 3) {
      fill(255, 0, 0);
      text("Hard", 550, 90);
    }
  }
}
