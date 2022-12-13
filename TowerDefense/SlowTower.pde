class SlowRing {

  float x, y;
  int cooldown, threshold;
  int towerMode, w;
  float count;

  SlowRing (float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    count = 0;
    w = 200;
  }

  void show() {
    count++;
    if (count <= 20) {
      stroke(255);
      fill(white, 60);
      circle(x, y, w);
    } else if (count == 80) {
      count =0;
    }
    fill(black);
  }
}
