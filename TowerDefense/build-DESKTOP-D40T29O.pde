//This function draws the BUILD screen
void build() {
  drawMap();
  if (map == 0) {
    stroke(pink, 60);
    strokeWeight(50);
    map1();
  } else if (map ==1) {
    stroke(pink, 60);
    strokeWeight(50);
    map2();
  }
  animateThings();
  buildInterface();
  buildButtons();
  buildFlashingSign();
  buildButtonClicks();
}
void buildInterface() {
  fill(black);
  fill(pink);
  rect(950, 400, 200, 1000);
  fill(black);
  stroke(black);
}
void buildFlashingSign() {
  fill(blue);

  count++;
  if (count <= 20) {
    text("BUILD MODE", 420, 70);
  } else if (count == 40) {
    count = 0;
  }
  fill(black);
  text("$:20", 925, 180);
}
void buildButtons() {
  returnPlay.show();
  Tower1.show();
  AOE1.show();
  SniperBuild.show();
  Slow.show();
}
void buildButtonClicks() {
  if (returnPlay.clicked) {
    mode = PLAY;
  }
  
  if (Tower1.clicked && money>=20  && towerChosen()) {
    towers.add(new Tower(TOWER, 0, 60));
    towerCost = 10;
    towerReplace = SELECTED;
  }
  if (AOE1.clicked && money >= 30 && towerChosen()) {
    towerCost = 15;
    towers.add(new Tower(AOE, 40, 90));
    towerReplace = SELECTED;
  }
  if (SniperBuild.clicked && money >= 50 && towerChosen()) {
    towerCost = 30;
    towers.add(new Tower(SNIPER, 0, 120));
    towerReplace = SELECTED;
  }
  if (Slow.clicked && money >= 25 && towerChosen()) {
    towerCost = 25;
    towers.add(new Tower(SLOW, 40 , 90));
    towerReplace = SELECTED;
  }
}

boolean towerChosen() {
  return towerReplace == RESET;
}
