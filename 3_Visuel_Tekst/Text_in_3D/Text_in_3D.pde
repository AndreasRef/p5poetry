String[] words = {"Hope", "Fear", "Loss", "Money", "Aspiration", "Greed", "Hope", "Fear", "Loss", "Money", "Aspiration", "Greed", "Baby", "Taxes", "Moan", "Stars", "Debit", "Credit"};
PVector[] positions = new PVector [words.length];

int margin = 50;

void setup() {
  size(800, 600, P3D);
  textAlign(CENTER, CENTER);
  textSize(24);
  
  for (int i = 0; i<words.length; i++) {
    positions[i] = new PVector(random(margin, width-margin), random(margin, height-margin), 0);
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i<words.length; i++) {
    pushMatrix();
    translate(positions[i].x, positions[i].y, sin(radians(frameCount))*50);
    if (i%2 == 0) {
    rotateY(sin(radians(frameCount)));
    } else {
    rotateY((radians(frameCount)));
    }
    text(words[i], 0, 0);
    popMatrix();
  }
}

void mousePressed() {
    for (int i = 0; i<words.length; i++) {
    positions[i].x = random(margin, width - margin);
    positions[i].y = random(margin, height - margin);
    positions[i].z = 0;
  }
}