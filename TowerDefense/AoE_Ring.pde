//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.
class AoE_Ring {

  float x, y;
  int cooldown, threshold;
  int towerMode, w;
  float count;

  AoE_Ring (float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    count = 0;
    w = 150;
  }
  void show() {
    count++;
    if (count <= 20) {
      stroke(255);
      fill(#F1F54F,60);
      circle(x, y, w);
    } else if (count == 80) {
      count =0;
    }
    fill(black);
  }


  void act() {
  }
}
