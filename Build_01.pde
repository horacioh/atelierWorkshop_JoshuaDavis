
float x, y;

// number of assets that Im going to print
int numAssets = 72;

//start the grid here
int startX = 50;
int startY = 50;

//the space betwen each asset
int Xspacing = 50;
int Yspacing = 50;

//how many columns i want
int gridCols = 12;


void setup()
{
    //size of the canvas
    size(900,900);
    background(#ECECEC);
    smooth();
}

void draw()
{
    //to not get duplicate effect...
    background(#ECECEC);
    
    for (int i = 0 ; i < numAssets ; i++)
    {
        //println(i);
        //foor: devuelve el int del valor
        int row = floor( i/gridCols );
        //
        int col = i % gridCols;
        
        x = startX + (col * Xspacing);
        y = startY + (row * Yspacing);
        
        stroke(#FF3300);
        fill(#FFFFFF);
        ellipse(x,y,49 ,49);
        
    }
    
}
