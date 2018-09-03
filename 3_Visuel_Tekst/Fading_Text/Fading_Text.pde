float angle;
PFont font; 

String [] words;

int currentWord = 0;

void setup()
{
  size(600, 600);
  
  //Load words from text string and split them
  String[] lines = loadStrings("Faust.txt");
  // join all lines to a big string
  String joinedText = join(lines, " ");
  // replacings
  joinedText = joinedText.replaceAll("_", "");  
  // split tex into words by delimiters
  words = splitTokens(joinedText, " ¬ª¬´‚Äì_-–().,;:?!\u2014\"");
  
  
  frameRate(10);
  smooth();
  font = loadFont("Roboto-Regular-100.vlw"); // load font from Tool->Create Font
}

void draw()
{  
  noStroke();
  fill(0, 25, 50, 20); // adds halo or transparecy
  rect(0, 0, width, height); 
    
  rotate(random(-1,+1)); // rotate text random
  fill(155);
  textSize(random(300));
  textAlign(CENTER, CENTER);
  text(words[currentWord], random(width), random(height));
  
  if (currentWord < words.length) {
   currentWord++; 
  } else {
    currentWord = 0;
  }
  
}