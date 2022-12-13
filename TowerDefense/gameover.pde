//This function draws the GAMEOVER screen.

void gameOver() {
  background(black);
  textSize(120);
  stroke(black);
  fill(orange);
  text("GAMEOVER", width/2, height/2-100);

  Restart.show();
  
  if (Restart.clicked) {
    setup();
  }
}
