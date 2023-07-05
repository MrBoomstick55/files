//Project Two: "Barricade" by Josiah Tolentino 100304547

Player player = new Player(); 
Screens screen = new Screens();

//creates arraylist
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Survival> survive = new ArrayList<Survival>();
ArrayList<Bullet> bullets = new ArrayList(); 

//calls images
PImage playerSprite, enemySprite, source, menu, wall, bullet;

// creates variables
int i;
int score = 0;
int difficultySelect = 0;
int gameScreen = 0;
int health = 3;
int bombs = 3;

// game setup
void setup() {
  size(600, 600);
  smooth(2);
  noStroke();
  noCursor();
  cursor (CROSS);
  ellipseMode(CENTER);
  imageMode(CENTER);
  frameRate(60);

  //load and sets images
  source = loadImage("maptest.png");
  menu = loadImage("menuart.jpg");
  wall = loadImage("wall.png");
  bullet = loadImage("bullet.png");

  playerSprite =  loadImage("player.png");
  playerSprite.resize(50, 50);
  player.playerPos.set(300, 570);

  enemySprite =  loadImage("zombie.png");
  enemySprite.resize(50, 50);
}

void draw() {
  //Grabs image for background
  background(source);
  // Sets screen states from screen class
  if (gameScreen == 0) { 
    screen.startScreen();
  } else if (gameScreen == 1) { 
    screen.easygameplayScreen();
  } else if (gameScreen == 2) { 
    screen.mediumgameplayScreen();
  } else if (gameScreen == 3) { 
    screen.hardgameplayScreen();
  } else if (gameScreen == 4) { 
    screen.gameOverScreen();
  } else if (gameScreen == 5) { 
    screen.easysurvivalScreen();
  } else if (gameScreen == 6) { 
    screen.mediumsurvivalScreen();
  } else if (gameScreen == 7) { 
    screen.hardsurvivalScreen();
  }
}

//player movement on key presses, 
//if last stand is selected, add vertical movement
void keyPressed() {
  final int k = keyCode;
  if (k == 'A')
    player.playerSpd.x = -player.playerVel;
  else if (k == 'D')
    player.playerSpd.x = player.playerVel;
  if (screen.mode) {
    if (k == 'W')
      player.playerSpd.y = -player.playerVel;
    else if (k == 'S')
      player.playerSpd.y = player.playerVel;
  }
}

//sets player speed to 0 when key is released, 
//if last stand is selected, add vertical movement
void keyReleased() {
  final int k = keyCode;
  if ( (k == 'A') && player.playerSpd.x < 0
    || (k == 'D') && player.playerSpd.x > 0 )
    player.playerSpd.x = 0;

  if (screen.mode) {
    if ( ( k == 'W') && player.playerSpd.y < 0
      || (k == 'S') && player.playerSpd.y > 0 )
      player.playerSpd.y = 0;
  }
}

public void mousePressed() {

  // depending on the screen clicking changes the state
  if (gameScreen==0) { 
    screen.startGame();
  }
  if (gameScreen==4) {
    screen.restart();
  }
}


// remove bullets
void handleBullets() {
  for ( int b = bullets.size(); b != 0; )
    if ( bullets.get(--b).run() )  
      bullets.remove(b);
  print(bullets.size() + "\t");
}
