class HealthMob extends Mob {

  HealthMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 90;
    hp = 250;
    w = 50;
    hpw = w;
    maxhp = hp;
    maxSpeed = 0.5;
    speed = 0.5;
  }
}
