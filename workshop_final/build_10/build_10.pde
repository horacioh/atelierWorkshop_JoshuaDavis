import processing.pdf.*;
import geomerative.*;

RShape curSVG;

float x, y, z;

boolean paused = false;
boolean record = false;

ArrayList<MyShape> ShapeList;

int numAssets = 144;
int startX = -300;
int startY = -350;
int Xspacing = 50;
int Yspacing = 50;
int gridCols= 12;

color[]palette = {
  #0095a8, #00616f, #333333, #666666, #999999, #CCCCCC
};

void setup() {
  RG.init(this);
  size(900, 900);
  background(#ECECEC);
  //smooth();
  
  ShapeList = new ArrayList<MyShape>();
  
  curSVG = RG.loadShape("smile.svg");
    
  for (int i=0; i<numAssets; i++) {
    int row = floor(i / gridCols); 
    int col = i % gridCols;

    // find x and y pos
    x = startX + (col * Xspacing);
    y = startY + (row * Yspacing);

    ShapeList.add( new MyShape(curSVG, x, y) );
  }
}

void draw() {
  
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  background(#ECECEC);
  
  for (MyShape p : ShapeList) {
    p.display();
  }
  
  if (record) {
    endRecord();
    record = false;
  }
}



