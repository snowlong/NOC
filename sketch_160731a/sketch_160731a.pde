Particle p;

void setup() {
  size(640, 340);
  p = new Particle(new PVector(width/2, 10));
}

void draw() {
  background(255);
  p.run();
  if(p.isDead()) {
    println("Particle is dead!");
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector accelaration;
  float   lifespan;
  
  Particle(PVector l) {
    accelaration = new PVector(0, 0.05);
    velocity =  new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 255;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    velocity.add(accelaration);
    location.add(velocity);
    lifespan -= 2;
  }
  
  void display() {
    stroke(0, lifespan);
    fill(0, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }
  
  boolean isDead() {
    if(lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
}
