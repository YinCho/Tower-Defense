//Tower Defense Game
//Jerry You
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPS = 4;
int mode;

final int TOWER = 0;
final int AOE = 1;
final int SNIPER = 2;
final int SLOW = 3;

final int SPEEDY = 0;
final int CHONKY = 1;
int mob;

final int MAP1 = 0;
final int MAP2 = 1;
int map;

int towerReplace;
final int RESET = 0;
final int SELECTED = 1;

//Pallette
color white = #ffffff;
color black = #000000;
color pink = #ff595e;
color orange = #ffca3a;
color green = #8ac826;
color blue = #1982c4;
color purple = #6a4c93;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;
boolean alive;

//variables
int w, count, slowCount, money, lives, towerCost, cordinatesX, cordinatesY;
boolean showing;
boolean tower = true;
int slowReset = 0;

//Buttons
Button start, Play, returnPlay, Build, Map1, Map2, Tower1, AOE1, SniperBuild, Restart, Slow;

//Collections of objects
Node[] nodes, map1nodes, map2nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> Rings;
ArrayList<Sniper> snipers;
ArrayList<SlowRing> slows;
//Images and Gifs
Gif[] myGifs = new Gif[1];
PImage play, heart, map1, map2;
//Fonts
PFont MilkyCoffee;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  myGifs[0] = new Gif("introgif/frame_", "_delay-0.03s.gif", 53, 1, width/2, height/2, width, height);
  play = loadImage("images/play.png");
  heart = loadImage("images/heart.png");
  map1 = loadImage("images/map1.png");
  map2 = loadImage("images/map2.png");
  //Load Fonts
  MilkyCoffee = createFont("MilkyCoffee.ttf", 1);
  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  Rings = new ArrayList<AoE_Ring>();
  snipers = new ArrayList<Sniper>();
  slows = new ArrayList<SlowRing>();

  //variables
  w = 0;
  money = 1150;
  lives = 1;
  towerCost = 0;
  cordinatesX = mouseX;
  cordinatesY = mouseY;
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  Map1 = new Button(map1, width/10*3, 400, 200, 200, white, black);
  Map2 = new Button(map2, width/10*6, 400, 200, 200, white, black);
  //PLAY - Next Wave, To Build Mode
  Play =  new Button(play, 925, 100, 120, 120, white, orange);
  Build = new Button("BUILD", 925, 220, 120, 100, white, blue);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  returnPlay = new Button("PLAY", 925, 100, 120, 120, white, orange);
  Tower1 = new Button("Tower1", 925, 240, 120, 80, white, black);
  AOE1 = new Button("AOE", 925, 350, 120, 80, white, black);
  SniperBuild = new Button("Sniper", 925, 460, 120, 80, white, black);
  Slow = new Button("Slow", 925, 570, 120, 80, white, black);
  Restart = new Button("RESTART", width/2, 600, 120, 80, white, orange);
  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  map1nodes = new Node[9];
  map1nodes [0] = new Node(150, 400, 0, 1);
  map1nodes [1] = new Node(150, 700, 1, 0);
  map1nodes [2] = new Node(300, 700, 0, -1);
  map1nodes [3] = new Node(300, 100, 1, 0);
  map1nodes [4] = new Node(450, 100, 0, 1);
  map1nodes [5] = new Node(450, 700, 1, 0);
  map1nodes [6] = new Node(600, 700, 0, -1);
  map1nodes [7] = new Node(600, 100, 1, 0);
  map1nodes [8] = new Node(750, 100, 0, 1);

  map2nodes = new Node[8];
  map2nodes[0] = new Node(200, 400, 0, -1);
  map2nodes[1] = new Node(200, 200, 1, 0);
  map2nodes[2] = new Node(400, 200, 0, 1);
  map2nodes[3] = new Node(400, 600, -1, 0);
  map2nodes[4] = new Node(300, 600, 0, -1);
  map2nodes[5] = new Node(300, 500, 1, 0);
  map2nodes[6] = new Node(500, 500, 0, -1);
  map2nodes[7] = new Node(500, 400, 1, 0);
}


// ===================== DRAW ===========================

void draw() {

  click();
  textFont(MilkyCoffee, 50);
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == MAPS) {
    mapSelection();
  }
}
