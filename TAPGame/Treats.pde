
//=========Treats Class=======
class Treats{
  
  void display()
  {
    for(int i = 0; i < 10; i++){
    float x = random(100, 500);
    float y = random(100, 500);
     imageMode(CENTER); 
    image(treats, x, y);
  }
  

  
}
}