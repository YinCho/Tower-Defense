class SpeedMob extends Mob {
  
 SpeedMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 20;
    hp = 50;
    w = 50;
    hpw = w;
    maxhp = hp;
    maxSpeed = 3;
    speed = 3;
  }
  
  
}
