/*class Maze {
 
  float x;
  float y;
  float w;
  float h;
 
  void wall(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
 
  void draw(){
    fill(0);
    rect(x,y,w,h);
  }
 
} */ 

PImage createMaze() {
  final PGraphics pg = createGraphics(900, 550, JAVA2D);

  pg.beginDraw();
  pg.smooth();
  pg.strokeWeight(4);
  pg.stroke(183, 74, 11);
  pg.fill(183, 74, 11);
  pg.background(bg);
  
  
  /*1. Open up the game and record the X/Y coordinates of where you want the rectangle to be. Remember, the coordinates are for the UPPER-LEFT CORNER of the rectangle.
    2. Decide the width and the height of the rectangle. You can subtract the coordinates shown on the mouse. Trace your mouse over the game for the desired width and height.
    3. Draw the rectangle using this method: rect(x-coor, y-coor, width, height); */ 
  pg.rect(1, 1, 3, 550);
  pg.rect(1, 1, 900,3);
  pg.rect(1, 548, 900, 3);
  pg.rect(898, 1, 3,550);
 // pg.rect(180,269,85, 115); 
  
  //the maze i started
   //rect(x-coor, y-coor, width, heigth)
  pg.rect(185, 1, 15, 340); //c4
  pg.rect(52, 1, 15, 340); //current one
  pg.rect(120, 60, 15, 350); //c2
  pg.rect(250, 60, 15, 350); //current
  pg.rect(1, 400, 264, 15); //now
  pg.rect(52, 475, 15, 40); //threee small ones at the bottom left
  pg.rect(135, 475, 15, 40); //threee small ones at the bottom left 
  pg.rect(220, 475, 15, 40); //threee small ones at the bottom left
  pg.rect(250, 50, 130, 15); //next
  pg.rect(250, 320, 210, 15); //next2
  pg.rect(450, 230, 15, 105); //next3
  pg.rect(320, 260, 80, 15); //next4
  pg.rect(355, 115, 15, 150); //next5
  pg.rect(320, 115, 80, 15); //next6
  pg.rect(320, 188, 80, 15); //next7
  pg.rect(450, 50, 15, 115); //next8
  pg.rect(450, 134, 300, 15); //next9
  pg.rect(450, 50, 395, 15); //next10
  pg.rect(742, 134, 15, 160);//next11
  pg.rect(742, 190, 100, 15); //next12
  pg.rect(540, 200, 200, 15);//next13
  pg.rect(540, 200, 15, 90); //next14
  pg.rect(460, 250, 95, 15);//next15 
  pg.rect(670, 265, 15, 90);//next16
  pg.rect(540, 350, 355, 15);//next17
  pg.rect(820, 265, 15, 95);//next18
  pg.rect(600, 300, 15, 90);//next19
  pg.rect(315, 409, 223, 15);
  pg.rect(315, 409, 15, 80);
  pg.rect(780, 440, 15, 105);
  pg.rect(400, 490, 15, 90); //bottoms up
  pg.rect(485, 420, 15, 75); //top bottoms
  pg.rect(575, 490, 15, 105); //bottoms up
  pg.rect(665, 375, 15, 90); //top bottoms
  pg.rect(640, 520, 100, 15);
  
  ///OTHER PARTS 
 /* pg.rect(996, -10, 12, 1020);
  pg.rect(0, 756, 1020, 12);
  pg.rect(0, 700, 100, 4);
  pg.rect(160, 700, 600, 4);
  pg.rect(840, 700, 100, 4);
  pg.rect(940, 504, 4, 200);
  pg.rect(940, 504, 60, 4);
  pg.rect(940, 0, 4, 440);
  pg.rect(360, 50, 4, 490);
  pg.rect(760, 624, 4, 80);
  pg.rect(840, 510, 4, 190);
  pg.rect(100, 514, 4, 190);
  pg.rect(50, 464, 4, 240);
  pg.rect(160, 650, 4, 50);
  pg.rect(160, 646, 140, 4);
  pg.rect(160, 600, 4, 50);
  pg.rect(360, 646, 340, 4);
  pg.rect(160, 595, 140, 4);
  pg.rect(360, 596, 4, 50);
  pg.rect(160, 464, 4, 80);
  pg.rect(220, 464, 4, 80);
  pg.rect(280, 464, 4, 80);
  pg.rect(300, 544, 4, 55);
  pg.rect(160, 540, 60, 4);
  pg.rect(280, 540, 24, 4);
  pg.rect(100, 460, 64, 4);
  pg.rect(50, 224, 4, 185);
  pg.rect(100, 54, 4, 405);
  pg.rect(50, 220, 50, 4);
  pg.rect(50, 0, 4, 165);
  pg.rect(100, 50, 200, 4);
  pg.rect(300, 110, 4, 300);
  pg.rect(160, 110, 4, 290);
  pg.rect(160, 400, 60, 4);
  pg.rect(220, 400, 4, 64);
  pg.rect(360, 50, 200, 4);
  pg.rect(630, 50, 310, 4);
  pg.rect(420, 220, 4, 374);
  pg.rect(240, 110, 4, 240);
  pg.rect(240, 350, 60, 4);
  pg.rect(480, 160, 4, 440);
  pg.rect(420, 100, 4, 60);
  pg.rect(420, 160, 60, 4);
  pg.rect(360, 594, 64, 4);
  pg.rect(420, 100, 260, 4);
  pg.rect(740, 100, 200, 4);
  pg.rect(544, 160, 336, 4);
  pg.rect(680, 100, 4, 60);
  pg.rect(544, 440, 350, 4);
  pg.rect(890, 440, 4, 200);
  pg.rect(890, 504, 50, 4);
  pg.rect(620, 510, 224, 4);
  pg.rect(540, 440, 4, 160);
  pg.rect(760, 570, 4, 100);
  pg.rect(620, 570, 80, 4);
  pg.rect(700, 570, 4, 80);
  pg.rect(420, 380, 224, 4);
  pg.rect(700, 300, 4, 140);
  pg.rect(540, 320, 100, 4);
  pg.rect(540, 220, 4, 100);
  pg.rect(540, 220, 220, 4);
  pg.rect(600, 270, 104, 4);
  pg.rect(700, 270, 4, 100);
  pg.rect(760, 220, 4, 164);
  pg.rect(760, 380, 130, 4);
  pg.rect(890, 380, 4, 60);
  pg.rect(880, 160, 4, 60);
  pg.rect(820, 160, 4, 160);
  pg.rect(890, 280, 4, 120);
  pg.rect(880, 220, 60, 4);
*/ 
  pg.endDraw();

  return pg.get();
}