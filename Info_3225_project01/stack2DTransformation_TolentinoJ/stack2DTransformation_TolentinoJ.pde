//Project One: "Barricade" by Josiah Tolentino 100304547

Player player = new Player(); 
Screens screen = new Screens();

// array to hold all sliders
Bombs[] bomb =  new Bombs[2]; 

//creates arraylist
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Bullet> bullets = new ArrayList(); 

//calls images
PImage playerSprite, enemySprite, source;

// creates variables
int i;
int score = 0;
int difficultySelect = 0;
int gameScreen = 0;

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

  playerSprite =  loadImage("player.png");
  playerSprite.resize(50, 50);
  player.playerPos.set(300, 570);

  enemySprite =  loadImage("zombie.png");
  enemySprite.resize(50, 50);

  //creates dynamite and calls their positions from array
  bomb[0] = new Bombs(10, 520, 30, 15);
  bomb[1] = new Bombs(70, 520, 30, 15);
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
  }
}

//player movement on key presses
void keyPressed() {
  final int k = keyCode;
  if (k == 'A')
    player.playerSpd.x = -player.playerVel;
  else if (k == 'D')
    player.playerSpd.x = player.playerVel;
}

//sets player speed to 0 when key is released
void keyReleased() {
  final int k = keyCode;
  if ( (k == 'A') && player.playerSpd.x < 0
    || (k == 'D') && player.playerSpd.x > 0 )
    player.playerSpd.x = 0;
}

public void mousePressed() {

  // depending on the screen clicking changes the state
  if (gameScreen==0) { 
    screen.startGame();
  }
  if (gameScreen==4) {
    screen.restart();
  }
  //locks handle if clicked from bomb class
  for (Bombs b : bomb) {
    {
      if (b.isOver())
        b.lock = true;
    }
  }
}

void mouseReleased() {

  //unlock handle on release from bomb class
  for (Bombs b : bomb) {
    {
      b.lock = false;
    }
  }
}

// remove bullets
void handleBullets() {
  for ( int b = bullets.size(); b != 0; )
    if ( bullets.get(--b).run() )  
      bullets.remove(b);
  print(bullets.size() + "\t");
}
