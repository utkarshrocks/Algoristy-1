class Data{
  String Key = ApiKey;
  String Country = "in";
  String sortby = "PublishedAt";
  String lang = "en";
  String Category = "General";
  bool search_querry = true;
  String channel = "All";
  bool Category_search = false;
  bool Country_search = false;
}

class Article{
  String title;
  String description;
  String urlToImage;
  String articleUrl;
  Article({this.title,this.description, this.urlToImage, this.articleUrl});
}

String ApiKey=  "82d3f17593bb4e10add10027e7b4ddb3";