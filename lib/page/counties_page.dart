import 'package:country_details/components/custom_progress_handler.dart';
import 'package:country_details/components/flushbar_message.dart';
import 'package:country_details/contants/message_types.dart';
import 'package:country_details/models/countries.dart';
import 'package:country_details/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'country_details_page.dart';

class CountiesPage extends StatefulWidget {
  final Color color;
  final String region;
  List<Countries> countriesList = [];

  CountiesPage({
    this.color,
    this.region,
    this.countriesList,
  });

  @override
  _CountiesPageState createState() => _CountiesPageState();
}

class _CountiesPageState extends State<CountiesPage> {
  GlobalKey<ScaffoldState> _countryPageGlobalKey;
  TextEditingController filterController;
  bool _isLoading;
  String _loadingText;
  List<Countries> filterCountriesList = [];

  @override
  void initState() {
    super.initState();
    filterController = new TextEditingController();
    filterController.addListener(() {
      setState(() {
        if (filterController.text != "") {
          filterCountriesList = widget.countriesList
              .where((i) => i.name
                  .toLowerCase()
                  .contains(filterController.text.toLowerCase()))
              .toList();
        } else {
          filterCountriesList.addAll(widget.countriesList);
        }
      });
    });
    _isLoading = false;
    _loadingText = 'Loading . . .';
    _countryPageGlobalKey = new GlobalKey<ScaffoldState>();
    getCountriesByRegion();
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
               "Select a Country",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            body: Column(
              children: <Widget>[
                getFilterBarUI(),
                Expanded(
                  child: ListView.builder(
                    itemCount: filterCountriesList.length,
                    padding: const EdgeInsets.only(top: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: widget.color.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(14))),
                          child: ListTile(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CountryDetailPage(
                                          color: widget.color,
                                          countries: filterCountriesList[index])),
                                );
                              },
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 0.0),
                              title: Text(
                                filterCountriesList[index]
                                    .name
                                    .trimLeft(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: widget.color),
                                textAlign: TextAlign.start,
                              ),
                              trailing: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5),
                                  child: SvgPicture.network(
                                    filterCountriesList[index]
                                        .flag
                                        .toString(),
                                    placeholderBuilder: (context) =>
                                        CircularProgressIndicator(),
                                    fit: BoxFit.cover,
                                  ))),
                        )
                        ,
                      );
                    },
                  ),
                )
              ],
            ) ));
  }

  Widget getFilterBarUI() {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child:  Expanded(
        child: TextFormField(
          autofocus: true,
          controller: filterController,
          decoration: InputDecoration(
              prefixIcon:   Icon(
                Icons.search,
                color: AppTheme.primary,
                size: 20,
              ),
              hintText: "Search",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(
                color: AppTheme.primary,
              )),
          style:
          Theme.of(context).textTheme.bodyText1.copyWith(
          ),
        ),
      ),
    );
  }

  Future<void> getCountriesByRegion() async {
    try {
      setState(() {
        _isLoading = true;

        filterCountriesList = widget.countriesList
            .where((i) => i.region == widget.region)
            .toList();

        _isLoading = false;
      });
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
