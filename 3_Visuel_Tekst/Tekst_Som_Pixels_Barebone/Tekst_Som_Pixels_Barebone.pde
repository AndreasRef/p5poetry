String inputText = "Ihr naht euch wieder, schwankende Gestalten, Die früh sich einst dem trüben Blick gezeigt. Versuch ich wohl, euch diesmal festzuhalten? Fühl ich mein Herz noch jenem Wahn geneigt? Ihr drängt euch zu! nun gut, so mögt ihr walten, Wie ihr aus Dunst und Nebel um mich steigt; Mein Busen fühlt sich jugendlich erschüttert Vom Zauberhauch, der euren Zug umwittert. Ihr bringt mit euch die Bilder froher Tage, Und manche liebe Schatten steigen auf; Gleich einer alten, halbverklungnen Sage Kommt erste Lieb und Freundschaft mit herauf; Der Schmerz wird neu, es wiederholt die Klage.";
float fontSizeMax = 30;
float fontSizeMin = 10;
float spacing = 12; // line height
float kerning = 0.5; // between letters

boolean fontSizeStatic = false;
boolean blackAndWhite = true;

PFont font;
PImage img;

void setup() {
  size(1280,720);
  smooth(); 
  
  font = createFont("Times",10);
  
  img = loadImage("nanna_black_1080.jpg");
  println(img.width+" x "+img.height);
}

void draw() {
  
  surface.setTitle(int(frameRate) + " fps");
  
  background(0);
  textAlign(LEFT);
  //textAlign(LEFT,CENTER); //// also nice!
  
  float displayOffSetX = (width - img.width)/2;
  float displayW =  img.width + displayOffSetX; //width/2 + displayOffSetX;
  
  float x = displayOffSetX, y = 10;
  int counter = 0;
  


  while (y < height) {
    // translate position (display) to position (image)
    int imgX = (int) map(x, displayOffSetX,displayW, 0,img.width);
    int imgY = (int) map(y, 0,height, 0,img.height);
    // get current color
    color c = img.pixels[imgY*img.width+imgX];
    int greyscale = round(red(c)*0.222 + green(c)*0.707 + blue(c)*0.071);

    pushMatrix();
    translate(x, y);

    if (fontSizeStatic) {
      textFont(font, fontSizeMax);
      if (blackAndWhite) fill(255-greyscale);
      else fill(c);
    } 
    else {
      // greyscale to fontsize
      float fontSize = map(255-greyscale, 0,255, fontSizeMax,fontSizeMin);
      fontSize = max(fontSize, 1);
      textFont(font, fontSize);
      if (blackAndWhite) fill(255, min(255,map(fontSize, fontSizeMin, fontSizeMax, 0,555)));
      else fill(c);
    } 

    char letter = inputText.charAt(counter);
    text(letter, 0, 0);
    float letterWidth = textWidth(letter) + kerning;
    // for the next letter ... x + letter width
    x = x + letterWidth; // update x-coordinate
    popMatrix();

    // linebreaks
    if (x+letterWidth >= displayW) {
      x = displayOffSetX;
      y = y + spacing; // add line height
    }

    counter++;
    if (counter > inputText.length()-1) counter = 0;
  }
}


void keyReleased() {
  // change render mode
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color stlye
  if (key == '2') blackAndWhite = !blackAndWhite;
  println("fontSizeMin: "+fontSizeMin+"  fontSizeMax: "+fontSizeMax+"   fontSizeStatic: "+fontSizeStatic+"   blackAndWhite: "+blackAndWhite);
}

void keyPressed() {
  // change fontSizeMax with arrowkeys up/down 
  if (keyCode == UP) fontSizeMax += 2;
  if (keyCode == DOWN) fontSizeMax -= 2; 
  // change fontSizeMin with arrowkeys left/right
  if (keyCode == RIGHT) fontSizeMin += 2;
  if (keyCode == LEFT) fontSizeMin -= 2; 

}