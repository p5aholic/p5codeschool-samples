size(960, 540);
pixelDensity(displayDensity());
background(220);

// 線：枠線のみ指定
stroke(30);
line(100, 100, 200, 440);

// 正円：枠線と内側を指定
stroke(30);
fill(255);
ellipse(300, 270, 200, 200);

// 正方形：枠線のみ指定
stroke(30);
noFill();
rect(420, 170, 200, 200);

// 正方形：内側のみ指定
noStroke();
fill(255);
rect(520, 200, 140, 140);
saveFrame("sketch05.jpg");
