class Sniper {
  float x, y;
  int cooldown, threshold;
  int towerMode, w;
  float count, i;


  Sniper(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    count = 0;
    w = 100;
    i = 0;
  }
  void show() {
    count++;
    i++;
    stroke(orange, 80);
    strokeWeight(i);
    if (count <= 20 && i <= 20) {
      if (mobs.size()>-1) {
        line(x, y, mobs.get(0).x, mobs.get(0).y);
      }
    } else if (count == 80) {
      count = 0;
      i=0;
    }
  }
}
