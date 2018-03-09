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
  //pg.rect(185, 1, 15, 200); //c4
  //pg.rect(52, 1, 15, 200); //current one
  //pg.rect(120, 100, 15, 200); //c2
  //pg.rect(250, 60, 15, 350); //current
  //pg.rect(1, 250, 264, 15); //now 
  //pg.rect(52, 475, 15, 40); //threee small ones at the bottom left
  //pg.rect(135, 475, 15, 40); //threee small ones at the bottom left 
  //pg.rect(220, 475, 15, 40); //threee small ones at the bottom left
  //pg.rect(250, 50, 130, 15); //next
  //pg.rect(250, 320, 210, 15); //next2
  //pg.rect(450, 230, 15, 105); //next3
  //pg.rect(320, 260, 80, 15); //next4 
  //pg.rect(355, 115, 15, 150); //next5 
  //pg.rect(320, 115, 80, 15); //next6
  //pg.rect(320, 188, 80, 15); //next7
  //pg.rect(450, 50, 15, 115); //next8
  //pg.rect(450, 114, 300, 15); //next9
  //pg.rect(450, 50, 395, 15); //next10
  //pg.rect(742, 114, 15, 160);//next11
  //pg.rect(742, 170, 100, 15); //next12
  //pg.rect(540, 170, 200, 15);//next13
  //pg.rect(520, 175, 15, 90); //next14 ytdikytd
  //pg.rect(460, 250, 95, 15);//next15 
  //pg.rect(670, 265, 15, 90);//next16
  //pg.rect(540, 350, 355, 15);//next17
  //pg.rect(820, 265, 15, 95);//next18
  //pg.rect(600, 300, 15, 90);//next19
  //pg.rect(315, 409, 223, 15);
  //pg.rect(315, 409, 15, 80);
  //pg.rect(780, 440, 15, 105);
  //pg.rect(400, 490, 15, 90); //bottoms up
  //pg.rect(485, 420, 15, 75); //top bottoms
  //pg.rect(575, 490, 15, 105); //bottoms up
  //pg.rect(665, 375, 15, 90); //top bottoms
  //pg.rect(640, 520, 100, 15);
  

  pg.endDraw();

  return pg.get();
  
}