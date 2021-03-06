//declare variables
float gravity;
int count = 30;
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
color[] cColor = new color[count];


void setup() {
  //set size of canvas
  size(800, 600);
  for(int i = 0; i < count; i++) {
    //initialize variables
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 80;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    cColor[i] = color(255);
  }
  gravity = 1;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for(int i = 0; i < count; i++) {
    fill(cColor[i]); //fill the circle color
    ellipse(x[i], y[i], diam[i], diam[i]);
  
    //add velocity
    velY[i] += gravity;
    
    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
    
    if(dist(x[i],y[i],mouseX, mouseY) <= diam[i]/2) { //if mouse is in the circle (if the distance between mouse and center is less than the radius)
      cColor[i] = color(random(255),random(255),random(255));
    }
    
    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]+gravity); //to make it avoid sinking since one frame is skipped
      //y[i] = height - diam[i];
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}