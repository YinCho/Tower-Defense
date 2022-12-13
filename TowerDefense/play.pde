//This function draws the PLAY screen
void play() {

  drawMap();
  drawPlayInterface();
  animateThings();
  handleButtonClicks();
  if (lives == 0) {
    mode = GAMEOVER;
  }
}
void drawMap() {
  if (map == MAP1) {
    //Background
    background(green);
    fill(pink);
    stroke(orange);
    strokeWeight(20);
    //PATH
    map1();
    stroke(black);
    strokeWeight(4);
    rect(950, 400, 200, 1000);
  } else if (map == MAP2) {
    background(black);
    fill(pink);
    stroke(black);
    stroke(#FC0808);
    strokeWeight(20);
    map2();
    stroke(black);
    strokeWeight(4);
    rect(950, 400, 200, 1000);
  }

  strokeWeight(5);
  textSize(35);
  stroke(black);
  fill(white);
  text("Wave:"+ w, 925, 20);
  text("$"+money, 50, 20);
  image(heart, 150, 23, 30, 30);
  text(":" + lives, 190, 20);
}
void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp<= 0) {
      mobs.remove(i);
      money++;
    } else {
      i++;
    }
  }
  i = 0;
  while (i<towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) {
      myTower.act();
    }
    myTower.show();
    i++;
  }
  i = 0;
  while (i<bullets.size()) {
    Bullet myBullet= bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp<= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  i = 0;
  while (i<Rings.size()) {
    AoE_Ring myRing = Rings.get(i);
    if (mobs.size() > 0)
      myRing.show();
    if (myRing.count>= 20) {
      Rings.remove(i);
    } else {
      i++;
    }
  }
  i = 0;
  while (i<snipers.size()) {
    Sniper mySniper = snipers.get(i);
    if (mobs.size() > 0)
      mySniper.show();
    if (mySniper.count >= 20) {
      snipers.remove(i);
      // mobs.get(i).hp = mobs.get(i).hp-50;
    } else {
      i++;
    }
  }
  i = 0;
  while (i<slows.size()) {
    SlowRing mySlowTower = slows.get(i);
    if (mobs.size() > 0)
      mySlowTower.show();
    if (mySlowTower.count >=20) {
      slows.remove(i);
    }
    i++;
  }
}
void drawPlayInterface() { //Play button
  stroke(black);
  Play.show();
  Build.show();
  fill(black);
}
void handleButtonClicks() {
  int i = -1;
  int x = 0;
  if (mobs.size() == 0) {
    if (Build.clicked) {
      mode = BUILD;
      tower = true;
    }
  }
  if (mobs.size() < 1) {
    if (Play.clicked) {
      if (w%2 ==0) {
        i = 0;
        x = 20;
        while (i<w/3) {
          mobs.add(new SpeedMob(x, 400, 1, 0));
          x = x-100;
          i++;
        }
      }
      if (w%1 ==0) {
        i = -1;
        while (i < w) {
          mobs.add(new Mob(x, 400, 1, 0));
          x = x-50;
          i++;
        }
      }
      if (w%3==0) {
        i=0;
        x=0;
        while (i<w/3) {
          mobs.add(new HealthMob(x, 400, 1, 0));
          x = x-100;
          i++;
        }
      }
      w++;
    }
  }
}

boolean mobOnMap1() {
  return  
    mouseX > 0   && mouseX < 150 && mouseY > 360 && mouseY < 440  || // 1
    mouseX > 110 && mouseX < 190 && mouseY > 400 && mouseY < 700  || // 2
    mouseX > 150 && mouseX < 300 && mouseY > 660 && mouseY < 740  || // 3
    mouseX > 260 && mouseX < 340 && mouseY > 100 && mouseY < 700  || // 4
    mouseX > 300 && mouseX < 450 && mouseY > 60  && mouseY < 140  || // 5
    mouseX > 410 && mouseX < 490 && mouseY > 100 && mouseY < 700  || // 6
    mouseX > 450 && mouseX < 600 && mouseY > 660 && mouseY < 740  || // 7
    mouseX > 560 && mouseX < 640 && mouseY > 100 && mouseY < 700  || // 8
    mouseX > 600 && mouseX < 750 && mouseY > 60  && mouseY < 140  || // 9
    mouseX > 710 && mouseX < 790 && mouseY > 100 && mouseY < 1000 || // 10

    mouseX > 850; // box
}

boolean mobOnMap2() {
  return 
    mouseX > 0   && mouseX < 200 && mouseY > 360 && mouseY < 440 || //1
    mouseX > 160 && mouseX < 240 && mouseY > 400 && mouseY < 200 || //2
    mouseX > 200 && mouseX < 400 && mouseY > 160 && mouseY < 240 || //3
    mouseX > 360 && mouseX < 440 && mouseY > 200 && mouseY < 600 || //4
    mouseX > 300 && mouseX < 400 && mouseY > 560 && mouseY < 640 || //5
    mouseX > 260 && mouseX < 340 && mouseY > 500 && mouseY < 600 || //6
    mouseX > 300 && mouseX < 500 && mouseY > 460 && mouseY < 540 || //7
    mouseX > 460 && mouseX < 540 && mouseY > 400 && mouseY < 500 || //8
    mouseX > 500 && mouseX < 840 && mouseY > 360 && mouseY < 440 || //9


    mouseX > 850; // box
}

void map1() {
  line(0, 400, 150, 400);
  line(150, 400, 150, 700);
  line(150, 700, 300, 700);
  line(300, 700, 300, 100);
  line(300, 100, 450, 100);
  line(450, 100, 450, 700);
  line(450, 700, 600, 700);
  line(600, 700, 600, 100);
  line(600, 100, 750, 100);
  line(750, 100, 750, 1000);
}

void map2() {
  line(0, 400, 200, 400);
  line(200, 400, 200, 200);
  line(200, 200, 400, 200);
  line(400, 200, 400, 600);
  line(400, 600, 300, 600);
  line(300, 600, 300, 500);
  line(300, 500, 500, 500);
  line(500, 500, 500, 400);
  line(500, 400, 840, 400);
}
