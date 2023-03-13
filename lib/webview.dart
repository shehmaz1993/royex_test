import 'package:flutter/material.dart';
import 'package:royex_test/repository/repository.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
   Repository repo=Repository();
   Map<String,dynamic>? map;
  @override
  void initState() {
    // TODO: implement initState
    repo.fetchMap().then((value){
      if(map==null){
        setState(() {
          map=value;
        });
      }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(map!=null){
      return Scaffold(
        body:WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            controller.loadString(map!['body_html']);
          },
        ) ,
      );
    }
    else{
      return const Center(child: CircularProgressIndicator(),);
    }
  }
}
