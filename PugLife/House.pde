class House{
  
  float start_x = 950; 
  float start_y = 600; 
  float x, y; 
  
  House()
  {
    x = start_x; 
    y = start_y;
  }
  void display()
  {

  imageMode(CENTER); 
    image(house, x, y);
  }
}