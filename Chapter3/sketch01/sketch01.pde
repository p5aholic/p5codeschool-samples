size(960, 300);
pixelDensity(displayDensity());
background(255);

noStroke();
// 赤色の円
fill(255, 0, 0);
ellipse(160, 150, 200, 200);
// 緑色の円
fill(0, 255, 0);
ellipse(480, 150, 200, 200);
// 青色の円
fill(0, 0, 255);
ellipse(800, 150, 200, 200);
saveFrame("sketch01.jpg");
