//===================ENEMY CLASS=========
class Enemy 
{
  float x, y; 
  int start_x = 313;
  int start_y = 525; 
  int type; //If we have time to make more than one kind of enemy 
  
  
  Enemy()
  {
    reset(); 
  }
  
  void reset()
  {
    x = start_x; 
    y = start_y; 
  }
  
  void move() //Edit after creating the maze to avoid collision
  {
   color upColor = get(int(x), (int(y)-(oldman.width/2))); 
    if (upColor != wallColor) {
      y = y--;
    } //<>//
  }
   
   // movement 
   void moveLeft() {
   color leftColor = get((int(posX)-(oldman.width/2)), int(posY)); 
    if (leftColor != wallColor) 
   {
      posX = posX--; 
    }
  }

  void moveRight() {
    color rightColor = get((int(posX) + (oldman.width/2+1)), int(posY)); 
    if (rightColor != wallColor) {
      posX= posX++;
    }
   
  }
  void moveUp() {
    color upColor = get(int(posX), (int(posY)-(oldman.width/2))); 
    if (upColor != wallColor) {
      posY = posY--;
    }
  }
  void moveDown() {
    color downColor = get(int(posX), (int(posY) + (oldman.width/2+1))); 
    if (downColor != wallColor) { 
      posY = posY++;
    }
  } 
  
  
  void display()
  {
    imageMode(CENTER); 
    image(oldman, x,y); 
  }
  //Keeps enemies from going off the screen
  void confineToEdges() 
  {
    x = constrain(x, 5, 990);
    y = constrain(y, 5, 640);
  }
}