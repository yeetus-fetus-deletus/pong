void gameOver() {
  clap.play();
  optionsMode = true;
  
  background(200, 130, 60);
  fill(0);
  stroke(0);
  strokeWeight(10);
  line(width/2, 0, width/2, height);
  
  fill(255, 0, 0);
  stroke(255);
  strokeWeight(2);
  circle(0, height/2, 200);
  fill(0, 0, 255);
  circle(width, height/2, 200);
  fill(255);
  circle(width/2, height/2, 80);
  
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(250);
  if(leftscore > rightscore) {
    fill(255, 0, 0);
    text("RED WINS!", width/2, height/5);
  }
  if(leftscore < rightscore) {
    fill(0, 0, 255);
    text("BLUE WINS!", width/2, height/5);
  }
  
  textFont(gameFont);
  fill(150);
  tactileRect(50, 250, 200, 100);
  rect(50, 250, 200, 100);
  tactileRect(550, 250, 200, 100);
  rect(550, 250, 200, 100);
  tactileRect(340, 470, 120, 60);
  rect(340, 470, 120, 60);
  textSize(90);
  textAlign(CENTER, CENTER);
  fill(0);
  text("RESTART", 150, 290);
  text("OPTIONS", 650, 290);
  text("EXIT", 400, 490);
}

void gameOverClicks() {
  if(mouseX > 340 && mouseX < 460 && mouseY > 470 && mouseY < 530) {
    mode = INTRO;
    clap.pause();
    clap.rewind();
    intro.rewind();
  }
  if(mouseX > 550 && mouseX < 750 && mouseY > 250 && mouseY < 350) {
    mode = OPTIONS;
  }
  if(mouseX > 50 && mouseX < 250 && mouseY > 250 && mouseY < 350) {
    mode = GAME;
    leftscore = 0;
    rightscore = 0;
    lefty = height/2;
    righty = height/2;
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  
}
