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
  
  //rect(x-coor, y-coor, width, heigth)
  pg.rect(1, 1, 5, 550);
  pg.rect(1, 1, 900,3);
  pg.rect(1, 548, 900, 3);
  pg.rect(898, 1, 3,550);
  
  //the maze i started
   //rect(x-coor, y-coor, width, heigth)
  pg.rect(52, 1, 165, 31);
  pg.rect(220, 1, 31, 165);
  pg.rect(52, 82, 31, 268);
  pg.rect(142, 82, 31, 93);
  pg.rect(85, 319, 162, 31);
  pg.rect(220, 228 ,30, 45); 
  pg.rect(142, 240, 31, 80); 
  pg.rect(220, 320, 30, 111);
  pg.rect(1, 400, 220, 31);
  pg.rect(52, 475, 31, 40);
  pg.rect(135, 475, 31, 40);
  pg.rect(220, 475, 31, 40);
  pg.rect(220, 150, 111, 31);
  //rect(x-coor, y-coor, width, heigth)
  pg.rect(300, 75, 31, 198); //this one
  pg.rect(300, 50, 75, 31);
  pg.rect(220, 320, 250, 31); //dis one
  pg.rect(450, 230, 31, 120); //ok, dis one
  pg.rect(400, 230, 50, 31);
  pg.rect(400, 165, 31, 95);
  pg.rect(400, 134, 80, 31);
  pg.rect(450, 50, 31, 115); //current one
  pg.rect(442, 134, 300, 31); //c1
  pg.rect(450, 50, 395, 31); //top left
  pg.rect(742, 134, 31, 160);
  pg.rect(742, 190, 100, 31);
  pg.rect(540, 230, 150, 31);//previous
  pg.rect(660, 240, 31, 140);//ccurent one
  pg.rect(540, 350, 355, 31);
  pg.rect(820, 295, 31, 82);
  
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