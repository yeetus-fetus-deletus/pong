void options() {
  //options box
  stroke(255);
  strokeWeight(3);
  fill(100);
  rect(100, 100, 600, 400);
  
  //close options button
  stroke(0);
  strokeWeight(1);
  fill(125);
  tactileRect(660, 110, 30, 30);
  rect(660, 110, 30, 30);
  stroke(0);
  strokeWeight(4);
  fill(0);
  line(668, 118, 682, 132);
  line(668, 132, 682, 118);
  
  //section title
  fill(0);
  textSize(30);
  textAlign(CENTER, CENTER);
  textFont(gameFont);
  text("OPTIONS", 400, 150);
  
  //controls
  strokeWeight(1);
  textSize(90);
  
  //speed control slider
  strokeWeight(5);
  stroke(0);
  line(350, 260, 480, 260);
  strokeWeight(3);
  stroke(150);
  fill(255);
  square(sliderX, 250, 20);
  strokeWeight(1);
  
  tactileRect(150, 350, 200, 100);
  rect(150, 350, 200, 100);
  fill(0);
  textSize(90);
  text("1 PLAYER", 250, 390);
  
  tactileRect(450, 350, 200, 100);
  rect(450, 350, 200, 100);
  fill(0);
  textSize(80);
  text("2 PLAYERS", 550, 390);
  
  //text display
  textSize(60);
  text("PLAYER SPEED :", 225, 250);
  text("PLAYER MODE :", 225, 310);
  
  if(AI == true) {
    stroke(100);
    fill(100);
    rect(325, 295, 175, 50);
    fill(0);
    textSize(60);
    text("1 PLAYER", 400, 310);
  }
  if(AI == false) {
    stroke(100);
    fill(100);
    rect(325, 295, 175, 50);
    fill(0);
    textSize(60);
    text("2 PLAYERS", 400, 310);
  }
  
}

void optionsClicks() {
  if(mouseX > 660 && mouseX < 690 && mouseY > 110 && mouseY < 140) {
    if(optionsMode == true) {
      mode = GAMEOVER;
    }
    if(optionsMode == false) {
      mode = INTRO;
    }
  }
  
  if(mouseX > 150 && mouseX < 350 && mouseY > 350 && mouseY < 450) {
    AI = true;
  }
  if(mouseX > 450 && mouseX < 650 && mouseY > 350 && mouseY < 450) {
    AI = false;
  }
  
  controlSlider();
}

void optionsDrag() {
  controlSlider();
}
