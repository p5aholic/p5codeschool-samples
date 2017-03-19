// プログラム開始時に一度だけ実行される処理
void setup() {
  size(960, 540);  // 画面サイズを設定
  pixelDensity(displayDensity());
  background(255); // 背景色を設定
}

// setup()実行後に繰り返し実行される処理
void draw() {
  // 図形の輪郭線を消す
  noStroke();
  // 白黒のランダムな色を設定
  fill(random(255));
  // マウスの位置にランダムな大きさの楕円を描く
  ellipse(mouseX, mouseY, random(50), random(50));
}

void keyPressed() {
  if (key == 's') {
    saveFrame("aboutp5.jpg");
  } else if (key == ' ') {
    background(255);
  }
}
