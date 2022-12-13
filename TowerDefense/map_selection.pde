void mapSelection() {
  background(blue);
  fill(white);
  stroke(white);
  count ++;
  if (count <= 20) {
    text("CHOOSE YOUR MAP", width/2, 200);
  } else if (count == 40) {
    count = 0;
  }
  Map1.show();
  Map2.show();
  if (Map1.clicked) {
    map = 0;
    nodes = map1nodes;
    mode = PLAY;
  }

  if (Map2.clicked) {
    map = 1;
    nodes = map2nodes;
    mode = PLAY;
  }
}
