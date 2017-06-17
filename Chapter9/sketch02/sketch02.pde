int x = 0; // 縦棒のx座標
int y = 0; // 横棒のy座標

void setup() {
  size(960, 540);
  pixelDensity(displayDensity());
  strokeWeight(5);
  stroke(0);
}

void draw() {
  background(255);

  if (mousePressed) {
    // 左ボタンが押されているとき
    if (mouseButton == LEFT) {
      x += 2;
    }
    // 右ボタンが押されているとき
    else if (mouseButton == RIGHT) {
      y += 2;
    }
  }
  // 縦棒
  line(x, 0, x, height);
  // 横棒
  line(0, y, width, y);
}
