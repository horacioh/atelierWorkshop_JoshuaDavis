
float x, y;

color[]palette = {
  #0095a8, #00616f, #333333, #666666, #999999, #CCCCCC
};

color[] pickedColors;

int numAssets = 72;
int startX = 50;
int startY = 50;
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
  background(#ECECEC);

  for (int i=0; i<numAssets; i++) {
    int row = floor(i / gridCols);
    int col = i % gridCols;

    // find x and y pos
    x = startX + (col * Xspacing);
    y = startY + (row * Yspacing);

    stroke(#FF3300);
    fill( pickedColors[i] );
    ellipse(x, y, 49, 49);
  }
  
}


