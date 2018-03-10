import processing.sound.*; 



//****Game Setup****

SoundFile file; 
String audioName = "Eyeliner.mp3"; 
String path; 

static float x; 
static float y; 
PImage doggy, bg, mazeImg, house,house1, treats, screen1;
PImage[] oldmanList = new PImage[10]; 

ArrayList<Treat> treatList = new ArrayList<Treat>();
ArrayList<Treat> treatsEatenList = new ArrayList<Treat>();
ArrayList possiblePlacesH = new ArrayList(); 
ArrayList possiblePlacesV = new ArrayList(); 

Player p; 
Enemy e, e1, e2, e3;
Treat t;
House h;
PFont healthTxt; 
color wallColor = color(183, 74, 11); 
int countH, countV, score; 
boolean isEaten = false, gameOver = true, startGuide = true; 
color grass2 = color(114,222,60); 
color grass1 = color(115,222,62);
color tuft = color(63, 179,21);
float start_x; 
float start_y; 
color spot; 
int treatNumber = 20;

void setup()
{ 
  size(1000, 650); //Canvas setup
  bg = loadImage("treatsTest_1.png"); //load background image
  bg.resize(1000, 650);
  bg.loadPixels(); 

  screen1 = loadImage("Screen.png"); 

  for (int i = 0; i < bg.width - 10; i++)
  {
    for (int j = 0; j < bg.height -10; j++)
    {
      if (bg.get(i, j) == grass1 || bg.get(i,j) == grass2 || bg.get(i,j) == tuft)
      {
        possiblePlacesH.add(i);
        possiblePlacesV.add(j); 
      }
    }
  }
  path = sketchPath(audioName); 
  file = new SoundFile(this, path); 
  file.play(); 
  file.amp(0.2);

  p = new Player(); //Player
  doggy = loadImage("pug.png"); //Player Image
  //doggy.resize(35, 40);
  healthTxt = createFont("Arial", 16, true); //Arial, 30 point, anti-aliasing on


  e = new Enemy(220,463, 2, 1); 
  e1 = new Enemy(113,335, 1, 5);
  
  for (int i = 0; i < oldmanList.length; i++)
  {
    if (i % 2 == 1) 
    {
      oldmanList[i] = loadImage("oldMan1.png");
      //oldmanList[i].resize(60, 60); 
    }
    else 
    {
      oldmanList[i] = loadImage("oldMan1flip.png"); 
     // oldmanList[i].resize(60, 60); 
    }
  }
  
  

  // t = new Treat(); 
  ArrayList usedSpots = new ArrayList(); 
  for (int i = 0; i < treatNumber; i++)
  { 
    int anySpot = (int) random(0, possiblePlacesH.size()); 
    if (!usedSpots.contains(anySpot)){
    usedSpots.add(anySpot); 
    
    t = new Treat((int)possiblePlacesH.get(anySpot), (int) possiblePlacesV.get(anySpot)); 
    treatList.add(t);
    }
    
    
  }

  treats = loadImage("bone.png");
//  treats.resize(25, 25); 

  h = new House();
  house = loadImage("dogHouse1.png");
 // house.resize(90, 90);
  house1 = loadImage("dogHouseDone.png"); 
 // house1.resize(90,90); 

  //smooth(); 
  frameRate(120);
}

void draw()
{

  if (startGuide == true && gameOver == true) 
  {

    background(screen1); 
    text("Press 's' to start the game!", 350, 200);
  }
  if (gameOver == true && startGuide == false) 
  {
    background(screen1); 
    text("OOPS! YOU'VE DIED! Press 'R' to restart", 250, 350);
    text("Your score: " + p.getScore(), 250, 400); 
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

 e1.display(); 
    e1.move(); 
    e1.confineToEdges(); 

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

    
      
  
  }
}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
{
  if (key == 'r')
  {
    gameOver = false;
    startGuide = true;
  }
  if (key == 's') 
  {
    gameOver = false; 
    startGuide = false;
  }
  p.on_keyPressed();
}