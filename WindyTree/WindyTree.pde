// Editable Values
int maxLevel = 8;

float distanceScale = .6;
float radiusScale = .5;

float noiseScale = 120;
float noiseChange = .2;
float windSpeed = .0022;

float startingRadius = 20;
float startingDistance = 300;
float startingAngle = 270;
PVector startingPosition = new PVector(400, 750);


// Non-Editable Values
float noise;
float startingNoise = 0;


void setup()
{
  size(800, 800);  
  background(255);

  noise = startingNoise;
}

void draw()
{
  background(255);
  
  startingNoise += windSpeed;
  noise = startingNoise;
  Branch branch = new Branch(startingPosition, 0, startingDistance, startingRadius, startingAngle);
  branch.display();
}
