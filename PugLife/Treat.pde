//REMEMBER TO CREATE A GRID W/ Width of Maze Bars, to spread the treats across!!! 

//=========Treat Class=======
class Treat {
  float start_x = random(10,990); 
  float start_y  = random(10,640); 
  float x, y; 
  
  Treat()
  {
    x = start_x; 
    y = start_y;
    isEaten = false; 
  }
  
   float getXPos()
  {
    return x;
  }
  
  float getYPos()
  { 
    return y; 
  }
  
  boolean getEaten()
  {
    return isEaten; 
  }
  
  void setEaten(boolean eatenVal)
  {
    isEaten = eatenVal; 
  }
  
  void display()
  {  
    imageMode(CENTER); 
    image(treats, x, y);
  }
}