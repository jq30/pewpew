public class Bullet {
  float x, y, theta;
  boolean bounce;
  float speed = 1;

  Thing(float a, float b, float angle) {
    bounce = false;
    x = a;
    y = b;
    theta = angle;
  }

  void render() {
    ellipse(x, y, 5, 5);
  }

  void advance() {
    if (bounce) {
      y -= speed * Math.sin(theta);
      x -= speed * Math.cos(theta);
    } else {
      y += speed * Math.sin(theta);
      x += speed * Math.cos(theta);
    }

    if (onEdge()) {
      bounce = true;
    }
  }

  boolean onEdge() {
    return (x > 400 || y > 400 || x < 0 || y < 0);
  }
}
