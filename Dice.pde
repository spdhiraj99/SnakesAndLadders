class Dice {
  private float x, y;
  private int diceSize;

  public Dice(float x, float y, int diceSize) {
    this.x = x;
    this.y = y;
    this.diceSize = diceSize;
  }

  public void showDice(int side) {
    //dice
    noStroke();
    fill(#FFF3D6);
    rect(x, y, diceSize, diceSize, diceSize/5);

    //dots
    fill(50);
    float dotCenterX = x+(diceSize/2);
    float dotCenterY = y+(diceSize/2);
    if (side == 1 || side == 3 || side == 5)
      ellipse(dotCenterX, dotCenterY, diceSize/5, diceSize/5);
    if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) {
      ellipse(dotCenterX - diceSize/4, dotCenterY - diceSize/4, diceSize/5, diceSize/5);
      ellipse(dotCenterX + diceSize/4, dotCenterY + diceSize/4, diceSize/5, diceSize/5);
    }
    if (side == 4 || side == 5 || side == 6) {
      ellipse(dotCenterX - diceSize/4, dotCenterY + diceSize/4, diceSize/5, diceSize/5);
      ellipse(dotCenterX + diceSize/4, dotCenterY - diceSize/4, diceSize/5, diceSize/5);
    }
    if (side == 6) {
      ellipse(dotCenterX, dotCenterY - diceSize/4, diceSize/5, diceSize/5);
      ellipse(dotCenterX, dotCenterY + diceSize/4, diceSize/5, diceSize/5);
    }
  }
  
  public boolean checkClick(){
    //check if mouse is on dice
    if(mouseX >= this.x && mouseX <= this.x + diceSize && mouseY >= this.y && mouseY <= this.y + diceSize){
      return true;
    }
    return false;
  }
  
}
