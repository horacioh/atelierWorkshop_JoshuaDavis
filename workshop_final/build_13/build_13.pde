import processing.pdf.*;
import geomerative.*;

//RShape curSVG;

ArrayList imgList;
RShape img1, img2, img3, img4, img5, img6;

float x, y, z;

boolean paused = false;
boolean record = false;

ArrayList<MyShape> ShapeList;

int numAssets = 140;
int startX = 450;
int startY = 450;
int Xspacing = 1;
int Yspacing = 1;
int gridCols= 12;
float o = 1.6180339887498;

color[]palette = {
  #0095a8, #00616f, #333333, #666666, #999999, #CCCCCC
};

void setup() {
  RG.init(this);
  size(900, 900);
  background(#ECECEC);
  //smooth();
  
//  img1 = RG.loadShape("myshape.svg");
//  img2 = RG.loadShape("art_02.svg");
//  img3 = RG.loadShape("art_03.svg");
//  img4 = RG.loadShape("art_04.svg");
//  img5 = RG.loadShape("art_05.svg");
//  img6 = RG.loadShape("art_06.svg");

  img1 = RG.loadShape("myshape.svg");
  img2 = RG.loadShape("myshape.svg");
  img3 = RG.loadShape("myshape.svg");
  img4 = RG.loadShape("myshape.svg");
  img5 = RG.loadShape("myshape.svg");
  img6 = RG.loadShape("myshape.svg");
  
  imgList = new ArrayList();
  imgList.add(img1);
  imgList.add(img2);
  imgList.add(img3);
  imgList.add(img4);
  imgList.add(img5);
  imgList.add(img6);
  
  ShapeList = new ArrayList<MyShape>();
      
  for (int i=0; i<numAssets; i++) {
    int row = floor(i / gridCols); 
    int col = i % gridCols;

    // find x and y pos
    //x = startX + (col * Xspacing);
    //y = startY + (row * Yspacing);
    
    x = startX + (cos(i*Xspacing) * (i*o));
    //println(cos(i*x_spacing));
    y = startY + (sin(i*Yspacing) * (i*o));
    
    ShapeList.add( new MyShape(x, y) );
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



