<<<<<<< HEAD
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
    if (switchy == 0) {
      int switcher = (int) random(0, 2);
      if (switcher == 0) xinc = (int) random(-1, 2);
      if (switcher == 1) yinc = (int) random(-1, 2);
    }
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
    x += random(-2,2);
    y += random(-2,2);
    x += (int)random(-1,2);
    y += (int)random(-1,2);
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
=======
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
  int shape, sides;
  float[] Xnum, Ynum;
  Rock(float x, float y) {
    super(x, y);
    shape = (int) random(0, 4);
    sides = (int) random(3, 21);
    
    Xnum = new float[] {x-25, random(x-1, x-25), x, random(x+1, x+25), x+25, random(x+1, x+25), x, random(x-1, x-25)};
    Ynum = new float[] {y, random(y-1, y-25), y-25, random(y-1, y-25), y, random(y+1, y+25), y+25, random(y+1, y+25)};
    
    fill(random(0,255), random(0,255), random(0,255));
  }

  void display() {
    if (shape == 0) {rect(x,y,50,50);}
    if (shape == 1) {triangle(x,y-25,x+25,y+25,x-25,y+25);}
    if (shape == 2) {ellipse(x,y,50,25);}
    if (shape == 3) {
      beginShape();
      for (int i = 0; i < 8; i++) {
        vertex(Xnum[i],Ynum[i]);
      }
      endShape(CLOSE);
    }
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
    x += random(-2,2);
    y += random(-2,2);
    x += (int)random(-1,2);
    y += (int)random(-1,2);
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
>>>>>>> 604ad6e5a1b32c0fc83d8373911b55e3da6b27ce
