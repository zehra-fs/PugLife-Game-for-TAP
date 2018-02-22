
//==========PLAYER CLASS===========
class Player 
{

  int d; 
  float posX, posY; 
  float start_x = 30; 
  float start_y = 30; 
  int doggySpeed; 
  boolean isDead = false; 
  int health; 
  color wallColor = color(183, 74, 11); 
  color leftColor; 
  Player()
  {
    reset();
  }

  void reset()
  {
    health = 100; 
    posX = start_x; 
    posY = start_y; 
    d = 0; 
    doggySpeed = 5;
  }

  int getHealth()
  {
    return health;
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

  void moveLeft() {
    leftColor = get((int(posX)-(doggy.width/2 + doggySpeed)), int(posY));  //<>//
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
  
  void displayHealth()
  {
    // EDIT: DISPLAYING HEALTH ON THE SCREEN 
    String health = str(p.getHealth()); 
    textFont(healthTxt, 30); // STEP 3 Specify font + size 
    fill(255, 255, 255); // STEP 4 Specify font color 
    text(health, 820, 50); // STEP 5 Display Text
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