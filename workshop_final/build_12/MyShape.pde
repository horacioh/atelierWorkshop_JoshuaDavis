class MyShape {

  float _x, _y, _z;
  RShape[] _curSVG;
  color[] myStyles;

  MyShape(RShape curSVG, float x, float y) {
    _x = x;
    _y = y;

    int numChildren = curSVG.countChildren();

    _curSVG = new RShape[numChildren];
    myStyles = new color[numChildren];

    for (int j=0; j<numChildren; j++) {
      _curSVG[j] = curSVG.children[j];
      myStyles[j] = palette[(int)random(palette.length)];
    }

    curSVG.rotate(45);
  }

  void display() {

    for ( int i = 0; i < _curSVG.length; i++) {
      RStyle style = _curSVG[i].getStyle();
      //style.strokeColor = #FF3300;
      style.stroke = false;
      style.fillColor = myStyles[i];
    }
    
    RG.shape(curSVG, _x + xn(), _y + yn(), 0 + sn(), 0 + sn() );

    _z++;
  }

  float xn() {
    return noise(_x * 0.2, _y * 0.2, _z * 0.02) * 100;
  }

  float yn() {
    return noise(_x * 0.2, _y * 0.2, _z * 0.02) * 100;
  }

  float sn() {
    return noise(_x * 0.005, _y * 0.005, _z * 0.02) * 200;
  }
}

