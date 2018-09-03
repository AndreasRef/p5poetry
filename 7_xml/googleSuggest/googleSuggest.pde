String inputText = "";

// The URL for the XML document
String url = "http://suggestqueries.google.com/complete/search?output=toolbar&hl=dk&q="; 

// GoogleSuggest Variabler
PFont font;

String displayString ="";
String queryString ="";
String[] results = new String[1];

void setup() {
  size(600, 360);
}

void draw() {
  background(255);
  fill(0);
  text("Input: " + inputText, 10, 20);
  text("Output:" + queryString, 10, 60);

  for (int i = 0; i < results.length; i++) {
    if (results[i] != null) {
      text("" + results[i], 75, 60+(i*20));
    }
  }
}


String[] getSuggestions(String term) {

  if (term.length() > 0) {
    try {
      XML xml = loadXML(url + java.net.URLEncoder.encode(term, "UTF-8"));
      println(xml);
      XML[] children = xml.getChildren("CompleteSuggestion");

      String[] resultStrings = new String[children.length];

      for (int i = 0; i < children.length; i++) {
        XML suggestion = children[i].getChild("suggestion");
        println(suggestion);
        resultStrings[i] = suggestion.getString("data");
      }
      return resultStrings;
    }
    catch(Exception e) {
      e.printStackTrace();
      return new String[1];
    }
  }
  else {
    return new String[1];
  }
}




void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      inputText = inputText.substring(0, max(0, inputText.length()-1));
      break;
    case ENTER:
    case RETURN:
      if (inputText.length() > 0) {
        results = getSuggestions(inputText);
        queryString = "";
        inputText = "";
      }
      break;
    case ESC:
    case DELETE:
      break;
    case TAB:

    default:
      inputText += key;
    }
  }
}