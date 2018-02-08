
//=========Treats Class=======
class Treats{
  
   //for(int i = 0; i < 10; i++){
   float x, y;
   float start_x = random(100, 600);
   float start_y = random(100, 600);
  
  
   Treats(){  
    reset(); 
   }
  
   void reset() {
    x = start_x; 
    y = start_y; 
   }
  
   void display(){
    imageMode(CENTER); 
    image(treats, x,y); 
   }
  
}