
import 'package:country_details/models/currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDetailsItem extends StatelessWidget {
  final String countryName,capitalName,population,region,networkPath,demonym,alpha3Code;
  List<Currencies> currencies=[];
  List<String> callingCodes=[];
  List<String> borders;
  Color color;

  CustomDetailsItem({
    this.countryName,
    this.capitalName,
    this.population,
    this.callingCodes,
    this.currencies,
    this.region,
    this.borders,
    this.networkPath,
    this.color,
    this.demonym,
    this.alpha3Code,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.region + " / ",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Flexible(
                  child : Text(
                    this.countryName,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: this.color
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 8),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(14.0),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: SvgPicture.network(
                          this.networkPath.toString(),
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          this.countryName + "("+this.alpha3Code +")",
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          this.capitalName,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )

                ],
              )),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(3.0),
                bottomRight: Radius.circular(3.0),
                bottomLeft: Radius.circular(3.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(.4),
                    },
                    children: [
                      TableRow(
                        children: [
                          Container(),
                          Container(),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 18,
                                    color: this.color,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Demonym",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Text(
                              this.demonym,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  size: 18,
                                  color: this.color,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                 "Currency",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Wrap(
                              children: List.generate(this.currencies.length,
                                  (curnIndex) {
                                return Text(
                                    this.currencies[curnIndex].name +
                                        (currencies.length - 1 != curnIndex
                                            ? ","
                                            : ""),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                            ),
                                    textAlign: TextAlign.start);
                              }),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.people_alt,
                                    size: 18,
                                    color: this.color,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Population",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Text(
                              this.population,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 18,
                                    color: this.color,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Calling Code",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Wrap(
                              children: List.generate(this.callingCodes.length,
                                  (curnIndex) {
                                return Text(this.callingCodes[curnIndex] +
                                    (callingCodes.length-1 != curnIndex? ",":""),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                            ),
                                    textAlign: TextAlign.start);
                              }),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: this.color,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Region",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Text(
                              this.region,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.border_all,
                                  size: 18,
                                  color: this.color,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    "Bordering Country Code",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      overflow: TextOverflow.ellipsis
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: Wrap(
                              children:
                                  List.generate(this.borders.length, (curnIndex) {
                                return Text(this.borders[curnIndex] +
                                    (callingCodes.length-1 != curnIndex? ",":""),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                            ),
                                    textAlign: TextAlign.start);
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
