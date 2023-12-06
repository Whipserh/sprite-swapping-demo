enum Direction {
  SOUTH, WEST, EAST, NORTH, SE, SW, NW, NE
};
class Hero {
  int frames;
  Direction direction;
  PVector position;
  PVector velocity;
  int speed = 2;

  int xWidth = 64; //width of each frame on the spritesheet
  int yHeight = 64; //height of each frame on the spritesheet

  Hero() {
    characterSheet = loadImage("stella_walk.png");
    xOffset = 0;
    yOffset = 0;
    fWidth = characterSheet.width/4;
    fHeight = characterSheet.height/8;
    frames = 0;
    direction = Direction.SOUTH;
    position = new PVector(width/2, height/2);
    velocity = new PVector();
  }

  void move() {
    //why am I making a new vector now ? Because I want to normalize it to keep the diagonal
    //movement at the same speed as orthogonal movement. BUT if I were to normalise the vector
    //velocity this would mess up my += and -= math on the keystrokes (because the values
    //would start to be less than 1 when moving diagonally, so the keystrokes wouldn't cancel
    //each other out.
    PVector movement = velocity.copy();
    movement.setMag(speed); //setMag does .normalize() and then .mult(speed) :-)
    position.add(movement);
    if (movement.x == 0 && movement.y == 0) {
      frames = 0;
    }
    if ((frames == 1 || frames == 3)&& !step.isPlaying()){
      step.rate(random(0.9, 1.1));
      step.play();
    }
    //SOUTH, WEST, EAST, NORTH, SE, SW, NW, NE
    if( velocity.x == 0 && velocity.y == 1){
     direction = Direction.SOUTH; 
    }else if(velocity.x == -1 && velocity.y == 0){
     direction = Direction.WEST; 
    }else if(velocity.x == 1 && velocity.y == 0){
     direction = Direction.EAST; 
    }else if(velocity.x == 0 && velocity.y == -1){
     direction = Direction.NORTH; 
    }else if(velocity.x == 1 && velocity.y == 1){
     direction = Direction.SE; 
    }else if(velocity.x == -1 && velocity.y == 1){
     direction = Direction.SW; 
    }else if(velocity.x == -1 && velocity.y == -1){
     direction = Direction.NW; 
    }else if(velocity.x == 1 && velocity.y == -1){
     direction = Direction.NE; 
    }
    
    
  }

  void display() {
    fill(255);
    //rect(position.x - xWidth/4, position.y - 0.9 * yHeight, xWidth/2, yHeight);

    copy(characterSheet, xOffset + (frames * fWidth), 
    yOffset +yHeight* direction.ordinal(), fWidth, fHeight, int(position.x - xWidth/4), int(position.y - 0.9 * yHeight), int(xWidth/2), yHeight);

    if (frameCount % 10==0) {
      frames = (frames + 1)% 4;
    }
  }
}
