void keyPressed() {
  if (key == ' ') {
    if (!paused) {
      noLoop();
      paused = true;
    } else {
      loop();
      paused = false;
    }
  }

  if (key == 'r') {
    record = true;
    draw();
  }
  
  if (key == '+') {
    redraw();
  }
}
