class Branch
{
  PVector position;
  int level;
  float radius;
  float distance;
  float angle;
  
  Branch parent;
  ArrayList<Branch> children = new ArrayList<Branch>();
  
  Branch(PVector p, int l, float d, float r, float a)
  {
    position = p;
    level = l;
    distance = d;
    radius = r;
    
    angle = a;
    angle += (noise(noise) - .5) * noiseScale * (.15 + .85 * ((float)level / (float)maxLevel)); //Changes how much the angle change depends on the level
    noise += noiseChange;
    
    if(level < maxLevel)
    {      
      for(int i = 0; i < 2; i++)
      { 
        PVector addVector = new PVector(cos(radians(angle)) * distance, sin(radians(angle)) * distance);
        
        Branch child = new Branch( PVector.add(position, addVector),  level+1,  distance * distanceScale, radius * radiusScale, 225 + i * 90); 
        child.parent = this;
        children.add(child);
      }
    }
  }
  
  void display()
  {
    
    if(level != 0) 
    {
      beginShape();
      vertex(parent.position.x + parent.radius * cos(radians(angle - 90)), parent.position.y + parent.radius * sin(radians(angle - 90)));
      vertex(position.x + radius * cos(radians(angle - 90)), position.y + radius * sin(radians(angle - 90)));
      endShape();
    }
    
    for(Branch b : children)
    {
      b.display();  
    }
  }
}