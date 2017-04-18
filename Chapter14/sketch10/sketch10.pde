Ball b1, b2, b3;

void setup() {
  size(960, 540);

  b1 = new Ball();
  b2 = new Ball();
  b3 = new Ball();
}

void draw() {
  background(255);

  // ３つボールを動かす
  b1.update();
  b2.update();
  b3.update();
  // ３つのボールを描画する
  b1.display();
  b2.display();
  b3.display();
}

class Ball {
  // フィールド
  float x, y;   // 位置
  float vx, vy; // 速度
  int radius;   // 半径
  color c;      // 色

  // コンストラクタ
  Ball() {
    radius = (int)random(25, 50);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
    vx = random(-5, 5);
    vy = random(-5, 5);
    c = color(random(255), random(255), random(255), random(128, 255));
  }

  // 値の更新、当たり判定を行うupdateメソッド
  void update() {
    x += vx;
    y += vy;
    if (x-radius <= 0 || x+radius >= width) {
      vx *= -1;
    }
    if (y-radius <= 0 || y+radius >= height) {
      vy *= -1;
    }
  }

  // 図形の描画を行うdisplayメソッド
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, radius*2, radius*2);
  }
}

// b1に対して呼び出されたupdate関数
// void update() {
//   b1.x += b1.vx;
//   b1.y += b1.vy;
//   if (b1.x-b1.radius <= 0 || b1.x+b1.radius >= width) {
//     b1.vx *= -1;
//   }
//   if (b1.y-b1.radius <= 0 || b1.y+b1.radius >= height) {
//     b1.vy *= -1;
//   }
// }

// b2に対して呼び出されたupdate関数
// void update() {
//   b2.x += b2.vx;
//   b2.y += b2.vy;
//   if (b2.x-b2.radius <= 0 || b2.x+b2.radius >= width) {
//     b2.vx *= -1;
//   }
//   if (b2.y-b2.radius <= 0 || b2.y+b2.radius >= height) {
//     b2.vy *= -1;
//   }
// }
