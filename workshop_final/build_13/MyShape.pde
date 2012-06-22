class MyShape {

  float _x, _y, _z;
  int ranNum;
  RShape curSVG;

  RShape[] _curSVG;
  color[] myStyles;

  MyShape(float x, float y) {
    _x = x;
    _y = y;
    
    ranNum = (int)random(100) % imgList.size();    
    curSVG = (RShape)imgList.get(ranNum);

    int numChildren = curSVG.countChildren();

    _curSVG = new RShape[numChildren];
    myStyles = new color[numChildren];

    for (int j=0; j<numChildren; j++) {
      _curSVG[j] = curSVG.children[j];
      myStyles[j] = palette[(int)random(palette.length)];
    }
    
    curSVG.rotate(90);

  }

  void display() {

    for ( int i = 0; i < _curSVG.length; i++) {
      RStyle style = _curSVG[i].getStyle();
      style.strokeColor = #FF3300;
      //style.stroke = false;
      style.fillColor = myStyles[i];
    }

    RG.shape(curSVG, _x + xn(), _y + yn(), 1 + sn(), 1 + sn() );

    _z++;
  }

  float xn() {
    return noise(_x * 0.001, _y * 0.001, _z * 0.009) * 900;
  }

  float yn() {
    return noise(_x * 0.001, _y * 0.001, _z * 0.005) * 1100;
  }

  float sn() {
    return noise(_x * 0.1, _y * 0.1, _z * 0.03) * 200;
  }
}

