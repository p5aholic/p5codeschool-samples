size(960, 540);
pixelDensity(displayDensity());
background(255);

noStroke();
// 赤色の円
fill(255, 0, 0);
ellipse(160, 270, 200, 200);
// 緑色の円
fill(0, 255, 0);
ellipse(480, 270, 200, 200);
// 青色の円
fill(0, 0, 255);
ellipse(800, 270, 200, 200);
saveFrame("sketch01.jpg");
