import processing.sound.*; 



//****Game Setup****

SoundFile file; 
String audioName = "Eyeliner.mp3"; 
String path; 

static float x; 
static float y; 
PImage doggy, bg, oldman, mazeImg, treats, house; 
Player p; 
Enemy e;
Treat t;
House h;
PFont healthTxt; 
color wallColor = color(183, 74, 11); 

void setup()
{ 
  size(1000, 650); //Canvas setup
  bg = loadImage("lawn.png"); //load background image
  smooth(); 
  
 path = sketchPath(audioName); 
 file = new SoundFile(this, path); 
 file.play(); 
 file.amp(0.2);
  
  p = new Player(); //Player
  doggy = loadImage("vet.png"); //Player Image
  doggy.resize(35, 40);
  healthTxt = createFont("Arial", 16, true); //Arial, 30 point, anti-aliasing on

  e = new Enemy(); 
  oldman = loadImage("oldman.jpg");
  oldman.resize(40,40); 
  

  t = new Treat(); 
  treats = loadImage("bone.png");
  treats.resize(40,40); 
  
  h = new House();
  house = loadImage("house.jpg");
  house.resize(80,80);
  
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
  
 
  t.display(); //doggy treat

  h.display();

  
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );

}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
{
  p.on_keyPressed();

}