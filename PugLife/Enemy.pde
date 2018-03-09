//===================ENEMY CLASS=========  //<>// //<>// //<>//
class Enemy 
{
  float x, y; 
  int start_x = 315;
  int start_y = 533; 
  int type; //If we have time to make more than one kind of enemy 
  int manSpeed = 1;


  Enemy()
  {
    reset();
  }

  void reset()
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
  
  void move() 
  { 
    moveVert();
  }

  // movement 

  void moveHoriz()
  {
    color leftColor = get((int(x)-(oldman.width/2 + manSpeed)), int(y)); 
    color rightColor = get((int(x) + (oldman.width/2) + manSpeed), int(y));


    if (leftColor == wallColor ) countH = 1; 
    if (rightColor == wallColor) countH = 0; 

    if (countH == 1) { 
      x++;
    } else if (countH == 0) x--;
  }

  void moveVert()
  {
    color upColor = get(int(x), (int(y)-(oldman.width/2 + manSpeed))); 
    color downColor = get(int(x), (int(y) + (oldman.width/2+1) + manSpeed)); 
    
    if (upColor == wallColor ) countV = 1; 
    if (downColor == wallColor) countV = 0; 

    if (countV == 1) 
    { 
      y++;
    } else if (countV == 0) y--;
  }
  
  


  void display()
  {
    imageMode(CENTER); 
    if (countH == 0) 
    {
      //scale(-1.0, 1.0);
      image(oldman, x, y);
    } else image(oldman2, x, y);
  }
  
  
  //Keeps enemies from going off the screen
  void confineToEdges() 
  {
    x = constrain(x, 5, 990);
    y = constrain(y, 5, 640);
  }
}