
/* 
byte[] temp = new byte[900];
saveBytes("world.dat", temp);
*/ 

class Player {
  float start_x = 30;
  float start_y = 30;
  float x, y;
  int d;
  float mouth_opening, max_mouth_opening, mouth_step;
  boolean is_mouth_opening = true;
  boolean am_i_super = false;
  boolean is_dead = false;
  int super_countdown;
  Player() {
    reset();
  }
  void reset() {
    x = start_x;
    y = start_y;
    d = 0;
    mouth_opening = 0; 
    max_mouth_opening = .4; 
    mouth_step = .01;
    am_i_super = false;
    super_countdown = 0;
    is_dead = false;
  }
  void die() {
    is_dead = true;
    max_mouth_opening = TWO_PI;
    mouth_step = .1;
  }
  void draw() {
    simulate();
    render();
  }
  void simulate() {
    if (mouth_opening > PI ) reset();
    if (is_dead) { 
      animate_mouth(); 
      return;
    }
    float px=x, py=y;
    if (0==d) x++;
    if (1==d) y++;
    if (2==d) x--;
    if (3==d) y--;
    if (grid.is_wall(x, y)) {
      x = px;
      y = py;
    } else {
      animate_mouth();
      grid.eat_dot_at(x, y);
    }
    if (super_countdown > 0) { 
      super_countdown--;
    }
    if (super_countdown == 0) { 
      am_i_super = false;
      for (int i=0; i<ghosts.length; ghosts[i++].dont_be_afraid ());
    }
  }
  void animate_mouth() {
    if (is_mouth_opening) {
      mouth_opening+=mouth_step;
    } else {
      mouth_opening-=mouth_step;
    }
    if (mouth_opening > max_mouth_opening || mouth_opening < 0) {
      is_mouth_opening = !is_mouth_opening;
    }
  }
  void be_super() {
    am_i_super = true;
    super_countdown = 500;
    for (int i=0; i<ghosts.length; ghosts[i++].be_afraid ());
  }
  void render() {
    pushMatrix();
    translate(x, y);
    rotate(HALF_PI*d);
    stroke(0);
    fill(am_i_super?color(random(255), random(255), random(255)):color(255, 255, 0));
    ellipse(0, 0, 22, 22);
    fill(0);
    arc(0, 0, 22, 22, -mouth_opening, mouth_opening);
    popMatrix();
  }
  void on_keyPressed() {
    if ( key == CODED ) {
      if ( keyCode == RIGHT ) d=0;
      if ( keyCode == DOWN )  d=1;
      if ( keyCode == LEFT )  d=2;
      if ( keyCode == UP )    d=3;
    }
  }
}
 
class Grid {
  byte[][] data = new byte[30][30];
  Grid() {
    for (int j=0; j<height/20; j++) {
      for (int i=0; i<width/20; i++) {
        data[j][i] = 2;
        if (0==i || 0==j || 29==i || 29==j) { 
          data[j][i] = 1;
        }
      }
    }
    data[5][10] = 3;
  }
  void draw() {
    for (int j=0; j<height/20; j++) {
      for (int i=0; i<width/20; i++) {
        noFill();      
        if (data[j][i] == 1) { 
          fill(0, 0, 255);
        }
        if ( data[j][i] == 1 ) {
          pushStyle();
          stroke(0, 0, 255);
          //stroke(0, 255-map(dist(player.x,player.y,20*i,20*j),0,200,0,255), 255 );
          strokeWeight(12);
          pushMatrix();
          translate(20*i, 20*j);
          line(10, 10, 10, 10);
          if (i<29 && data[j][i+1] == 1) {
            line(10, 10, 30, 10);
          }
          if (j<29 && data[j+1][i] == 1) {
            line(10, 10, 10, 30);
          }
          popMatrix();
          popStyle();
        }
        if (data[j][i] == 2) {
          fill(196);
          noStroke();
          ellipse(20*i+10, 20*j+10, 6, 6);
        }      
        if (data[j][i] == 3) {
          fill(255);
          noStroke();
          ellipse(20*i+10, 20*j+10, 12, 12);
        }
      }
    }
  }
  boolean is_wall(float ix, float iy) {
    int i = int(ix/20);
    int j = int(iy/20);
    return (data[j][i] == 1);
  }
  void eat_dot_at(float ix, float iy) {
    int i = int(ix/20);
    int j = int(iy/20);
    if (data[j][i] == 3) {
      player.be_super();
    }
    data[j][i] = 0;
  }
  void world_edit(int ix, int iy) {
    int i = int(ix/20);
    int j = int(iy/20);
    data[j][i]++;
    data[j][i]%=4;
  }
  void on_keyPressed() {
    if (key == 's' ) { 
      grid.save_level();
    }
    if (key == 'l' ) {
      grid.load_level();
    }
  }
  void save_level() {
    byte[] temp = new byte[900];
    int t = 0;
    for (int j = 0; j < 30; j++) {
      for (int i = 0; i < 30; i++) {
        temp[t++] = grid.data[j][i];
      }
    } 
    saveBytes("world.dat", temp);
    println("Level saved.");
  }  
  void load_level() {
    byte[] temp = loadBytes("world.dat");
    int t = 0;
    for (int j = 0; j < 30; j++) {
      for (int i = 0; i < 30; i++) {
        grid.data[j][i] = temp[t++];
      }
    }
    println("Level loaded.");
  }
  boolean kill_at(int ix, int iy) {
    int i = int(ix/20);
    int j = int(iy/20);
    int pmi = int(player.x/20); 
    int pmj = int(player.y/20);
    if (i==pmi&&j==pmj) {
      if (player.am_i_super) {
        return true;
      } else {
        player.die();
      }
    }
    return false;
  }
}
 
class Ghost {
  int type;
  int x, y, tx, ty, ptx, pty;
  int pgx, pgy;
  int d;
  boolean is_scared;
  boolean is_dead;
  int trapped_timer;
  Ghost(int itype) {
    type = itype % ghost_colors.length;
    x = 10 + 20 * 15;
    y = 10 + 20 * 14;
    tx = x;
    ty = y;
    ptx=tx;
    pty=ty;
    trapped_timer = 200 * type;
  }
  void dont_be_afraid() {
    if (is_scared) {
      is_scared = false;
      d=(d+2)%4;
      tx = ptx;
      ty = pty;
    }
  }
  void be_afraid() {
    if (!is_dead) {
      is_scared = true;
      d=(d+2)%4;
      tx = ptx;
      ty = pty;
    }
  }  
  void draw() {
    simulate();
    render();
    if (!is_dead) kill_check();
  }
  void simulate() {
    trapped_timer--;
    if (trapped_timer > 0) return;
    int px = x;
    int py = y;
    if (tx < x) x--;
    if (tx > x) x++;
    if (ty < y) y--;
    if (ty > y) y++;
    if (px==x&&py==y) {
      ptx = tx;
      pty = ty;
      int wall_count = 0;
      for (int w = 0; w < 4; w++) {
        if ( grid.is_wall(x+decodeX[w], y+decodeY[w]) ) {
          wall_count++;
        }
      }
      if (wall_count == 4) { // >:(
        d = 4;
        tx = x+decodeX[d];
        ty = y+decodeY[d];
        return;
      }
      if (wall_count == 3) {
        for (int w = 0; w < 4; w++) {
          if ( !grid.is_wall(x+decodeX[w], y+decodeY[w]) ) {
            d = w;
          }
        }
        tx = x+decodeX[d];
        ty = y+decodeY[d];
        return;
      }
      if (wall_count == 2) {
        int result = 5;
        for (int w = 0; w < 4; w++) {
          if ( !grid.is_wall(x+decodeX[w], y+decodeY[w]) ) {
            if ( w != (d+2)%4 ) {
              result = w;
            }
          }
        }
        d = result;
        tx = x+decodeX[d];
        ty = y+decodeY[d];
        return;
      }
      int gx = int(player.x); // RED - Go for pacman.
      int gy = int(player.y);
      if (!to_corners) {
        if (type == 1 ) { // PINK = Get in front of pacman.
          gx = int(player.x)+4*decodeX[player.d];
          gy = int(player.y)+4*decodeY[player.d];
          if ( player.d == 3 ) { // Classic pink ghost behaviour.
            gx = int(player.x-80);
          }
        }
        if ( type == 2 ) { // CYAN - Negative RED's positions, offset a couple of squares.
          float mpx = player.x+2*decodeX[player.d];
          float mpy = player.y+2*decodeY[player.d];
          if (player.d == 3) { // Classic cyan ghost behaviour.
            mpx = player.x - 40;
          }
          gx = int(2*mpx - ghosts[0].x);
          gy = int(2*mpy - ghosts[0].y);
        }
        if ( type == 3 ) { // ORANGE - Get close, then back off.
          if (dist(player.x, player.y, x, y) < 160) {
            gx = 0;
            gy = height;
          }
        }
      } else {
        gx = width;
        gy = height;
        if ( type == 1 || type == 3 ) gx = 0; 
        if ( type == 1 || type == 0 ) gy = 0;
      }
      if (is_dead||is_scared) {
        gx = 10 + 20 * 15;
        gy = 10 + 20 * 14;
        if (is_dead && x==gx &&y==gy) is_dead = false;
      }    
      pgx = gx;
      pgy = gy;
      float best = -1 ;
      int result = 5;
      for ( int w = 0; w < 4; w++) {
        if ( w!=(d+2)%4 && !grid.is_wall(x+decodeX[w], y+decodeY[w])) {
          float new_dist = dist(x+decodeX[w], y+decodeY[w], gx, gy);
          if ( best == -1 || new_dist < best) {
            best = new_dist;
            result = w;
          }
        }
      }
      d = result;
      tx = x+decodeX[d];
      ty = y+decodeY[d];
      return;
    }
  }
  void render() {
    stroke(0);
    fill(is_scared?color(0, 0, 255):ghost_colors[type]);
    pushMatrix();
    translate(x, y);
    if (!is_dead) {
      rect(-11, -1, 22, 11);
      arc(0, 0, 22, 22, PI, TWO_PI);
      for (int i=0; i<4; i++) {
        arc(-7+5*i, 10, 5, 5, 0, PI);
      }
    }
    fill(255);
    noStroke();
    ellipse(-4, 0, 4, 8);
    ellipse(4, 0, 4, 8);
    if (is_dead||!is_scared) {
      fill(0, 0, 255);
      int eyex = (d==2?-1:0)+(d==0?1:0);
      int eyey = (d==3?-3:0)+(d==1?3:0);
      ellipse(-4+eyex, eyey, 3, 3);
      ellipse(4+eyex, eyey, 3, 3);
    }
    popMatrix();
  }
  void kill_check() {
    if ( grid.kill_at(x, y) ) is_dead = true;
  }
}
 
int[] decodeX = { 
  20, 0, -20, 0, 0
};
int[] decodeY = { 
  0, 20, 0, -20, 0
};
 
 
Grid grid;
Player player;
Ghost[] ghosts;
 
boolean to_corners = false;
int timer_corners;
 
color[] ghost_colors = {
  color(255, 0, 0), 
  color(255, 64, 196), 
  color(0, 255, 255), 
  color(255, 128, 0), 
  color(0, 255, 0), 
  //  color(196),
  //  color(128),
  //  color(64),
};
 
void setup() {
  size(601, 601);
  grid = new Grid();
  grid.load_level();
  player = new Player();
  ghosts = new Ghost[ghost_colors.length];
  for (int i=0; i<ghosts.length; ghosts[i] = new Ghost (i++));
  timer_corners = millis() + 10000;
}
 
void game_reset() {
  player.die();
  ghosts_reset();
}
 
void ghosts_reset() {
  // Could write a proper reset for the ghosts.
  for (int i=0; i<ghosts.length; ghosts[i] = new Ghost (i++));
}
 
void draw() {
  background(0);
  grid.draw();
  player.draw();
  for (int i=0; i<ghosts.length; ghosts[i++].draw ());
  if ( millis() > timer_corners) {
    timer_corners = millis() + 10000;
    to_corners = !to_corners;
  }
}
 
void keyPressed() {
  grid.on_keyPressed();
  player.on_keyPressed();
  if ( key == ' ') { 
    to_corners = !to_corners;
  }
  if ( key == 'd' ) player.die();
  if ( key == 'r' ) game_reset();
}
 
void mousePressed() {
  grid.world_edit(mouseX, mouseY);
}