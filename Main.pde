//set this to false when shipping
boolean devMode = false;

ArrayList<Tile> tiles;
Player p;
Dice dice;
PImage board;
PImage player;
int board_width;
int board_height;
int dice_value;
int left_limit;

void setup() {
  //setup canvas
  //size(800, 800);
  fullScreen();
  //set board size
  board_width = 800;
  board_height = 800;
  //initialize dice_value
  dice_value = 1;
  //initialize other objects
  tiles = new ArrayList<>();
  p = new Player(0, 0, board_width/10, "Player 1");
  player = loadImage("assets/Cone.png");
  player.resize(50,50);
  dice = new Dice(60, height-160, 120);
  //setup board
  setup_board();
  //p.moveForward(17);
}

void setup_board() {
  board = loadImage("assets/snakeboard.png");
  board.resize(board_width,board_height);
  //setup a board based on board_width and board_height (10x10 board);
  int sideSize = board_width/10;
  left_limit = width/4;
  board_width = board_width + left_limit;
  int x = left_limit, y = board_height;
  boolean alt = true;
  int number = 1;
  //create tiles by traversing x,y coordinates and assigning an index from 1..n to the tile
  for (int i = 0; i<=board_width*board_height; i+= sideSize) {
    //create a tile at x,y and add it to tiles list
    Tile t = new Tile(x, y, number++, sideSize);
    t.setupTileRule();
    tiles.add(t);
    //adjust x based on side
    x = alt ?(x+sideSize) : (x-sideSize);
    //if x hits ends switch direction and go up
    if (x+sideSize>board_width || x<left_limit) {
      alt = !alt;
      x = alt?left_limit:board_width-sideSize;
      y -= sideSize;
    }
  }
}

void draw() {
  background(0);
  //draw all Tiles
  image(board,left_limit,0);
  for (Tile t : tiles) {
    t.drawTile();
  }
  //draw player on tiles
  p.drawPlayer(tiles, player);
  int jump = tiles.get(p.getCurrentStep()-1).getSpecialRule();
  if(jump!=0){
    p.moveForward(jump);
  }
  //check if player won
  if (p.getCurrentStep() == 100) {
    //background(0);
    fill(255,0,0);
    textSize(240);
    text("WINNER", width/4, height/2);
    return;
  }
  //show dice on UI
  dice.showDice(dice_value);
}

void roll_dice() {
  //roll dice and move the player forward
  dice_value = (int)random(1, 7);
  p.moveForward(dice_value);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      roll_dice();
    }
    if (devMode) {
      if (keyCode == RIGHT) {
        p.moveForward(1);
      }
      if (keyCode == LEFT) {
        p.moveForward(-1);
      }
    }
  }
}

void mouseClicked() {
  if (dice.checkClick()) {
    roll_dice();
  }
}
