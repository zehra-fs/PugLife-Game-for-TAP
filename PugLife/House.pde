class House{
  
  float start_x = 950; 
  float start_y = 600; 
  float x, y; 
  
  House()
  {
    x = start_x; 
    y = start_y;
  }
  
  float getY()
  {
    return y; 
     }

  float getX()
  {
    return x; 
  }
  void display()
  {

    imageMode(CENTER); 
    image(house, x, y);
    
     if (treatsEatenList.size() == treatNumber)
   {  
     image(house1, x, y); 
   }
    if((treatsEatenList.size() == treatNumber) && p.getYPos() <= y + 30 && p.getYPos() >= y - 30
        && p.getXPos() <= x + 30 && p.getXPos() >= x - 30 )
      {
        gameWon = true; 
       }
  }
}