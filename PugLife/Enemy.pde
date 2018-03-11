//===================ENEMY CLASS=========  //<>// //<>// //<>//
class Enemy 
{
  float x, y; 
  int enemyNum; 
  int type; //If we have time to make more than one kind of enemy 
        // Type 1: Side to Side 
        //Type 2: Up & Down 
  int manSpeed = 1;


  Enemy(int start_x, int start_y, int type1, int eNum)
  {
    x = start_x; 
    y = start_y;
    type = type1; 
    enemyNum = eNum; 
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
    if (type == 1) moveHoriz(); 
    if (type == 2) moveVert(); 
    
    if (p.getYPos() <= y + 30 && p.getYPos() >= y - 30
      && p.getXPos() <= x + 30 && p.getXPos() >= x - 30 )
      {
        gameOver = true;
        doomFx.play(); 
        enemyFx.play(); 
      }
  }

  // movement 

  void moveHoriz()
  {
    color leftColor = get((int(x)-(oldmanList[enemyNum].width/2 + manSpeed)), int(y)); 
    color rightColor = get((int(x) + (oldmanList[enemyNum].width/2) + manSpeed), int(y));


    if (leftColor == wallColor ) countH = 1; 
    if (rightColor == wallColor) countH = 0; 

    if (countH == 1) { 
      x++;
    } else if (countH == 0) x--;
  }

  void moveVert()
  {
    color upColor = get(int(x), (int(y)-(oldmanList[enemyNum].width/2 + manSpeed))); 
    color downColor = get(int(x), (int(y) + (oldmanList[enemyNum].width/2+1) + manSpeed)); 
    
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
      image(oldmanList[enemyNum], x, y);
    } else image(oldmanList[enemyNum + 1], x, y);
  }
  
  
  //Keeps enemies from going off the screen
  void confineToEdges() 
  {
    x = constrain(x, 5, 990);
    y = constrain(y, 5, 640);
  }
}