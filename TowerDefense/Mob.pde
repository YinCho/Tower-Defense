//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d, hpw, w;
  float hp, maxhp, maxSpeed, speed;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 100;
    w = 50;
    hpw = w;
    maxhp = hp;
    maxSpeed = 1;
    speed = maxSpeed;
  }

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(200);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }

  void show() {
    rectMode(CENTER);
    fill(purple);
    strokeWeight(1);
    circle(x, y, d);
    healthbar();
  }

  void act() {
    slowReset++;

    if (slowReset >= 15) {
      slowReset = 0;
      speed = maxSpeed;
    }
    x = x + vx*speed;
    y = y + vy*speed;


    int i = 0;
    while (i< nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) <2 ) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
    i = 0;
    while (i<bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp-20;
        myBullet.hp = 0;
      }
      i++;
    }
    i = 0;
    if (y > height+50 | x > 800) {
      lives= lives - 1;
      mobs.remove(i);
    } else {
      i++;
    }
    i = 0;
    while (i< Rings.size()) {
      AoE_Ring myRing = Rings.get(i);
      if (dist(myRing.x, myRing.y, x, y) < d/2 + myRing.w/2) {
        hp = hp-2;
      }
      i++;
    }
    i = 0;
    while (i< snipers.size()) {
      Sniper mySniper = snipers.get(i);
      if (mobs.size() > 0) {
        if (mySniper.i == 19) {
          mobs.get(0).hp = mobs.get(0).hp-50;
          mySniper.i = 0;
        }
      }
      i++;
    }
    i = 0;
    while (i < slows.size()) {
      println(speed);
      SlowRing mySlow = slows.get(i);
      if (dist(mySlow.x, mySlow.y, x, y) < d/2 + mySlow.w/2) {
        speed = maxSpeed * 0.3;
      }
      i++;
    }
  }
}
