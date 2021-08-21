import 'dart:convert';
import 'package:country_details/components/custom_progress_handler.dart';
import 'package:country_details/components/flushbar_message.dart';
import 'package:country_details/contants/http_status_codes.dart';
import 'package:country_details/contants/internet_connection.dart';
import 'package:country_details/contants/message_types.dart';
import 'package:country_details/handlers/network_handler.dart';
import 'package:country_details/models/countries.dart';
import 'package:country_details/page/counties_page.dart';
import 'package:country_details/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AllRegionPage extends StatefulWidget {
  @override
  _AllRegionPagePageState createState() => _AllRegionPagePageState();
}

class _AllRegionPagePageState extends State<AllRegionPage> {
  GlobalKey<ScaffoldState> _countryPageGlobalKey;
  bool _isLoading;
  String _loadingText;
  List<Countries> countriesList = [];
  List<String> filterRegionList = [];
  List<String> regionList = [];
  List regionColors = [
    Colors.lightBlue[800],
    Colors.amber[800],
    Colors.lime[800],
    Colors.cyan[800],
    Colors.pink[800],
    Colors.brown[800],
    Colors.teal[800],
    Colors.deepOrange[800],
    Colors.blue[800],
    Colors.lightGreen[800],
    Colors.red[800],
    Colors.yellow[800],
    Colors.indigo[800],
    Colors.purple[800],
    Colors.blueGrey[800],
    Colors.green[800],
  ];

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _loadingText = 'Loading . . .';
    _countryPageGlobalKey = new GlobalKey<ScaffoldState>();
    getCountriesDtlList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressHandler(
        isLoading: this._isLoading,
        loadingText: this._loadingText,
        child: Scaffold(
            key: _countryPageGlobalKey,
            backgroundColor: AppTheme.backgroundColor,
            appBar: AppBar(
              title: Text(
                "Select a Region",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            body: Container(
              child: ListView.builder(
                itemCount: filterRegionList.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (BuildContext context, int index) {
                  Color color = regionColors[index];
                  return  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    child: Container(
                      decoration: BoxDecoration( color: color,
                          borderRadius: BorderRadius.all(Radius.circular(14))
                      ),
                      child: ListTile(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CountiesPage(
                                  color: color,
                                  region: filterRegionList[index],
                                  countriesList: countriesList,
                                ),
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(width: 1.0, color: Colors.white))),
                            child: Icon(Icons.location_on_outlined, color: Colors.white),
                          ),
                          title: Text(
                            filterRegionList[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.start,
                          ),
                          trailing:
                          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
                    ),
                  );
                },
              ),
            )));
  }
  Future<void> getCountriesDtlList() async {
    try {
      setState(() {
        _isLoading = true;
      });

      String connectionStatus = await NetworkHandler.checkInternetConnection();
      if (connectionStatus == InternetConnection.CONNECTED) {
        Uri uri = Uri.parse(
          "https://restcountries.eu/rest/v2/all",
        );

        Response response;
        response = await get(uri);

        if (response.statusCode != HttpStatusCodes.OK) {
          FlushbarMessage.show(
            context,
            "Country List Not Available",
            MessageTypes.WARNING,
          );
        } else {
          var data = json.decode(response.body);
          setState(() {
            countriesList =
                List<Countries>.from(data.map((i) => Countries.fromMap(i)));
            regionList = countriesList.map((e) => e.region).toSet().toList();
            regionList = regionList
                .where((i) => i != '')
                .toList();
            filterRegionList.addAll(regionList);
          });
        }
      } else {
        FlushbarMessage.show(
          context,
          "Please check your wifi or mobile data is active.",
          MessageTypes.WARNING,
        );
      }
    } catch (e) {
      FlushbarMessage.show(
        context,
        e.toString(),
        MessageTypes.WARNING,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
