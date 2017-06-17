void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  // 原点を画面中心に移動
  translate(width/2, height/2);
  // 原点に円を描画
  ellipse(0, 0, 150, 150);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("sketch04.jpg");
  }
}
