class Player{
  
  private float x;
  private float y;
  private int stepSize;
  private String name;
  private int stepIndex;
  
   public Player(float x, float y, int stepSize, String name){
     this.x = x;
     this.y = y;
     this.stepSize = stepSize;
     this.name = name;
     this.stepIndex = 1;
   }
   
   /**
     Move the player by provided number of steps
   **/
   void moveForward(int steps){
     if(stepIndex + steps > 100){
       if(steps == 6){
         stepIndex = 100;
       }
       return;
     }
     if(stepIndex<100){
       stepIndex += steps;
     }
   }
   
   /**
     draw the player on correct tile based on where he's supposed to be in respect to tiles
   **/
   void drawPlayer(ArrayList<Tile> tiles, PImage playerImage){
     float tileX = tiles.get(stepIndex-1).getX();
     float tileY = tiles.get(stepIndex-1).getY();
     //fill(255,0,0);
     //square(tileX+(stepSize/2),tileY-(stepSize/2.5),10);
     image(playerImage, tileX+(stepSize/3),tileY-(stepSize/1.5));
   }
   
   /**
     get player's current step
   **/
   int getCurrentStep(){
     return this.stepIndex;
   }
  
}
