interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  int shape, sides, num;
  Rock(float x, float y) {
    super(x, y);
    shape = (int) random(0, 4);
    sides = (int) random(3, 21);
    num = (int) random(-10, 11);
    fill(random(0,255), random(0,255), random(0,255));
  }

  void display() {
    rect(x,y,50,50);
    /*
    int sides = (int) random(3, 21);
    beginShape();
    for (int i = 0; i < sides; i++) {
      vertex(x+num,y+num);
    }
    endShape();
    */
  }
}

public class LivingRock extends Rock implements Moveable {
  int xinc;
  int yinc;
  LivingRock(float x, float y) {
    super(x, y);
    xinc = (int) random(-1, 2);
    yinc = (int) random(-1, 2);
  }
  void move() {   
    x += xinc;
    y += yinc;
    int switchy = (int) random(0, 100);
    
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    ellipse(x,y,50,50);
    ellipse(x-10, y-10, 20, 20);
    ellipse(x+10, y-10, 20, 20);
  }

  void move() {
<<<<<<< HEAD
    x += random(-2,2);
    y += random(-2,2);
=======
    x += (int)random(-1,2);
    y += (int)random(-1,2);
>>>>>>> d28f9bdd3b16710a9f78fc3c892ca3de1ec3c4bc
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}