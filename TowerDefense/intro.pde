//This function draws the INTRO screen.

void intro() {
  myGifs[0].show();
  start.show();
  textSize(100);
  fill(black);
  text("Tower Defense",500,200);
  if (start.clicked) {
    mode = MAPS;
  }
}
