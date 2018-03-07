//===================ENEMY CLASS========= //<>// //<>// //<>// //<>//
class Enemy 
{
  float x, y; 
  int start_x = 40;
  int start_y = 528; 
  int type; //If we have time to make more than one kind of enemy 
  int manSpeed = 3;
  boolean isStopped = false; 
  int d = 1; 

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
    boolean goRight = false, goLeft = false; 
    color leftColor = get((int(x)-(oldman.width/2 + manSpeed)), int(x)); 
    color rightColor = get((int(x) + (oldman.width/2+1) + manSpeed), int(y));
    
    if (leftColor != wallColor && rightColor == wallColor)
    { 
     goLeft = true; 
     
    }
    else if (leftColor == wallColor && rightColor != wallColor) 
    { 
      goRight = true; 
    }
    else goLeft = true; 
    
    if (goLeft == true) x--; 
    else if (goRight == true) x++; 
  }
  void moveLeft() 
  {
    color leftColor = get((int(x)-(oldman.width/2 + manSpeed)), int(x)); 
    if (leftColor != wallColor) 
    {
      x--;
      d = 1; 
      isStopped = false;
    } 

    x++;
  }

  void moveRight() 
  {
    color rightColor = get((int(x) + (oldman.width/2+1) + manSpeed), int(y)); 
    if (rightColor == wallColor) 
    {
      moveLeft();
      isStopped = false;
    } else 
    {
      x++; 
      isStopped = true;
      //  d--;
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