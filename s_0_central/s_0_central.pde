import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int OPTIONS = 5;

//paddles and ball
float leftx, lefty, leftd, rightx, righty, rightd;
float ballx, bally, balld;
float vx, vy;

//speed control slider variable
float sliderX;
float speed;

boolean AI;
boolean optionsMode;

PFont gameFont;

//scoring
int leftscore, rightscore, timer;

//movement
boolean wkey, skey, upkey, downkey;

Minim minim;
AudioPlayer left, right, score, intro, wall, clap;

void setup() {
  size(800, 600);
  
  mode = INTRO;
  //mode = GAMEOVER;
  gameFont = createFont("game_over.ttf", 100);
  //initialize variables
  //paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightx = width;
  righty = height/2;
  rightd = 200;
  //ball
  ballx = width/2;
  bally = height/2;
  balld = 80;
  vx = random(-10, 10);
  vy = random(-10, 10);
  //movement
  wkey = skey = upkey = downkey = false;
  //scoring
  leftscore = 0;
  rightscore = 0;
  timer = 100;
  //AI player
  AI = false;
  //options placement
  optionsMode = false;
  //speed control slider initialize
  sliderX = 340;
  speed = 4;
  
  //audio
  minim = new Minim(this);
  score = minim.loadFile("score.wav");
  intro = minim.loadFile("intro.wav");
  right = minim.loadFile("rightpaddle.wav");
  left = minim.loadFile("leftpaddle.wav");
  clap = minim.loadFile("clapping.wav");
  wall = minim.loadFile("wall.wav");
}

void draw() {
  if(mode == INTRO) {
    intro();
  } else if(mode == GAME) {
    game();
  } else if(mode == PAUSE) {
    pause();
  } else if(mode == GAMEOVER) {
    gameOver();
  } else if(mode == OPTIONS) {
    options();
  } else {
    println("Error: Mode = " + mode);
  }
}

void tactileRect(int x, int y, int w, int h) {
  if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(150);
    fill(255);
  } else {
    stroke(0);
    fill(150);
  }
}

void controlSlider() {
  if(mouseX > 340 && mouseX < 470 && mouseY > 250 && mouseY < 270) {
    sliderX = mouseX;
  }
  speed = map(sliderX, 340, 470, 5, 15);
}
