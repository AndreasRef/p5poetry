XML xml;
String[] myTitles = {};

void setup() {
  size(600, 600);
  background(0);
  xml = loadXML("http://ekstrabladet.dk/rssfeed/Verden_p__vrangen_RSS/");
  //xml = loadXML("http://feeds.bbci.co.uk/news/technology/rss.xml");

  XML[] titles = xml.getChildren("channel/item/title");

  //println(xml);

  for (int i = 0; i < titles.length; i++) {    
    myTitles = append(myTitles,titles[i].getContent());
  }
  
  println(myTitles[0]);
  println(myTitles[1]);
  
  String[] firstSentenceSplitted = trim(split(myTitles[0], ':'));
  String[] secondSentenceSplitted = trim(split(myTitles[1], ':'));
  
  //println(firstSentenceSplitted[0]);
  //println(firstSentenceSplitted[1]);
  
  String mashup = firstSentenceSplitted[0] + ": " + secondSentenceSplitted[1];
  
  println(mashup);
  
  text(myTitles[0], 10, 10);
  text(myTitles[1], 10, 60);
  
  text(mashup, 10, 160);
  
}

//void draw() {
//  background(122);
//  for (int i = 0; i< myTitles.length; i++) {
//    text(myTitles[i], 25, 25*i + 25);
//  }
//}