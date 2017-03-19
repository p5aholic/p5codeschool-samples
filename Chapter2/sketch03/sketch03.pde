size(960, 540);
pixelDensity(displayDensity());
background(220);

arc(120, 270, 200, 200, radians(45), radians(315));
arc(360, 270, 200, 200, radians(45), radians(315), PIE);
arc(600, 270, 200, 200, radians(45), radians(315), OPEN);
arc(840, 270, 200, 200, radians(45), radians(315), CHORD);
saveFrame("sketch03.jpg");
