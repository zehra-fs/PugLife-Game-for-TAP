//===================ENEMY CLASS========= //<>// //<>// //<>// //<>//
class Enemy 
{
  float x, y; 
  int start_x = 200;
  int start_y = 528; 
  int type; //If we have time to make more than one kind of enemy 
  int manSpeed = 1;
  boolean isStopped = false; 
  int count; 

  Enemy()
  {
    reset();
  }

  void reset()
  {
    x = start_x; 
    y = start_y;
  }

  void move() 
  { 
    moveHoriz();
  }

  // movement 

  void moveHoriz()
  {
     color leftColor = get((int(x)-(oldman.width/2 + manSpeed)), int(y)); 
     color rightColor = get((int(x) + (oldman.width/2) + manSpeed), int(y));
   
    
    if (leftColor == wallColor ) count = 1; 
    if (rightColor == wallColor) count = 0;  //<>//
   
      if (count == 1) x++; 
      else if (count == 0) x--;  //<>//
      
   /* boolean goRight = false, goLeft = false; 
    color leftColor = get((int(x)-(oldman.width/2 + manSpeed)), int(x)); 
    color rightColor = get((int(x) + (oldman.width/2+1) + manSpeed), int(y));
    x--;
    
    if (leftColor != wallColor && rightColor == wallColor)
    { 
      while (leftColor != wallColor) x--; 
   
    }
    
    else if (leftColor == wallColor && rightColor != wallColor) 
    { 
       while (rightColor != wallColor) x++; 
    }
  */ 
   
    
   
  }
  void moveLeft() 
  {
    color leftColor = get((int(x)-(oldman.width/2 + manSpeed)), int(x)); 
    
    if (leftColor != wallColor && count == 0) 
    {
      x--;
   //   d = 1; 
     // isStopped = false;
    } 
    
    else 
   {
     
   }

    
  }

  void moveRight() 
  {
    color rightColor = get((int(x) + (oldman.width/2+1) + manSpeed), int(y)); 
    if (rightColor != wallColor) 
    {
      x++; 
      isStopped = false;
    } 
    else 
    { 
      moveLeft(); 
    }
  }
  void moveUp()
  {
    color upColor = get(int(x), (int(y)-(oldman.width/2 + manSpeed))); 
    if (upColor != wallColor)
    {
      isStopped = false;
      y--;
    } else isStopped = true;
  }
  void moveDown() 
  {
    color downColor = get(int(x), (int(y) + (oldman.width/2+1) + manSpeed)); 
    if (downColor != wallColor) 
    { 

      isStopped = false;
      y++;
    } else isStopped = true;
  } 


  void display()
  {
    imageMode(CENTER); 
    image(oldman, x, y);
  }
  //Keeps enemies from going off the screen
  void confineToEdges() 
  {
    x = constrain(x, 5, 990);
    y = constrain(y, 5, 640);
  }
}