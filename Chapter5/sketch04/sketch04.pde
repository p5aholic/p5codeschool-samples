void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  noStroke();
}

void draw() {
  background(0, frameCount % 256, frameCount % 256);
  ellipse(width/2, height/2, frameCount % 256, frameCount % 256);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("sketch04.jpg");
  } else if (key == ' ') {
    background(255);
  }
}
