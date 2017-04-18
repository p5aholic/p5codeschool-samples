void setup() {
  size(960, 540, P3D);
  noStroke();
}

void draw() {
  background(0);

  // 環境光を置く
  ambientLight(30, 30, 30);

  if (keyPressed) {
    if (keyCode == LEFT) {
      // 白色の平行光源を右に置く
      directionalLight(255, 255, 255, 1, 0, 0);
    }
    if (keyCode == RIGHT) {
      // 白色の平行光源を左に置く
      directionalLight(255, 255, 255, -1, 0, 0);
    }
    if (keyCode == UP) {
      // 白色の平行光源を上に置く
      directionalLight(255, 255, 255, 0, 1, 0);
    }
    if (keyCode == DOWN) {
      // 白色の平行光源を下に置く
      directionalLight(255, 255, 255, 0, -1, 0);
    }
  }

  // 左の球体
  pushMatrix();
  translate(width/2-200, height/2, 0);
  sphere(60);
  popMatrix();
  // 真ん中の球体
  pushMatrix();
  translate(width/2, height/2, 0);
  sphere(60);
  popMatrix();
  // 右の球体
  pushMatrix();
  translate(width/2+200, height/2, 0);
  sphere(60);
  popMatrix();
}

void mousePressed() {
  saveFrame("sketch10.jpg");
}