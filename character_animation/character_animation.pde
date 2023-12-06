//character art from https://opengameart.org/content/stella
//coin art from https://opengameart.org/content/coin-animation
//background art from https://www.kenney.nl/assets/roguelike-rpg-pack
//footstep audio from https://www.kenney.nl/assets/rpg-audio
//coin audio from https://pixabay.com/sound-effects/coin-c-02-102844/

PImage map;
import processing.sound.*;
SoundFile coinSfx;
Coin coin;
Hero character;

void setup(){
  size(400, 400);
  map = loadImage("sample_map.png");
  coinSfx = new SoundFile(this, "data/coin_c_02-102844.wav");
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
