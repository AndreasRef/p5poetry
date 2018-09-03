// Splitting strings 
// This example uses the charAt ( ) function to find each individual letter in a string 
// Each letter is individually drawn at a random size and with a random greyscale value.

PFont font; 
size (600, 600); 
background (255); 

// load and select the font. 
font = loadFont ("ACaslonPro-SemiboldItalic-120.vlw"); 
textFont (font, 60);

// ----------------------------- //

float xloc = 20;  // the x location of the first letter.
String message = "random letters";

// individual letters can be found using the charAt( ) function: 
println (message.charAt(0)); // gets the first character in the string ('r'); 
println (message.charAt(1)); // gets the second character in the string ('a'); 
println (message.charAt(2)); // gets the third character in the string ('n'); 

// the length() function can find out the total 'length' of the string --
// i.e. how many characters it contains:
println ("total number of characters = " + message.length()); 

// ----------------------------- //

// A 'for' loop can be used to get each cycle through the string & get each character in turn 
// Each letter can be individually displayed at a random size and color:
for (int i=0; i<message.length(); i++) { 
  char letter=message.charAt(i);     // get the current letter
  
  fill (random (200));              // select a random fill colour
  textSize(random (40, 150));       // select a random text size
  text (letter, xloc, 300);         // display the letter 
  
  xloc += textWidth (letter);       // set the next x position for the next letter
} 