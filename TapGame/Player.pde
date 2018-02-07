
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
    x = start_x; 
    y = start_y; 
    d = 0; 
    doggySpeed = 5;
  }
  void move()
  {
    y--;
  }
  void display()
  {
    stroke(0); 
    fill(127); 
    //ellipse(x, y, 64, 64); 
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