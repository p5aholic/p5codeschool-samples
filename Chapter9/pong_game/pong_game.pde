HitBar hitBar = null;

final int[] white = { 255, 255, 255 };
final int[] black = { 12, 12, 12 };
final int[] blue = { 0, 0, 255 };
final int[] red = { 255, 0, 0 };
final int[] green = { 0, 255, 0 };
final int[] brown = { 103, 67, 45 };

boolean isFinished = false;
boolean isFinishOnHitWall = true;

float x = 100, y = 150, r = 5;
float dx = 3;
float dy = 3;
//float speedY = (float) (2 * (Math.random() - 0.5f));

float playerX = 0, playerY = 0, racketSize = 50;
boolean playerOperationWithKey = false;
boolean movePlayerRacketUp = false, movePlayerRacketDown = false;

float enemyX = 0, enemyY = 0;
boolean moveEnemyRacketUp = false, moveEnemyRacketDown = false;

int coolTime = (int) (10 / dx + 5);
int coolTimeCount = 0;
boolean coolTimeMode = false;

public void settings() {
  size(600, 600);
}

public void setup() {
  hitBar = new HitBar();

  background(244);

  playerX = 20;
  enemyX = width - 20;
  playerY = enemyY = height / 2;
}

public void draw() {
  if (isFinished) {
    callOnFinished();
    return;
  }

  background(244);

  // 円移動処理
  x += dx;
  y += dy;

  if (playerOperationWithKey) {
    // 我移動処理
    if (movePlayerRacketUp && isInsideRacketRangeUp(playerY)) {
      playerY -= 5;
    }
    if (movePlayerRacketDown && isInsideRacketRangeDown(playerY)) {
      playerY += 5;
    }
  } else {
//    playerX = mouseX; // 自由自在に操作可能版
    playerY = mouseY;
  }

  // 敵移動処理
  if (moveEnemyRacketUp && isInsideRacketRangeUp(enemyY)) {
    enemyY -= 5;
  }
  if (moveEnemyRacketDown && isInsideRacketRangeDown(enemyY)) {
    enemyY += 5;
  }

  line(playerX, playerY - racketSize, playerX, playerY + racketSize);
  line(enemyX, enemyY - racketSize, enemyX, enemyY + racketSize);

  // 横壁判定
  if (isOutsideWallPlayer()) {
    hitWallPlayer();
  } else if (isOutsideWallEnemy()) {
    hitWallEnemy();
  }
  hitBar.callDrawHitBarPlayer();
  hitBar.callDrawHitBarEnemy();

  // 上下判定
  if (isOutsideWallUp() || isOutsideWallDown()) {
    dy = -dy;
  }

  // Racket判定
  if (coolTimeMode) {
    coolTimeCount -= 1;
    if (coolTimeCount <= 0) {
      coolTimeMode = false;
    }
  } else if (isRacketInsideTheBall(playerX, playerY) || isRacketInsideTheBall(enemyX, enemyY)) {
    dx = -dx;
    coolTimeMode = true;
    coolTimeCount = coolTime;
    circleSpeedUp();
  }

  strokeWeight(1);
  fill(white);
  circle(x, y, r * 2);
}

private boolean isInsideRacketRangeDown(float playerY) {
  return height >= playerY + racketSize;
}

private boolean isInsideRacketRangeUp(float racketY) {
  return 0 <= racketY - racketSize;
}

private boolean isOutsideWallDown() {
  return y + r >= height;
}

private boolean isOutsideWallUp() {
  return y - r < 0;
}

private void circleSpeedUp() {
  dx = dx * 1.1f;
  dy = dy * 1.1f;
}

private boolean isOutsideWallEnemy() {
  return x + r >= width;
}

private boolean isOutsideWallPlayer() {
  return x - r <= 0;
}

private void hitWallEnemy() {
  dx = -dx;
  hitBar.startHitBarEnemy();
  if (isFinishOnHitWall) {
    finish();
  }
}

private void hitWallPlayer() {
  dx = -dx;
  hitBar.startHitBarPlayer();
  if (isFinishOnHitWall) {
    finish();
  }
}

private void finish() {
  isFinished = true;
}

private void callOnFinished() {
  textSize(40);
  fill(black);
  textAlign(CENTER);
  text("Finished!", width / 2, height / 2);
}

private boolean isRacketInsideTheBall(float RacketCenterX, float RacketCenterY) {
  return ((x - r <= RacketCenterX && RacketCenterX <= x + r)
      && (RacketCenterY - racketSize <= y + r
          && y - r <= RacketCenterY + racketSize));
}

public void keyPressed() {
  switch (key) {
  case 'w':
    movePlayerRacketUp = true;
    break;
  case 's':
    movePlayerRacketDown = true;
    break;
  case 'p':
    playerOperationWithKey = !playerOperationWithKey;
    break;
  }

  switch (keyCode) {
  case UP:
    moveEnemyRacketUp = true;
    break;
  case DOWN:
    moveEnemyRacketDown = true;
    break;
  }
}

public void keyReleased() {
  moveEnemyRacketUp = false;
  moveEnemyRacketDown = false;

  movePlayerRacketUp = false;
  movePlayerRacketDown = false;
}

void fill(int[] colorValue) {
  fill(colorValue[0], colorValue[1], colorValue[2]);
}

void stroke(int[] colorValue) {
  stroke(colorValue[0], colorValue[1], colorValue[2]);
}

private class HitBar {
  int hitBarEnemyCount = 0; // s
  final int hitBarEnemyDrawTime = 15;

  int hitBarPlayerCount = 0; // s
  final int hitBarPlayerDrawTime = 15;

  /**
   * HitBarEnemyのカウントをスタートします。
   */
  private void startHitBarEnemy() {
    hitBarEnemyCount += hitBarEnemyDrawTime;
  }

  /**
   * 描画するべき状態にあるとき、HitBarEnemyを起動します。
   */
  private void callDrawHitBarEnemy() {
    if (hitBarEnemyCount > 0) {
      drawHitBarEnemy();
      hitBarEnemyCount -= 1;
    }
  }

  /**
   * 数秒間、HitBarフラッシュを表示します。(Enemy)
   */
  private void drawHitBarEnemy() {
    strokeWeight(0);
    fill(red);
    rect(width - 2, 0, 2, height);
  }

  /**
   * HitBarPlayerのカウントをスタートします。
   */
  private void startHitBarPlayer() {
    hitBarPlayerCount += hitBarPlayerDrawTime;
  }

  /**
   * 描画するべき状態にあるとき、HitBarPlayerを起動します。
   */
  private void callDrawHitBarPlayer() {
    if (hitBarPlayerCount > 0) {
      drawHitBarPlayer();
      hitBarPlayerCount -= 1;
    }
  }

  /**
   * 数秒間、HitBarフラッシュを表示します。(Player)
   */
  private void drawHitBarPlayer() {
    strokeWeight(0);
    fill(blue);
    rect(0, 0, 2, height);
  }
}
