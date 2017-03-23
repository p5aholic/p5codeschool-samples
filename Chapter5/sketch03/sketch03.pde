void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  strokeWeight(20);
  stroke(0);
  // フレームレートを15に変更
  frameRate(15);
}

void draw() {
  // 背景を初期化
  background(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("sketch03.jpg");
  } else if (key == ' ') {
    background(255);
  }
}
