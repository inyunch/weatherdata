import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



void main() async{
  runApp(MyApp());
  //ApiData();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Expansion Tile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  // Future<List<ElementValue>> _getMint() async {
  //   var url = Uri.parse('https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-063?Authorization=CWB-AF051CEE-9972-4C1E-92FB-FF0604BAED32&format=JSON&locationName=%E5%8D%97%E6%B8%AF%E5%8D%80&elementName=MinT');
  //   var reponse = await http.get(url);
  //
  //   print("reponse: ");
  //   print(reponse.body);
  //
  //   var jsonData = json.decode(reponse.body);
  //
  //   List<ElementValue> mints = [];
  //
  //   for (var mint in jsonData["elementValue"]){
  //     ElementValue newMint = ElementValue(measures: '',value: '');
  //     mints.add(newMint);
  //   }
  //
  //   return mints;
  // }

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
              //subtitle: Text(),
              subtitle: Text(_getMint()),
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


// class Mint {
//   Mint({
//     required this.success,
//     required this.result,
//     required this.records,
//   });
//
//   String success;
//   Result result;
//   Records records;
// }
//
// class Records {
//   Records({
//     required this.locations,
//   });
//
//   List<RecordsLocation> locations;
// }
//
// class RecordsLocation {
//   RecordsLocation({
//     required this.datasetDescription,
//     required this.locationsName,
//     required this.dataid,
//     required this.location,
//   });
//
//   String datasetDescription;
//   String locationsName;
//   String dataid;
//   List<LocationLocation> location;
// }
//
// class LocationLocation {
//   LocationLocation({
//     required this.locationName,
//     required this.geocode,
//     required this.lat,
//     required this.lon,
//     required this.weatherElement,
//   });
//
//   String locationName;
//   String geocode;
//   String lat;
//   String lon;
//   List<WeatherElement> weatherElement;
// }
//
// class WeatherElement {
//   WeatherElement({
//     required this.elementName,
//     required this.description,
//     required this.time,
//   });
//
//   String elementName;
//   String description;
//   List<Time> time;
// }
//
// class Time {
//   Time({
//     required this.startTime,
//     required this.endTime,
//     required this.elementValue,
//   });
//
//   DateTime startTime;
//   DateTime endTime;
//   List<ElementValue> elementValue;
// }
//
// class ElementValue {
//   ElementValue({
//     required this.value,
//     required this.measures,
//   });
//
//   String value;
//   String measures;
// }
//
// class Result {
//   Result({
//     required this.resourceId,
//     required this.fields,
//   });
//
//   String resourceId;
//   List<Field> fields;
// }
//
// class Field {
//   Field({
//     required this.id,
//     required this.type,
//   });
//
//   String id;
//   String type;
// }

class ApiDate {
  void getDate() async {
    var url = Uri.parse('https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-063?Authorization=CWB-AF051CEE-9972-4C1E-92FB-FF0604BAED32&format=JSON&locationName=%E5%8D%97%E6%B8%AF%E5%8D%80&elementName=MinT');
    var reponse = await http.get(url);
    print("reponse: ");
    print(reponse.body);
  }
}
