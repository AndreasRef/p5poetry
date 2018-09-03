// P_2_3_3_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//Tweaked by Andreas Refsgaard - 2018

XML xml;
String[] headlines = {};

float x = 0, y = 0;
float stepSize = 5.0;

PFont font;
int fontSizeMin = 5;
float angleDistortion = 0.0;
int counter = 0;
int articleCounter = 10;

void setup() {
  size(800,600,P2D);
  background(255);
  smooth();
  cursor(CROSS);
  
  xml = loadXML("http://ekstrabladet.dk/rssfeed/Verden_p__vrangen_RSS/");
  XML[] titles = xml.getChildren("channel/item/title");
  
  for (int i = 0; i < titles.length; i++) {    
    headlines = append(headlines,titles[i].getContent());
  }
  
  font = loadFont("Times-Roman-72.vlw");
  textFont(font,fontSizeMin);
  textAlign(LEFT);
  fill(0);
}


void draw() {
  if (mousePressed) {
    float d = dist(x,y, mouseX,mouseY);
    textFont(font,fontSizeMin+d/2);
    if (counter >= headlines[articleCounter].length()-1) counter = 0;
    char newLetter = headlines[articleCounter].charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter >= headlines[articleCounter].length()-1) counter = 0;
      
      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }
}


void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void mouseReleased() {
  articleCounter++;
  counter = 0;
  
  if (articleCounter> (headlines.length-1)) {
    articleCounter = 0;
  }
  println(articleCounter);
}


void mouseClicked() {
 //saveFrame("#####.png");
 background(255); 
}