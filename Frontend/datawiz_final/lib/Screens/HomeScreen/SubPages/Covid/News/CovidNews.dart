import 'package:datawiz_final/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

class CovidNews extends StatefulWidget {
  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {

  bool loading = true;
  String OurQuery = "Covid 19";
  bool isQuery = true;
  TextEditingController QueryController = TextEditingController();
  final GlobalKey<ScaffoldState> Drawer_key = new GlobalKey<ScaffoldState>();

  Widget get_nav_drawer(BuildContext context) {
    var headerChild = DrawerHeader(
      child: Text(
        "Menu",
        style: TextStyle(
          fontSize: 25.0,
          fontFamily: "SplashFont",
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        image: DecorationImage(image: AssetImage("Assets/Images/Background/Coronavirus_Covid-19.png"))
      ),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        tileColor: Colors.grey[800],
        leading: Icon(icon,color: Colors.white,),
        title: Text(s,style: TextStyle(color: Colors.white),),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            Navigator.of(context).pop(true);
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(
          Icons.flag,
          "Country:- ${(data.search_querry) ? "Querry Search" : data.Country}",
          CountryNewsRouteCode),
      getNavItem(
          Icons.featured_play_list,
          "Channel:- ${(!data.Category_search) ? "All" : data.channel.split(".")[0]}", ChannelNewsRouteCode),
      getNavItem(Icons.assessment, "Worldometer", WorldomerRouteCode),
    ];

    ListView listView = ListView(children: myNavChildren);

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.grey[800], //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
        child: listView,
      ),
    );
  }

  void GetNews(String querry){
    if(data.search_querry) News.querry_news(querry).then((value){
      setState(() {
        loading = false;
      });
    });
    else if(data.Country_search){
      News.all_news().then((value){
        if(articles.isEmpty){
          data.Country_search = false;
          data.search_querry = true;
          News.querry_news(querry).then((value){
            setState(() {
              loading = false;
            });
          });
        }
        else{
          setState(() {
            loading = false;
          });
        }
      });
    }
    else{
      News.channel_news().then((value){
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  void initState() {
    GetNews("Covid 19");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (loading)?
    Container(
      width: ScreenWidth,
      height: ScreenHeight,
      color: Colors.black,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    )
        :Scaffold(
            key: Drawer_key,
            drawer: get_nav_drawer(context),
            resizeToAvoidBottomInset: false,
            body: Container(
              width: ScreenWidth,
              height: ScreenHeight,
              color: Colors.grey[900],
              child: Column(children: [
                Container(
                  height: 135,
                  color: Colors.grey[900],
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: IconButton(
                                icon: Icon(Icons.list,size: 45,color: Colors.white,),
                                onPressed: (){
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Drawer_key.currentState.openDrawer();
                                }
                            ),
                          ),
                          Text("News",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontFamily: "SplashFont",
                            ),),
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            child: IconButton(
                                icon: Icon(Icons.refresh,size: 30,color: Colors.white,),
                                onPressed: (){
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  setState(() {
                                    loading = true;
                                  });
                                  GetNews(OurQuery);
                                }
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: ScreenWidth,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: TextFormField(
                          controller: QueryController,
                          onFieldSubmitted: (val){
                            setState(() {
                              data.search_querry = true;
                              data.Country_search = false;
                              data.Category_search = false;
                              FocusScope.of(context).requestFocus(new FocusNode());
                              loading = true;
                              OurQuery = QueryController.text;
                            });
                            GetNews(OurQuery);
                          },
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[850],
                  width: ScreenWidth,
                  height: MediaQuery.of(context).size.height - 135,
                  child: (articles.length > 0)
                      ? ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              newsUrl = articles[index].articleUrl;
                            });
                            Navigator.pushNamed(context, FullNewsRouteCode);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Column(
                              children: [
                                (articles[index].urlToImage == null)?
                                    Image.asset("Assets/Images/Background/no_img.jpg",width: ScreenWidth-100,height: ScreenWidth,fit: BoxFit.fill,)
                                    :Image.network(articles[index].urlToImage,height: ScreenWidth-100,width: ScreenWidth,fit: BoxFit.fill,),
                                SizedBox(width: 20,),
                                Container(
                                  width: ScreenWidth,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(articles[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),maxLines: 4,overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 10,),
                                      Text(articles[index].description,style: TextStyle(color: Colors.grey,fontSize: 15),maxLines: 4,overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                      : Center(
                    child: Image.asset(
                        "Assets/Images/Background/nothingFound.png"),
                  ),
                ),
              ],),
            ),
    );
  }
}
