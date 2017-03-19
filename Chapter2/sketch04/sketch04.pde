size(960, 540);
pixelDensity(displayDensity());
background(220);

// 全ての角が半径30pxの角丸にする
rect(240, 170, 200, 200, 30);
// 時計回りに、半径10px、20px、30px、40pxの角丸にする
rect(520, 170, 200, 200, 10, 20, 30, 40);
saveFrame("sketch04.jpg");
