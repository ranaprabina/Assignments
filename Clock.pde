int cx, cy;
float Second_Hand;
float Minute_Hand;
float   Hour_Hand;
float Diameter;
int width = 640;
int height = 360;
void setup() {
  size(640, 360);
  stroke(255);
  int radius = min(width, height) / 2;
  Second_Hand = radius * 0.72;
  Minute_Hand = radius * 0.60;
  Hour_Hand = radius * 0.50;
  Diameter = radius * 1.8;
  cx = width / 2;
  cy = height / 2;
}
void draw() {
  background(0);
  fill(80);
  noStroke();
  ellipse(cx, cy, Diameter, Diameter);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * Second_Hand, cy + sin(s) * Second_Hand);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * Minute_Hand, cy + sin(m) * Minute_Hand);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) *   Hour_Hand, cy + sin(h) *   Hour_Hand);
   int hour = 3;
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x = cx + cos(angle) * Second_Hand;
    float y = cy + sin(angle) * Second_Hand;
    vertex(x, y);
    fill(255);
    text(hour, x, y);
    hour++;
    if(hour > 12){
      hour = 1;
    }
  }
  endShape();
}