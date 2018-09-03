//https://rednoise.org/rita/reference/index.php
import rita.*;

String word = "apple";

void setup()
{
  size(500, 500);
  fill(255);
  textSize(24);
}

void draw()
{
  background(40);
  
  //Original word
  text("original word: " + word, 10, 50);
  
  //Word pluralized
  text("pluralized word: " + RiTa.pluralize(word), 10, 100);
  
  //Word with similar letters
  text("similar letters: " + RiTa.similarByLetter(word)[0], 10, 150);
  
  //Word with similar sound
  text("similar sound: " + RiTa.similarBySound(word)[0], 10, 200);

  //Word that rhymes
  text("word that rhimes: " + RiTa.rhymes(word)[0], 10, 250);
}