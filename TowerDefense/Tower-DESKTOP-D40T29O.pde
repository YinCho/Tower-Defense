class Tower {
  final int PLACING = 0;
  final int PLACED = 1;

  float x, y;
  int cooldown, threshold, towerMode, towerType;

  Tower(int T, int c, int th) {
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
    towerType = T;
  }
  void show() {
    println(towerMode);
    stroke(black);
    strokeWeight(4);
    fill(blue);

    if (towerMode == PLACED) {
      if (towerType == TOWER)       square(x, y, 40);
      else if (towerType == AOE)    circle(x, y, 40);
      else if (towerType == SNIPER) rect(x, y, 60, 30);
      else if (towerType == SLOW)   circle(x, y, 40);
    } else if (towerMode == PLACING) {
      if      (towerType == TOWER)  square(mouseX, mouseY, 40);
      else if (towerType == AOE)    circle(mouseX, mouseY, 40);
      else if (towerType == SNIPER) rect(mouseX, mouseY, 60, 30);
      else if (towerType == SLOW)   circle(mouseX, mouseY, 40);
    }
    if (mousePressed && map == 0 && !mobOnMap1() || mousePressed && map == 1 && !mobOnMap2()) {
      towerMode = PLACED;
      x = mouseX;
      y = mouseY;
      money = money - towerCost;
      towerReplace = RESET;
      towerCost = 0;
    }
  }

  void act() {
    if (mobs.size() > 0) {
      if (towerType == TOWER) towerShoot();
      if (towerType == AOE) AOEShoot();
      if (towerType == SNIPER) sniperShoot();
      if (towerType == SLOW) slowShoot();
    }
  }

  void showTower() {
  }
  void AOEShoot() {
    cooldown++;
    if (cooldown >= threshold) {
      Rings.add(new AoE_Ring(x, y, 0, 60));
      cooldown = 0;
    }
  }

  void sniperShoot() {
    cooldown++;
    if (cooldown >= threshold) {
      snipers.add(new Sniper(x, y, 0, 120));
      cooldown = 0;
    }
  }

  void towerShoot() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); ///UP
      bullets.add(new Bullet(x, y, 0, 10)); ///down
      bullets.add(new Bullet(x, y, -10, 0)); ///LEFT
      bullets.add(new Bullet(x, y, 10, 0)); ///RIGHT
    }
  }

  void slowShoot() {
    cooldown++;
    if (cooldown >= threshold) {
      slows.add(new SlowRing(x, y, 0, 60));
      cooldown = 0;
    }
  }
}
