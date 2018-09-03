XML xml;
String[] myTitles = {};

void setup() {
  size(600, 600);
  xml = loadXML("http://ekstrabladet.dk/rssfeed/Verden_p__vrangen_RSS/");
  //xml = loadXML("http://feeds.bbci.co.uk/news/technology/rss.xml");

  XML[] titles = xml.getChildren("channel/item/title");

  println(xml);

  for (int i = 0; i < titles.length; i++) {    
    myTitles = append(myTitles,titles[i].getContent());
  }
}

void draw() {
  background(122);
  for (int i = 0; i< myTitles.length; i++) {
    text(myTitles[i], 25, 25*i + 25);
  }
}