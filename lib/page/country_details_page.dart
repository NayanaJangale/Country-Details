import 'package:country_details/components/custom_details_item.dart';
import 'package:country_details/components/custom_progress_handler.dart';
import 'package:country_details/models/countries.dart';
import 'package:country_details/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CountryDetailPage extends StatefulWidget {
  final Countries countries;
  final Color color;
  CountryDetailPage({this.countries,this.color});

  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  bool _isLoading;
  String _loadingText;
  String msgKey;
  GlobalKey<ScaffoldState> _countryDetailPageGK;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryDetailPageGK = GlobalKey<ScaffoldState>();
    this._isLoading = false;
    this._loadingText = 'Loading . . .';
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressHandler(
      isLoading: this._isLoading,
      loadingText: this._loadingText,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Country Details",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        key: _countryDetailPageGK,
        backgroundColor: AppTheme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomDetailsItem(
            color : widget.color,
            countryName: widget.countries.name ?? "",
            capitalName: widget.countries.capital ?? "",
            currencies: widget.countries.currencies ??"",
            population:widget.countries.population.toString()??"",
            borders: widget.countries.borders??"",
            callingCodes: widget.countries.callingCodes??"",
            region: widget.countries.region??"",
            networkPath: widget.countries.flag.toString()??"",
            demonym : widget.countries.demonym ?? "",
            alpha3Code :widget.countries.alpha3Code ?? "",
          ),
        ),
      ),
    );
  }
}
