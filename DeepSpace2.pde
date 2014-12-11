/*DivineMaloney
 Project 2
 https://www.youtube.com/watch?v=a-Ht7d-tECY
 GitHub url https://github.com/greyfrog/Music-Visualization/blob/master/MusicViz.pde
 Abhinav KR Interaction Designer
 modified by Divine Maloney
 */

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;

int amount = 500;
int[] x = new int[amount];
int[] y = new int[amount];
int[] z = new int[amount];
int[] q = new int[amount];
int[] w = new int[amount];
int[] e = new int[amount];
int r = 200;
float rad = 100;
float X;
float Y;
float Col;
float Size;

void setup() {

  //size(displayWidth, displayHeight);
  size(1200, 800, P3D);
  minim = new Minim(this);
 player = minim.loadFile("DivineProject2.aiff");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
  //player.play();
  background(-1);
  noCursor();
 
}
void draw() {
{
    for (int i = 0; i<amount; i++) {
      x[i] = int(random(-350, 350));
      y[i] = int(random(-350, 350));
      z[i] = int(random(-350, 350));
      q[i] = int(random(-350, 350));
      w[i] = int(random(-350, 350));
      e[i] = int(random(-350, 350));
    }
  }
  X = random(1200);
  Y = random(800);
  Size = random(5, 5);
  fill(255);
  noStroke();
  ellipse(X, Y, Size, Size);

  float t = map(mouseX, 0, width, 0, 1);
  beat.detect(player.mix);
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  //rotateY(frameCount / 100.0);
  //rotateX(frameCount / 100.0);
  //fill( random(255), random(255), random(255), random(255));
  
  if (beat.isOnset()) rad = rad*0.9;
  else rad = 150;
  //rect(0, 0, 2*rad, 2*rad);
  stroke(-1, 50);
  int bsize = player.bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  {
    float x = (r)*cos(i*2*PI/2)*2;
    float y = (r)*sin(i*2*PI/2)*2;
    float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);

    ellipse(x, y, x2, y2);
    rect(x, y, x2, y2);
    rect(-80, 0, 150, 150);
    
  }
   
}
