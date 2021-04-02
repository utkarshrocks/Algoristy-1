import 'package:datawiz/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full News"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh,size: 30.0,),
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.pushNamed(context, FullNewsRouteCode);
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}