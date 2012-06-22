
import processing.pdf.*;

float x, y, z;

color[]palette = {
  #0095a8, #00616f, #333333, #666666, #999999, #CCCCCC
};

color[] pickedColors;

boolean paused = false;
boolean record = false;

int numAssets = 144;
int startX = -300;
int startY = -350;
int Xspacing = 50;
int Yspacing = 50;
int gridCols= 12;

void setup() {
  size(900, 900);
  smooth();
  
  pickedColors= new color[numAssets];
  
  for (int j=0; j<numAssets; j++) {
    pickedColors[j] = palette[(int)random(palette.length)];
  }
}

void draw() {

  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  background(#ECECEC);

  for (int i=0; i<numAssets; i++) {
    int row = floor(i / gridCols);
    int col = i % gridCols;

    // find x and y pos
    x = startX + (col * Xspacing);
    y = startY + (row * Yspacing);

    stroke(#FF3300);
    fill( pickedColors[i] );
    ellipse(x + xn(), y + yn(), 1 + sn(), 1 + sn());
  }
  
  z++;

  if (record) {
    endRecord();
    record = false;
  }
  
}





