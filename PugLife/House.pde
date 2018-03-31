class House
{
  float start_x = 950; 
  float start_y = 600; 
  float x, y; 

  //function to create a new house
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

  //displays the house on the game
  void display()
  {
    imageMode(CENTER); 
    image(house, x, y);
    //if dog has collected all the treats, displays a different house image
    if (treatsEatenList.size() == treatNumber)
    {  
      image(house1, x, y);
    }
  }
}