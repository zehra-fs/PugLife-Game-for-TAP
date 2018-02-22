//===================ENEMY CLASS=========
class Enemy 
{
  float x, y; 
  int start_x = 300;
  int start_y = 849; 
  int type; //If we have time to make more than one kind of enemy 
  
  
  Enemy()
  {
    reset(); 
  }
  
  void reset()
  {
    x = start_x; 
    y = start_y; 
  }
  
  void move() //Edit after creating the maze to avoid collision
  {
    y--; 
  }
  
  void display()
  {
    imageMode(CENTER); 
    image(oldman, x,y); 
  }
  //Keeps enemies from going off the screen
  void confineToEdges() 
  {
    x = constrain(x, 5, 990);
    y = constrain(y, 5, 640);
  }
}