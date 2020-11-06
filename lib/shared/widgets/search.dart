import 'package:flutter/material.dart';
import 'package:instadrunkapp/constants.dart';
import 'package:instadrunkapp/model/search_query.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double boxSize = MediaQuery.of(context).size.height * 0.15;
    return Column(children: [
      Container(
        height: boxSize,
        child: Stack(children: [
          Container(
            height: boxSize - 27,
            width: double.infinity,
            child: Text("Welcome to Instabrew!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 28.0)),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36))),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 54,
              child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) =>
                              Provider.of<SearchQuery>(context, listen: false)
                                  .setQuery(value),
                          decoration: InputDecoration(
                              hintText: "Search",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintStyle: TextStyle(color: kPrimaryColor)),
                        ),
                      ),
                      Icon(Icons.search, color: kPrimaryColor)
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1.3,
                            blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(20))))
        ]),
      )
    ]);
  }
}
