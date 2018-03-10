//REMEMBER TO CREATE A GRID W/ Width of Maze Bars, to spread the treats across!!! 

//=========Treat Class=======
class Treat {
   
  float x, y; 
  //color grass1 = color(114,224,58); 
  
  boolean isOkay = false; 
  
  Treat(int this_x, int this_y)
  {
   
      x = this_x; 
      y = this_y;
    

    isEaten = false;
  }
  
  boolean putHere()
  {
    start_x = random(10, 990); 
    start_y = random(10, 640); 
    spot = get(int(start_x), int(start_y)); 
    if (spot == grass2) 
    {
      return true;
    } else return false;
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