size(960, 540);
pixelDensity(displayDensity());
background(220);

noStroke();
fill(0);
rectMode(CENTER);
rect(380, 170, 200, 200); // 黒色の円

fill(255);
rectMode(CORNER);
rect(380, 170, 200, 200); // 白色の円

fill(160);
rectMode(CORNERS);
rect(0, 0, 250, 150);     // 灰色の円
saveFrame("sketch09.jpg");
