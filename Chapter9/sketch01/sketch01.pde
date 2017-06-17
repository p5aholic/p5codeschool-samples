void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  background(255);
  noStroke();
  fill(0);
}

void draw() {
  // マウスが押されているとき
  if (mousePressed) {
    ellipse(mouseX, mouseY, random(50), random(50));
  }
}
