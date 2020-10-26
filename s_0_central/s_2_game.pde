void game() {
  //setup
  background(200, 130, 60);
  fill(0);
  stroke(0);
  strokeWeight(10);
  line(width/2, 0, width/2, height);
  clap.pause();
  clap.rewind();
  
  //scoreboard
  textAlign(CENTER, CENTER);
  fill(255);
  textFont(gameFont);
  textSize(200);
  text(leftscore, 200, 100);
  text(rightscore, 600, 100);
  //text(timer, 400, 500);
  
  timer = timer - 1;
  
  
  //paddles
  stroke(255);
  strokeWeight(2);
  
  fill(255, 0, 0);
  circle(leftx, lefty, leftd);
  fill(0, 0, 255);
  circle(rightx, righty, rightd);
  
  //ball
  fill(255);
  circle(ballx, bally, balld);
  
  if(timer < 0) {
  ballx = ballx + vx;
  bally = bally + vy;
  }
  
  //out of bounds
  if(bally < 0 || bally > height) {
    wall.rewind();
    wall.play();
    wall.rewind();
    wall.play();
    wall.rewind();
    wall.play();
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  
  //wall bounce
  if(bally < balld/2 || bally > height-balld/2) {
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }
  
  //left paddle
  if(dist(leftx, lefty, ballx, bally) <= balld/2 + leftd/2) {
    vx = (ballx - leftx)/10;
    vy = (bally - lefty)/10;
    left.rewind();
    left.play();
  }
  
  //right paddle
  if(dist(rightx, righty, ballx, bally) <= balld/2 + leftd/2) {
    vx = (ballx - rightx)/10;
    vy = (bally - righty)/10;
    right.rewind();
    right.play();
  }
  
  //limit paddle movement
  if(lefty < 0) {
    lefty = 0;
  }
  if(lefty > height-0) {
    lefty = height-0;
  }
  if(righty < 0) {
    righty = 0;
  }
  if(righty > height-0) {
    righty = height-0;
  }
  
  //score
  if(ballx < -40) {
    rightscore++;
    score.rewind();
    score.play();
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  if(ballx > width+40) {
    leftscore++;
    score.rewind();
    score.play();
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  
  //movement
  if(wkey == true) lefty = lefty - speed;
  if(skey == true) lefty = lefty + speed;
  
  if(AI == false) {
    if(upkey == true) righty = righty - speed;
    if(downkey == true) righty = righty + speed;
  }
  
  //exit button
  fill(150);
  stroke(0);
  strokeWeight(1);
  tactileRect(760, 10, 30, 30);
  rect(760, 10, 30, 30);
  stroke(0);
  strokeWeight(3);
  fill(0);
  line(771, 17, 771, 33);
  line(779, 17, 779, 33);
  
  //game over
  if(leftscore >= 5) {
    mode = GAMEOVER;
  } else if(rightscore >= 5) {
    mode = GAMEOVER;
  }
    
  //AI player mode
  if(AI == true) {
    if(ballx >= 400) {
      if(bally < righty) {
        righty = righty - 7;
      }
      if(bally > righty) {
        righty = righty + 7;
      }
    }
  }
    
  if(mouseX > 760 && mouseX < 790 && mouseY > 10 && mouseY < 40) {
    stroke(255);
  }
}

void gameClicks() {
  if(mouseX > 760 && mouseX < 790 && mouseY > 10 && mouseY < 40) {
    mode = PAUSE;
  }
  
}
