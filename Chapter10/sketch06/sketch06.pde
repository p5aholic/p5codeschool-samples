size(960, 540);
pixelDensity(displayDensity());
background(255);
rectMode(CENTER);
noStroke();

// 原点を画面中心に移動
translate(width/2, height/2);

// 回転していない赤色の長方形
fill(255, 0, 0);
rect(0, 0, 500, 30);

// 30度回転した青色の長方形
rotate(radians(30));
fill(0, 255, 0);
rect(0, 0, 500, 30);

// 60度回転した青色の長方形
rotate(radians(30));
fill(0, 0, 255);
rect(0, 0, 500, 30);

saveFrame("sketch06.jpg");
