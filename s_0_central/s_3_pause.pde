void pause() {
  fill(150);
  stroke(0);
  strokeWeight(1);
  tactileRect(760, 10, 30, 30);
  rect(760, 10, 30, 30);
  stroke(0);
  fill(0);
  triangle(769, 18, 769, 32, 781, 25);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(300);
  fill(62, 157, 48);
  text("PAUSE", width/2, height/4);
  
  fill(150);
  stroke(255);
  strokeWeight(2);
  textSize(90);
  tactileRect(340, 470, 120, 60);
  rect(340, 470, 120, 60);
  fill(0);
  text("EXIT", 400, 490);
  
  if(mouseX > 760 && mouseX < 790 && mouseY > 10 && mouseY < 40) {
    stroke(255);
  }
  
}

void pauseClicks() {
  if(mouseX > 760 && mouseX < 790 && mouseY > 10 && mouseY < 40) {
    mode = GAME;
  }
  if(mouseX > 340 && mouseX < 460 && mouseY > 470 && mouseY < 530) {
    mode = INTRO;
    intro.rewind();
  }
  
}
