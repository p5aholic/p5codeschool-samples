size(960, 540);
pixelDensity(displayDensity());
background(220);

noStroke();
fill(0);
ellipseMode(RADIUS);
ellipse(480, 270, 150, 150); // 黒色の円

fill(255);
ellipseMode(CENTER);
ellipse(480, 270, 150, 150); // 白色の円

fill(60);
ellipseMode(CORNER);
ellipse(480, 270, 150, 150); // 暗い灰色の円

fill(195);
ellipseMode(CORNERS);
ellipse(0, 0, 300, 150);     // 明るい灰色の円
saveFrame("sketch08.jpg");
