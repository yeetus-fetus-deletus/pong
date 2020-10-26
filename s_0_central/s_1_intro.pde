void intro() {
  intro.play();
  optionsMode = false;
  
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  textFont(gameFont);
  textSize(400);
  text("PONG", 400, 150);
  
  //start button
  fill(150);
  tactileRect(320, 350, 160, 80);
  rect(320, 350, 160, 80);
  textSize(100);
  fill(0);
  text("START", 400, 380);
  
  //options button
  fill(150);
  tactileRect(320, 450, 160, 80);
  rect(320, 450, 160, 80);
  textSize(80);
  fill(0);
  text("OPTIONS", 400, 480);
  
}

void introClicks() {
  if(mouseX > 320 && mouseX < 480 && mouseY > 350 && mouseY < 430) {
    mode = GAME;
    intro.pause();
    leftscore = 0;
    rightscore = 0;
    lefty = height/2;
    righty = height/2;
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  if(mouseX > 320 && mouseX < 480 && mouseY > 450 && mouseY < 530) {
    mode = OPTIONS;
  }
  
}
