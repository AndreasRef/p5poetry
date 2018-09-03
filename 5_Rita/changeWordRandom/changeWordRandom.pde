import rita.*;

String word = "apple";

void setup()
{
  size(500, 500);
  fill(255);
  textSize(24);
  frameRate(2);
}

void draw()
{
  background(40);
  
  //Original word
  text("original word: " + word, 10, 50);
  
  //Word pluralized
  text("pluralized word: " + RiTa.pluralize(word), 10, 100);
  
  //Word with similar letters
  String simLetters[] = RiTa.similarByLetter(word);
  text("similar letters: " + simLetters[floor(random(simLetters.length))], 10, 150);
  
  //Word with similar sound
  String simSounds[] = RiTa.similarBySound(word);
  text("similar sound: " + simSounds[floor(random(simSounds.length))], 10, 200);

  //Word that rhymes
  String [] rhymesWith = RiTa.rhymes(word);
  text("word that rhimes: " + rhymesWith[floor(random(rhymesWith.length))], 10, 250);
}