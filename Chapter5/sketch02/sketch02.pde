void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  background(255);
  strokeWeight(10);
  stroke(0, 50);
}

void draw() {
  /* １フレーム前のマウスの座標から
   現在のマウスの座標まで線を引く */
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("sketch02.jpg");
  } else if (key == ' ') {
    background(255);
  }
}
