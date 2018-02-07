
//==========PLAYER CLASS===========
class Player 
{
  int d; 
  float x, y; 
  float start_x = 30; 
  float start_y = 30; 
  int doggySpeed; 
  boolean isDead = false; 
  int health; 

  Player()
  {
    reset();
  }

  void reset()
  {
    health = 100; 
    x = start_x; 
    y = start_y; 
    d = 0; 
    doggySpeed = 5;
  }
  
 int getHealth()
  {
    return health; 
  }
  
  void display()
  {
    imageMode(CENTER); 
    image(doggy, x, y);
  }

  void on_keyPressed() {
    if ( key == CODED ) {
      if ( keyCode == RIGHT ) x= x + doggySpeed;
      if ( keyCode == DOWN ) y = y + doggySpeed;
      if ( keyCode == LEFT )  x = x - doggySpeed;
      if ( keyCode == UP )   y = y - doggySpeed;
    }
  }
  void displayHealth()
  {
    // EDIT: DISPLAYING HEALTH ON THE SCREEN 
    String health = str(p.getHealth()); 
    textFont(healthTxt, 30); // STEP 3 Specify font + size 
    fill(232, 27,27); // STEP 4 Specify font color 
    text(health, 820, 50); // STEP 5 Display Text
  } 

  //Keeps doggy from going off the screen
  void confineToEdges() {
    x = constrain(x, 5, 890);
    y = constrain(y, 5, 540);
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
   }*/

  void draw()
  {
    //simulate(); 
    //image(doggy, posX, posY);
  }
}