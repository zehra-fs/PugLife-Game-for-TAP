import processing.sound.*; 



//**************Declaring Variables*************************

SoundFile file, enemyFx, crunchFx, doomFx; 
float start_x, start_y; 
int seconds, score, round = 0; 
PImage doggy, bg, mazeImg, house, house1, treats, screen1;
PImage[] oldmanList = new PImage[10]; 
PFont healthTxt; 

ArrayList<Treat> treatList = new ArrayList<Treat>();
ArrayList<Treat> treatsEatenList = new ArrayList<Treat>();
ArrayList possiblePlacesH = new ArrayList(); 
ArrayList possiblePlacesV = new ArrayList(); 
boolean isEaten = false, gameOver = true, startGuide = true, gameWon = false; 


Player p; 
Enemy e, e1, e2, e3, e4;
Treat t;
House h;

//Color of the walls (collision) and grass colors
color wallColor = color(183, 74, 11); 
color grass2 = color(114, 222, 60);  
color grass1 = color(115, 222, 62);
color tuft = color(63, 179, 21);
color spot; 

int treatNumber = 15; //Number of Treats displayed 

//************Game Setup**********************
void setup()
{ 
  size(1000, 650); //Canvas size
  bg = loadImage("treatsTest_1.png"); //load background image
  bg.resize(1000, 650);
  bg.loadPixels(); 

  screen1 = loadImage("Screen.png"); 

  for (int i = 0; i < bg.width - 10; i++)
  {
    for (int j = 0; j < bg.height -10; j++)
    {
      if (bg.get(i, j) == grass1 || bg.get(i, j) == grass2 || bg.get(i, j) == tuft)
      {
        possiblePlacesH.add(i);
        possiblePlacesV.add(j);
      }
    }
  }
  
  //Loading all sound files needed for the game
  file = new SoundFile(this, "Eyeliner.mp3"); 
  file.amp(0.2);
  enemyFx = new SoundFile(this, "grumpy.wav");
  crunchFx = new SoundFile(this, "crunch.mp3"); 
  doomFx = new SoundFile(this, "doom.flac"); 

  healthTxt = createFont("Arial", 16, true); //Arial, 30 point, anti-aliasing on


 //Loading Images used for Player, Treats, and House
  doggy = loadImage("pug.png"); //Player Image
  //doggy.resize(35, 40);
  treats = loadImage("bone.png");

  //  treats.resize(25, 25); 
  house = loadImage("barn.png");
  // house.resize(90, 90);
  house1 = loadImage("barnDone.png"); 
  // house1.resize(90,90); 

  smooth(); 
  frameRate(60);
  reset(); 
}

//Allows game to be restarted
void reset()
{
  file.play(); //plays Game music

  p = new Player(); 
  h = new House();
  

    e = new Enemy(132,345, 1, 1); 
    e1 = new Enemy(674, 156, 1, 1); 
    e2 = new Enemy(695, 399, 2, 2);
    e3 = new Enemy(484,464, 1, 3);
    e4 = new Enemy(568,280, 2, 5); 

    for (int i = 0; i < oldmanList.length; i++)
    {
      if (i % 2 == 1) 
      {
        oldmanList[i] = loadImage("oldMan1.png");
        //oldmanList[i].resize(60, 60);
      } else 
      {
        oldmanList[i] = loadImage("oldMan1flip.png"); 
        // oldmanList[i].resize(60, 60);
      }
    }
    
    ArrayList usedSpots = new ArrayList(); 
    treatList.clear();
  for (int i = 0; i < treatNumber; i++)
  { 
    int anySpot = (int) random(0, possiblePlacesH.size()); 
    if (!usedSpots.contains(anySpot)) {
      usedSpots.add(anySpot); 

      t = new Treat((int)possiblePlacesH.get(anySpot), (int) possiblePlacesV.get(anySpot)); 
      treatList.add(t);
    }
  }
  }


void draw()
{

  if (startGuide == true && gameOver == true) 
  {

    background(screen1); 
    textSize(32);
    text("Press 'S' to start the game!", 290, 300);
  }
  if (gameOver == true && startGuide == false) 
  {
    background(screen1); 
    if (gameWon == true)
    {
      text("YOU WON!", 450,250);
      text("Press 'R' to restart.", 200, 300); 

    }
    else 
    {
    text("You suck. Guess you really couldn't survive the Pug Life.", 200, 250);
    text("Press 'R' to restart.", 200, 300); 
    text("Your score: " + p.getScore() / p.getTime() , 200, 340);
    }
  }

  if (gameOver == false && startGuide == false) 
  {
    if (round > 0) 
    {
     reset();
     round = 0;
    }
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

    e2.display(); 
    e2.move(); 
    e2.confineToEdges(); 
    e3.display(); 
    e3.move(); 
    e3.confineToEdges(); 
    e4.display(); 
    e4.move(); 
    e4.confineToEdges(); 
    h.display();

    seconds = millis()/1000;
    text("Timer: " + seconds, 503,24); 
    p.setTime(seconds);
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
        p.setScore(p.getScore() + 1); //Increase player score
        treatList.get(i).setEaten(true);
        crunchFx.play(); 
        treatsEatenList.add(treatList.get(i)); 
        treatList.remove(i);
      }
    }
    
     if((treatsEatenList.size() == treatNumber) && p.getYPos() <= house1.height + 30 && p.getYPos() >= house1.height - 30
        && p.getXPos() <= house1.width + 30 && p.getXPos() >= house1.width - 30 )
      {
        gameWon = true; 
       }
    
     
  }
  
}

void keyPressed() //IF THERE"S TIME: add options for "Reset", "Exit", etc
{
  if (key == 'r')
  {
    gameOver = true;
    startGuide = true;
    round++;
    file.play(); 
    enemyFx.stop(); 
  }
  
  if (key == 's' && gameOver == true) 
  {
    gameOver = false; 
    startGuide = false;
  }
  
  p.on_keyPressed();
}