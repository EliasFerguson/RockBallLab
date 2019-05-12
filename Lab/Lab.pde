PImage img, i1, i2, i3;
ArrayList<Collideable> ListOfCollideables = new ArrayList<Collideable>();
ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>();
ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();

interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

interface Collideable {
  boolean isTouching(Thing other);
}

abstract class Thing implements Displayable, Collideable {
  float x, y;//Position of the Thing
  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  float xcorCenter() {
    return x + 25;
  }
  float ycorCenter() {
    return y + 25;
  }
  boolean isTouching(Thing other) {
    if (dist(x, y, other.xcorCenter(), other.ycorCenter()) <= 50) {
      return true;
    }
    return false;
  }
  
  abstract void display();
}

class Rock extends Thing {
  int shape;
  Rock(float x, float y) {
    super(x, y);

    shape = (int) random(0, 10);
    /*
    Xnum = new float[] {x-25, random(x-1, x-25), x, random(x+1, x+25), x+25, random(x+1, x+25), x, random(x-1, x-25)};
    Ynum = new float[] {y, random(y-1, y-25), y-25, random(y-1, y-25), y, random(y+1, y+25), y+25, random(y+1, y+25)};
    */
    //fill(random(0,255), random(0,255), random(0,255));
    
  }

  void display() {
    /*
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
    */
    if (shape < 5) {image(i1,x,y,50,50);}
    //else if (shape >= 4 && shape < 8) {image(i2,x,y,50,50);}
    else {image(i3,x,y,50,50);}
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
    if (x < 50) xinc = 1;
    if (x > 950) xinc = -1;
    if (y < 50) yinc = 1;
    if (y > 750) yinc = -1;
    x += xinc;
    y += yinc;
    int switchy = (int) random(0, 25);
    if (switchy == 0) {
      int switcher = (int) random(0, 2);
      if (switcher == 0) xinc = (int) random(-1, 2);
      if (switcher == 1) yinc = (int) random(-1, 2);
    }
  }
  void display() {
    super.display();
    fill(255);
    ellipse(x + 20, y + 13, 6, 10);
    ellipse(x + 30, y + 13, 6, 10);
    fill(0);
    ellipse(x + 20, y + 13, 2, 4);
    ellipse(x + 30, y + 13, 2, 4);
  }
}

class Ball extends Thing implements Moveable {
  float xs, ys;
  boolean colliding = false;
  Ball(float x, float y) {
    super(x, y);
    xs = random(-10,10);
    ys = random(-10,10);
  }
  
  float xcorCenter() {
    return x;
  }
  float ycorCenter() {
    return y;
  }

  void display() {
    ellipse(x,y,50,50);
    //ellipse(x-10, y-10, 20, 20);
    //ellipse(x+10, y-10, 20, 20);
    //image(img, x, y, 50, 50);
  }

  void move() {
    x += xs;
    y += ys;
    for (Collideable c : ListOfCollideables) {
      if (c.isTouching(this)) {
        colliding = true;
      }
    }
  }
}
class BallA extends Ball {
   BallA(float x, float y){
     super(x,y);
   }
   
   void display() {
     if (colliding) {fill(255,0,0);}
     else {fill(0,0,255);}
     ellipse(x,y,50,50);
     colliding = false;
   }
   
   void move() {
     if(x > 970){
       xs = -xs;
     }
     if(x < 30){
       xs = -xs;
     }
     if(y > 770){
       ys = -ys;
     }
     if(y < 30){
       ys = -ys;
     }
     x += xs;
     y += ys;
     for (Collideable c : ListOfCollideables) {
      if (c.isTouching(this)) {
        colliding = true;
      }
    }
   }
}
 
class BallB extends Ball {
   BallB(float x, float y) {
     super(x,y);
   }
   
   void display() {
     fill(255, 255, 0);
     ellipse(x,y,50,50);
     if (colliding) {fill(255,0,0);}
     ellipse(x,y,25,25);
   }
   
   void move() {
     if(x > 970){
       xs = -xs;
     }
     if(x < 30){
       xs = -xs;
     }
     if(y > 770){
       ys = -ys;
     }
     if(y < 30){
       ys = -ys;
     }
     x += xs;
     y += ys;
     for (Collideable c : ListOfCollideables) {
      if (c.isTouching(this)) {
        colliding = true;
      }
    }
   }
}

/*DO NOT EDIT THE REST OF THIS */

void setup() {
  size(1000, 800);
  
  //img = loadImage("Soccer_ball.png");
  i1 = loadImage("generic rock.jpg");
  //i2 = loadImage("grafitti rock.jpg");
  i3 = loadImage("the rock.jpg");

  for (int i = 0; i < 5; i++) {
    Ball b = new BallA(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    ListOfCollideables.add(b);
  }
  for (int i = 0; i < 5; i++) {
    Ball b = new BallB(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    ListOfCollideables.add(b);
  }
  for (int i = 0; i < 10; i++) {
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
    ListOfCollideables.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
    ListOfCollideables.add(m);
  }
}
void draw() {
  background(255);
  
  //text(ListOfCollideables.size(),10,10);
  
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
