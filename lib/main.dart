import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:weather/services/mint.dart';


void main() async{
  runApp(MyApp());
  //getData ();

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Expansion Tile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  late String data;
  var value_length;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response =
    await http.get(Uri.parse(
        'https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-063?Authorization=CWB-AF051CEE-9972-4C1E-92FB-FF0604BAED32&format=JSON&locationName=%E5%8D%97%E6%B8%AF%E5%8D%80&elementName=MinT'
    ));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      print(data);
      setState(() {
        value_length = jsonDecode(data)['records']; //get all the data from json string superheros
        print(value_length.length); // just printed length of data
      });
      var venam = jsonDecode(data)['records'][4]['url'];
      print(venam);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('南港區天氣預報'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        children: [
          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: RoundedExpansionTile(
              leading: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('未來7天的最高溫度'),
              subtitle: Text('in card'),
              children: [
                for (var i = 0; i <7 ; i++)
                  ListTile(
                    title: Text('Child $i'),
                  )
              ],
            ),
          ),
          Divider(height: 20),
          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: RoundedExpansionTile(
              leading: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('未來7天的最低溫度'),
              subtitle: Text('In card'),
              children: [
                for (var i = 0; i < 7; i++)
                  ListTile(
                    title: Text('Child $i'),
                  )
              ],
            ),
          ),
          Divider(height: 20),
          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: RoundedExpansionTile(
              leading: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('12小時降雨機率'),
              subtitle: Text('In card'),
              children: [
                for (var i = 0; i < 5; i++)
                  ListTile(
                    title: Text('Child $i'),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// void getData() async {
//     var url = Uri.parse('https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-063?Authorization=CWB-AF051CEE-9972-4C1E-92FB-FF0604BAED32&format=JSON&locationName=%E5%8D%97%E6%B8%AF%E5%8D%80&elementName=MinT');
//     var reponse = await http.get(url);
//     print("reponse: ");
//     print(reponse.body);
// }


