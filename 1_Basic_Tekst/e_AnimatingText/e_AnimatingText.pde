// Animating Text. 

// Similar to splitting strings 
// this example re-draws the word within the draw( ) function 
// each time the word is drawn, new random x and y values are used 

PFont font; 

float xloc = 20;  // the starting x location  
String message = "animated letters"; // the string of characters to be animated

void setup ( ) { 
  size (600, 600); 
  background (255); 
  
  // select a font.
  font = loadFont ("ACaslonPro-SemiboldItalic-120.vlw");   
  textFont (font, 80);
} 

void draw ( ) { 
  background (255);
  fill (50);
  
  // cycle through string of letters
  for (int i=0; i<message.length(); i++) { 
    // get letter.
    char letter=message.charAt(i); 
    
    // generate a random x and y offset amount
    float xOffset = random (-2, 2);
    float yOffset = random (-8, 8);
    // draw letter with random x y offset 
    text (letter, xloc+xOffset, 300+yOffset);  
    
    // set the x position of the next letter
    xloc += textWidth (letter); 
  }
  
  // reset the x location before redrawing the whole word again
  xloc = 20;
}