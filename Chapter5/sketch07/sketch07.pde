void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  background(255);
  noStroke();
}

void draw() {
  // ランダムな色を指定
  fill(random(255), random(255), random(255), random(255));
  // マウスの位置にランダムな大きさの楕円を描く
  ellipse(mouseX, mouseY, random(80), random(80));
}

void keyPressed() {
  if (key == 's') {
    saveFrame("sketch07.jpg");
  } else if (key == ' ') {
    background(255);
  }
}
