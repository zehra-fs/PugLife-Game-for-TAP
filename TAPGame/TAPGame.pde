import processing.sound.*; 


//****Game Setup****
SoundFile file; 
//String audioName = "AfireLove.mp3"; 
String audioName = "Eyeliner.mp3"; 

String path; 

static float posX; 
static float posY; 
PImage doggy, bg, oldman, mazeImg; 
Player p; 
Enemy e; 
PFont healthTxt; 
void setup()
{ 
  size(1000, 650); //Canvas setup
  bg = loadImage("lawn.jpg"); //load background image
  smooth(); 
  
  path = sketchPath(audioName); 
  file = new SoundFile(this, path); 
  file.play(); 
  
  p = new Player(); //Player
  doggy = loadImage("pug.png"); //Player Image
  doggy.resize(35, 40);
  healthTxt = createFont("Arial", 16, true); //Arial, 30 point, anti-aliasing on

  e = new Enemy(); 
  oldman = loadImage("oldman.jpg");
  oldman.resize(40,40); 
  
  ( mazeImg = createMaze() ).resize(width, height);
  /* smooth(); 
   frameRate(120); 
   
   posX = width/2; 
   posY = height/2;
   doggySpeed = 5;  */
}

void draw()
{

  background(mazeImg); //background
  
  p.display(); //player
  p.displayHealth(); 
  p.confineToEdges(); 

  e.display(); 
  e.move(); 
  e.confineToEdges(); 
 
  
}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
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