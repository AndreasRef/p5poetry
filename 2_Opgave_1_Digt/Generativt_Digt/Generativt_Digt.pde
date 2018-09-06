PFont f;

String [] firstWords = { //ejestedord
  "deres", "byens", "min", "hans", "farmors"};

String [] secondWords = { //tillægsord
  "store", "behårede","blå","skræmmende","grønne", "søde","grædende","flotte"};

String [] thirdWords = { //navneord
  "kat", "hund","fisk","aubergine", "postmand", "traktor"};
  
String [] fourthWords = { //udsagnsord
  "hikker", "knipser","danser","spiser","sluprer","drømmer"};
  
String [] fifthWords = { //tillægsord
  "elegant", "langsomt","skørt","alene","flot", "skønt"};

PImage [] images = new PImage[5];

void setup() {
  size(600, 600);
  f = loadFont("SourceSansPro-Regular-72.vlw");
  textFont(f);
  
  for (int i = 0; i<images.length; i++) {
    images[i] = loadImage(i + ".jpg");
  } 
  noLoop();
}

void draw(){
  
  image(images[(int)random(images.length)],0,0);
  filter(BLUR, 2);
  fill(255);
  
  String word1 = firstWords[int(random(firstWords.length))];
  String word2 = secondWords[int(random(secondWords.length))];
  String word3 = thirdWords[int(random(thirdWords.length))];
  String word4 = fourthWords[int(random(fourthWords.length))];
  String word5 = fifthWords[int(random(fifthWords.length))];
  
  text(word1,50,100); 
  text(word2,50,200);
  text(word3,50,300);
  text(word4,50,400);
  text(word5,50,500);

}

void mouseReleased(){
 redraw(); 
}