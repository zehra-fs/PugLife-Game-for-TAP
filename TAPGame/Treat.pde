//REMEMBER TO CREATE A GRID W/ Width of Maze Bars, to spread the treats across!!! 

//=========Treat Class=======
class Treat {
  float start_x = random(100,600); 
  float start_y = random(100,600); 
  float x, y; 

  Treat()
  {
    x = start_x; 
    y = start_y;
  }
  void display()
  {
    /* for(int i = 0; i < 10; i++)
     { 
    float x = random(100, 500);
    float y = random(100, 500); */ 
    imageMode(CENTER); 
    image(treats, x, y);
  }
}