int centerX = 300;
int centerY =300;
int secHand = 250;
int minHand = 200;
int hourHand = 150;
float x;
float y;
float angle;

void setup() {
  
  
  size(600, 600);
}

void draw () {
  
  stroke(255);
  background(0);
  float quarterCircle = PI/2;
  
  // for the ellipse  
  for (int i=1; i<=60; i++) {
    angle = i * PI / 30.0;
    float x = (centerX + cos(angle)* secHand);
    float y =(centerY + sin(angle)* secHand);
    if(i % 5 != 0) {
      point(x,y);
    }
    else {
      ellipse(x, y, 5, 5);
    }
  }
  
  // for second hand
  angle = ((2 * PI/60) * second()) - quarterCircle;
  x = centerX + secHand * cos(angle);
  y = centerY + secHand * sin(angle);
  stroke(255); 
  line(centerX, centerY , x, y);
  
  // for minute hand  
  angle = ((2 * PI/60) * minute()) - quarterCircle;
  x = centerX + minHand * cos(angle);
  y = centerY + minHand * sin(angle);
  stroke(255);
  line(centerX, centerY , x, y);
  
  // for hour hand  
 angle = ((2 * PI/12) * hour()) + ((2 * PI/720) * minute()) - quarterCircle ;
  x = centerX + hourHand * cos(angle);
  y = centerY + hourHand * sin(angle);
  stroke(255);
  line(centerX, centerY, x, y);
    
}
