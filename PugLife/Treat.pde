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
<<<<<<< HEAD
  /* for(int i = 0; i < width; i++){  
   float x = random(width);
   float y = random(height); 
    imageMode(CENTER); 
    image(treats, x, y);
    
   }*/
   image(treats, x, y);
    if (p.getXPos() == t.getXPos() && p.getYPos() == t.getYPos())
  {
    tint(#ffffff, 0.0); 
    
  }
    
=======
    isEaten = eatenVal; 
  }
  
  void display()
  {  
    imageMode(CENTER); 
    image(treats, x, y);
>>>>>>> 35c90b2a6ad90da8007db581105cc35838779e75
  }
  }