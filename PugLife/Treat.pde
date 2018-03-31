class Treat {
  float x, y;  

  Treat(int this_x, int this_y)
  {
    x = this_x; 
    y = this_y;
  }

  float getXPos()
  {
    return x;
  }

  float getYPos()
  { 
    return y;
  }

  void display()
  {  

    imageMode(CENTER); 
    image(treats, x, y);
  }
}