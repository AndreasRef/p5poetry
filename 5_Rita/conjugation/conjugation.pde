//https://rednoise.org/rita/reference/RiTa/RiTa.conjugate/index.php

import java.util.Map;
import rita.*;

String word = "swim";
RiLexicon lexicon;

Map args = new HashMap();

void setup()
{
  size(300, 500);
  fill(255);

  lexicon = new RiLexicon();
  textSize(24);
  args.put("tense", RiTa.PAST_TENSE);
  args.put("number", RiTa.SINGULAR);
  args.put("person", RiTa.FIRST_PERSON);
}

void draw()
{
  background(40);
  
  //Original word
  text("original: " + word, 10, 50);
  
  //Word conjugated
  text("conjugated: " + RiTa.conjugate("swim", args), 10, 100);
}