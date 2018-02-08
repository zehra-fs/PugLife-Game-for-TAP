//import processing.sound.*; 


//****Game Setup****

//SoundFile file; 
String audioName = "Eyeliner.mp3"; 
String path; 

static float posX; 
static float posY; 
PImage doggy, bg, oldman, mazeImg, treats; 
Player p; 
Enemy e;
Treat t;
PFont healthTxt; 
 
void setup()
{ 
  size(1000, 650); //Canvas setup
  bg = loadImage("lawn.jpg"); //load background image
  smooth(); 
  
  path = sketchPath(audioName); 
  //file = new SoundFile(this, path); 
  //file.play(); 
  
  p = new Player(); //Player
  doggy = loadImage("pug.png"); //Player Image
  doggy.resize(35, 40);
  healthTxt = createFont("Arial", 16, true); //Arial, 30 point, anti-aliasing on

  e = new Enemy(); 
  oldman = loadImage("oldman.jpg");
  oldman.resize(40,40); 
  
  t = new Treat(); 
  treats = loadImage("doggytreat.jpg");
  treats.resize(40,40); 
  
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
  //imageMode(CENTER);
  //image(mazeImg,900,450); 
  
  p.display(); //player
  p.displayHealth(); 
  p.confineToEdges(); 

  e.display(); 
  e.move(); 
  e.confineToEdges(); 
 
  t.display(); 
  
  
}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
{
  p.on_keyPressed();
}