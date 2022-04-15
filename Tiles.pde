class Tile {
  private float x;
  private float y;
  private int index;
  private int size;
  private int actionStepForPlayer;

  public Tile(float x, float y, int index, int size) {
    this.x = x;
    this.y = y;
    this.index = index;
    this.size = size;
    this.actionStepForPlayer = 0;
  }

  /**
   draw the tile at its initialized x,y position and add index
   **/
  public void drawTile() {
    //fill(255);
    //square(x, y-size, this.size);
    fill(0);
    textSize(12);
    text(index, x+size/2, y-size/2);
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }
  
  public int getSpecialRule(){
    return this.actionStepForPlayer;
  }

  /**
   Special rule, should this tile make the player jump to some other tile
   **/
  public void setupTileRule() {
    if (index == 2) {
      actionStepForPlayer = 36;
    }
    else if(index == 7){
      actionStepForPlayer = 7;
    }else if(index == 8){
      actionStepForPlayer = 23;
    }else if(index == 15){
      actionStepForPlayer = 11;
    }else if(index == 21){
      actionStepForPlayer = 21;
    }else if(index == 28){
      actionStepForPlayer = 56;
    }else if(index == 36){
      actionStepForPlayer = 8;
    }else if(index == 51){
      actionStepForPlayer = 16;
    }else if(index == 71){
      actionStepForPlayer = 20;
    }else if(index == 78){
      actionStepForPlayer = 20;
    }else if(index == 87){
      actionStepForPlayer = 7;
    }else if(index == 16){
      actionStepForPlayer = -10;
    }else if(index == 49){
      actionStepForPlayer = -38;
    }else if(index == 46){
      actionStepForPlayer = -21;
    }else if(index == 62){
      actionStepForPlayer = -43;
    }else if(index == 64){
      actionStepForPlayer = -4;
    }else if(index == 74){
      actionStepForPlayer = -21;
    }else if(index == 92){
      actionStepForPlayer = -4;
    }else if(index == 95){ // go to 37
      actionStepForPlayer = -58;
    }else if(index == 99){
      actionStepForPlayer = -19;
    }
  }
}
