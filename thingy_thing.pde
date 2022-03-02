import java.util.*;

Thing[] a;
List<Thing> list;

class Thing {
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

void setup() {
  size(400, 400);
  a = new Thing[8];
  //for (int i = 0; i < a.length; i++) {
  //  a[i] = new Thing(200, 200);
  //}

  list = new ArrayList<Thing>();
}


float iteration = 0;
//int[] angles = {0, 60, 120, 180, 240, 300};
int[] angles = {0, 120, 240};
void draw() {
  background(255, 255, 255);
  for (int i = 0; i < list.size(); i++) {
    list.get(i).advance();
    list.get(i).render();
  }

  for (int angle : angles) {
    if (iteration < 200)
    list.add(new Thing(200, 200, angle + iteration));
  }
  iteration += 2;

  System.out.println(list.size());
}
