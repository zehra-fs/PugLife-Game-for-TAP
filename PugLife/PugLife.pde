import processing.sound.*; 



//****Game Setup****

//SoundFile file; 
//String audioName = "Eyeliner.mp3"; 
//String path; 

static float x; 
static float y; 
PImage doggy, bg, oldman, oldman2, mazeImg, house, treats;

ArrayList<Treat> treatList = new ArrayList<Treat>();
ArrayList<Treat> treatsEatenList = new ArrayList<Treat>();

Player p; 
Enemy e;
Treat t;
House h;
PFont healthTxt; 
color wallColor = color(183,74,11); 
int countH, countV, score; 
boolean isEaten = false, gameOver = true, startGuide = true; 

void setup()
{ 
  size(1000, 650); //Canvas setup
  bg = loadImage("TiledBgtest.png"); //load background image
  bg.resize(1000, 650);
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
    t = new Treat(); 
    treatList.add(t); 
  }

  treats = loadImage("bone.png");
  treats.resize(25, 25); 

  h = new House();
  house = loadImage("dogHouse1.png");
  house.resize(90, 90);
}

void draw()
{
  if (startGuide == true && gameOver == true) 
  {
    
    background(#33cc33); 
    text("Press 's' to start the game!", 350,200); 
  }
  if (gameOver == true && startGuide == false) 
  {
    background(bg); 
    text("OOPS! YOU'VE DIED! Click to restart", 250, 350); 
  }
  
 if (gameOver == false && startGuide == false) 
 {
   startGuide = false; 
  background(bg); //background
 // image(bg, 500, 325);


  p.display(); //player
  p.displayScore(); 
  p.confineToEdges(); 

  e.display(); 
  e.move(); 
  e.confineToEdges(); 


  h.display();
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );

  for (int i = 0; i < treatList.size(); i++)
  { 
    
      treatList.get(i).display(); //doggy treat
    
  }

  for (int i = 0; i < treatList.size(); i++) 
  { 
    if /*(p.getYPos() == treatList[i].getYPos() && p.getXPos() == treatList[i].getXPos())
    */ (p.getYPos() <= treatList.get(i).getYPos() + 30 && p.getYPos() >= treatList.get(i).getYPos() - 30
      && p.getXPos() <= treatList.get(i).getXPos() + 30 && p.getXPos() >= treatList.get(i).getXPos() - 30 )
     {
      p.setScore(p.getScore() + 50); //Increase player score
      treatList.get(i).setEaten(true);
      treatsEatenList.add(treatList.get(i)); 
      treatList.remove(i); 
    }
  }
  
  if (p.getYPos() <= e.getY() + 30 && p.getYPos() >= e.getY() - 30
      && p.getXPos() <= e.getX() + 30 && p.getXPos() >= e.getX() - 30 ) gameOver = true;
 }
}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
{
  if (mousePressed) gameOver = false;
  if (key == 's') 
  {
    gameOver = false; 
    
    startGuide = false;
  }
  p.on_keyPressed();
}