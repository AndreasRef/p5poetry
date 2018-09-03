//https://rednoise.org/rita/reference/index.php

import rita.*;

String sentence = "The hot guy is rich: He likes expensive cars";
RiLexicon lexicon;

void setup()
{
  size(600, 500);
  fill(255);

  lexicon = new RiLexicon();
  textSize(16);
  
  print(RiTa.stem("likes"));
}

void draw()
{
  background(40);
  
  //Original sentence
  text(sentence, 10, 50);
  
  String[] words = RiTa.tokenize(sentence);
  
  for (int i = 0; i<words.length; i++) {
    if (lexicon.isNoun(words[i]) && !lexicon.isVerb(RiTa.stem(words[i]))) {
      words[i] = "hamburger";
    }
  }
  
  String newSentence = RiTa.untokenize(words);
  text(newSentence, 10, 100);
}