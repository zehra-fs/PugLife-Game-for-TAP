
//==========PLAYER CLASS===========
class Player 
{

  int d; 
  float posX, posY; 
  float start_x = 30; 
  float start_y = 30; 
  int doggySpeed; 
  boolean isDead = false; 
  int totalTime; 
  Player()
  {
    reset();
  }

  void reset()
  {
    score = 0; 
    posX = start_x; //903; 
    posY = start_y; //560; 
    d = 0; 
    doggySpeed = 6;
    totalTime = 0; 
  }

  int getScore()
  {
    return score;
  }
 void setScore(int newScore)
 {
   score = newScore; 
 }
 
 void setTime(int seconds)
 {
   totalTime = seconds; 
 }
 
 int getTime()
{
  return totalTime; 
}
 
  float getXPos()
  {
    return posX;
  }
  
  float getYPos()
  { 
    return posY; 
  }
  void display()
  {
    imageMode(CENTER); 
    image(doggy, posX, posY);
  }

 /*void on_keyPressed() 
  {
    if ( key == CODED )
    {
      if ( keyCode == RIGHT ) x = x + doggySpeed;
      if ( keyCode == DOWN ) y = y + doggySpeed;
      if ( keyCode == LEFT )  x = x - doggySpeed;
      if ( keyCode == UP )   y = y - doggySpeed;
    }
  }  
 */ 
  void on_keyPressed() 
   {
      if ( key == CODED )
    {
      if ( keyCode == RIGHT ) moveRight();
      if ( keyCode == DOWN ) moveDown();
      if ( keyCode == LEFT )  moveLeft();
      if ( keyCode == UP )  moveUp();
    }
   } 

   void moveCursor()
   {
        color leftColor = get((int(posX)-(doggy.width/2 + doggySpeed)), int(posY)); 
    color rightColor = get((int(posX) + (doggy.width/2+1) + doggySpeed), int(posY)); 
    color upColor = get(int(posX), (int(posY)-(doggy.width/2 + doggySpeed))); 
    color downColor = get(int(posX), (int(posY) + (doggy.width/2+1) + doggySpeed)); 
  
   
   }
  void moveLeft() {
   color leftColor = get((int(posX)-(doggy.width/2 + doggySpeed)), int(posY));  //<>//
    if (leftColor != wallColor) 
   {
      posX = posX- doggySpeed; 
    }
  }

  void moveRight() {
    color rightColor = get((int(posX) + (doggy.width/2+1) + doggySpeed), int(posY)); 
    if (rightColor != wallColor) {
      posX= posX+ doggySpeed;
    }
   
  }
  void moveUp() {
    color upColor = get(int(posX), (int(posY)-(doggy.width/2 + doggySpeed))); 
    if (upColor != wallColor) {
      posY = posY - doggySpeed;
    }
  }
  void moveDown() {
    color downColor = get(int(posX), (int(posY) + (doggy.width/2+1) + doggySpeed)); 
    if (downColor != wallColor) { 
      posY = posY + doggySpeed;
    }
  } 
  
 /* void checkCollision() {
   color touchUp = path.get(posX, posY); 
   color touchRight = path.get(posX + playerW, posY); 
   color touchDown = path.get(posX + playerW, posY + playerH); 
   color touchLeft = path.get(posX, posY + playerH); 
  }
  */ 
  
  void displayScore()
  {
    // EDIT: DISPLAYING HEALTH ON THE SCREEN 
    String score = str(p.getScore()); 
    textFont(healthTxt, 30); // STEP 3 Specify font + size 
    fill(255, 255, 255); // STEP 4 Specify font color 
    text("Bones Collected: " + score, 721, 24); // STEP 5 Display Text
  } 

  //Keeps doggy from going off the screen
  void confineToEdges()
  {
    posX = constrain(posX, 5, 990);
    posY = constrain(posY, 5, 640);
  }

  //========================
  /*void setup()
   {
   doggy = loadImage("pug.png"); 
   doggy.resize(35, 40);
   }
   
   void simulate()
   { 
   // float px=x, py=y;
   if (0==d) x++;
   if (1==d) y++;
   if (2==d) x--;
   if (3==d) y--;
   }
   
   void draw()
   {
   //simulate(); 
   //image(doggy, posX, posY);
   }
   */
}