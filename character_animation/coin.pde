class Coin {
  PVector position;
  float r = 10;
  PImage [] image;
  int frames;
  Coin(){
    frames = 0;
    position = new PVector(random(width-50), random(height-50));
    image = new PImage[6];
    for(int i = 0; i< image.length; i++){
    image[i] = loadImage("star coin rotate "+ (i+ 1)+".png");
    }
  }
  
  void display(){
    fill(250, 255, 5);
    imageMode(CENTER);
    //circle(position.x, position.y, 2*r);
    image(image[frames], position.x, position.y);
    if(frameCount % 10 == 0){ 
      frames = (frames + 1) % image.length;
    }
  }
  
  boolean collision(float x, float y, float w, float h){
    //remember that we're drawing her at
    //rect(x - w/4, y - 0.9 * h, w/2, h);
    //debug: show the hitbox diagonal:
    //line((x - w/4), (y - 0.9 * h), (x + w/4), (y - 0.9 * h) + h);
    if((x - w/4) < position.x - r && (x + w/4) > position.x + r
        && (y - 0.9 * h) < position.y - r && (y - 0.9 * h) + h > position.y + r){
      coinSfx.play();
          return true;
    }
    else return false;
  }

}
