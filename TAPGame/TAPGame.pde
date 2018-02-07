//****Game Setup****
static float posX; 
static float posY; 
PImage doggy, bg; 
Player p; 
void setup()
{ 
  size(900, 550); //Canvas setup
  p = new Player(); 
  bg = loadImage("lawn1.jpg");
   doggy = loadImage("pug.png"); 
   doggy.resize(35,40);
  /* smooth(); 
   frameRate(120); 
  
   posX = width/2; 
   posY = height/2;
   doggySpeed = 5;  */
}

void draw()
{

  background(bg); 
 // p.move();
  p.display();
  p.confineToEdges(); 
 // p.top(); 
 // image(doggy, posX, posY); 
 // imageMode(CENTER);
}

 void keyPressed()
 {
     p.on_keyPressed(); 
 }


  //================GRID CLASS================
  /*class Grid
   {
   String[][] data = new String[30][30];
   
   Grid()
   {
   for(int j=0; j <30; j++)
   {
   for int i=0; i<30; i++)
   {
   data[j][i] = "2";
   //FINISH CODING THIS PART IF NEEDED 
   }
   }
   }
   }
   */