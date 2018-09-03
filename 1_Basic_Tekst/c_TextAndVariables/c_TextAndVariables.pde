// Text and Variables 

// This example shows how variable values can be used to set 
// and change the x, y position of text on the screen.

PFont font;  // create a PFont object

float xpos = 0; // create starting x position for the text.
String displayMessage = "tickertape text"; // create a message to display

void setup( ) { 
  size (300, 300); 
  background (255); 

  // load and select the font to use
  font = loadFont ("ACaslonPro-Italic-30.vlw");
  textFont (font, 30);
} 


void draw( ) { 
  background (255); 
  fill (25); 

  // draw text at the mouse position.
  text ("follow mouse", mouseX, mouseY);


  // draw text using the value of xpos and the String 'displayMessage'
  text (displayMessage, xpos, 150); 
  // increase xpos to move across the screen
  xpos += 2;
  // re-set if it goes off the edge of the screen
  if (xpos > width) { 
    xpos = -120;
  }
} 