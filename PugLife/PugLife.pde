import processing.sound.*; 



//****Game Setup****

//SoundFile file; 
//String audioName = "Eyeliner.mp3"; 
//String path; 

static float x; 
static float y; 
PImage doggy, bg, oldman, oldman2, mazeImg, house, treats;

Treat[] treatList = new Treat[10];
Player p; 
Enemy e;
Treat t;
House h;
PFont healthTxt; 
color wallColor = color(183, 74, 11); 
int countH, countV, score; 
boolean isEaten = false; 

void setup()
{ 
  size(1000, 650); //Canvas setup
  bg = loadImage("TiledBg.png"); //load background image
  smooth(); 
  frameRate(120); 

  // path = sketchPath(audioName); 
  //file = new SoundFile(this, path); 
  //file.play(); 
  //file.amp(0.2);

  p = new Player(); //Player
  doggy = loadImage("pug.png"); //Player Image
  doggy.resize(35, 40);
  healthTxt = createFont("Arial", 16, true); //Arial, 30 point, anti-aliasing on

  e = new Enemy(); 
  oldman = loadImage("oldMan1.png");
  oldman.resize(60, 60); 
  oldman2 = loadImage("oldMan1flip.png"); 
  oldman2.resize(60, 60); 

  // t = new Treat(); 
  for (int i = 0; i < 10; i++)
  {
    treatList[i] = new Treat();
  }

  treats = loadImage("bone.png");
  treats.resize(25, 25); 

  h = new House();
  house = loadImage("dogHouse1.png");
  house.resize(90, 90);
}

void draw()
{

  background(bg); //background

  p.display(); //player
  p.displayScore(); 
  p.confineToEdges(); 

  e.display(); 
  e.move(); 
  e.confineToEdges(); 


  h.display();
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );

  for (int i = 0; i < treatList.length; i++)
  { 
    if (treatList[i].getEaten() == false) 
    {
      treatList[i].display(); //doggy treat
    }
  }

  for (int i = 0; i < treatList.length; i++) 
  { // USE ARRAYLISTS INSTEAD> REVAMP REVAMP REVAMP!!!!
    if (p.getYPos() == treatList[i].getYPos() && p.getXPos() == treatList[i].getXPos())
    /*(p.getYPos() <= treatList[i].getYPos() + 30 && p.getYPos() >= treatList[i].getYPos() - 30
      && p.getXPos() <= treatList[i].getXPos() + 30 && p.getXPos() >= treatList[i].getXPos() - 30 )
    */ {
      p.setScore(p.getScore() + 50); //Increase player score
      treatList[i].setEaten(true);
    }
  }
}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
{
  p.on_keyPressed();
}