import processing.video.*;

int videoScale = 10;
int cols, rows;
Capture video;

void setup() {
  size(640, 480);
  cols = width / videoScale;
  rows = height / videoScale;
  video = new Capture(this, cols, rows);
  video.start();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(229,28,193);
  video.loadPixels();

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      int x = i * videoScale;
      int y = j * videoScale;

      int loc = (video.width - i - 1) + j*video.width;

      color c = video.pixels[loc];

      float sz = (brightness(c)/255)*videoScale; 
      ellipseMode(CENTER);
      fill(255);
      noStroke();
      ellipse(x + videoScale/2, y + videoScale/2, sz, sz);
    }
  }
}
