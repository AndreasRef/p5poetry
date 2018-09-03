// Using PFont to select the font to display. 

// Fonts must be located in the sketch's "data" directory to load successfully

// Use Sketch > Show Sketch Folder to see the current fonts in the data folder.
// Use Tools > Create Font to add a new font 

// Create a PFont object
PFont font; 


size (600, 600); 
background (255); 
fill (25);

// load a font (must be in the 'data' folder) 
font = loadFont ("ACaslonPro-SemiboldItalic-120.vlw");
// select the loaded font as the text font (and specify a size)
textFont (font, 100);
// draw text on the screen:
text ("Carson Pro", 50, 150); 

// change font 
font = loadFont ("AmericanTypewriter-120.vlw");
textFont (font, 80);
text ("Typewriter", 50, 300); 


// change font again
font = loadFont ("Avenir-Medium-120.vlw");
textFont (font, 80);
text ("Avenir Medium", 50, 450); 