//character art from https://opengameart.org/content/stella
//coin art from https://opengameart.org/content/coin-animation
//background art from https://www.kenney.nl/assets/roguelike-rpg-pack
//footstep audio from https://www.kenney.nl/assets/rpg-audio
//coin audio from https://pixabay.com/sound-effects/coin-c-02-102844/

PImage map;
PImage characterSheet;
Coin coin;
Hero character;
int xOffset;
int yOffset;
int fWidth;
int fHeight;

void setup(){
  size(400, 400);
  map = loadImage("sample_map.png");
  characterSheet = loadImage("stella_walk.png");
  fWidth = characterSheet.width;
  fHeight = characterSheet.height;
  coin = new Coin();
  
  character = new Hero();
}

void draw(){
  image(map, 0, 0, map.width * 2, map.height * 2);
  
  coin.display();
  if(coin.collision(character.position.x, character.position.y, character.xWidth, character.yHeight)){
    coin = new Coin();
  }
  
  character.move();
  character.display();
}

void keyPressed(){
  if (keyCode == UP) {
    character.velocity.y -= 1;
  }
  if (keyCode == DOWN) {
    character.velocity.y += 1;
  }
  if (keyCode == LEFT) {
    character.velocity.x -= 1;
  }
  if (keyCode == RIGHT) {
    character.velocity.x += 1;
  }
  character.velocity.x = constrain(character.velocity.x, -1, 1);
  character.velocity.y = constrain(character.velocity.y, -1, 1);
}

void keyReleased() {
  if (keyCode == UP) {
    character.velocity.y += 1;
  }
  if (keyCode == DOWN) {
    character.velocity.y -= 1;
  }
  if (keyCode == LEFT) {
    character.velocity.x += 1;
  }
  if (keyCode == RIGHT) {
    character.velocity.x -= 1;
  }
  character.velocity.x = constrain(character.velocity.x, -1, 1);
  character.velocity.y = constrain(character.velocity.y, -1, 1);
}
