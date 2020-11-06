import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instadrunkapp/constants.dart';
import 'package:instadrunkapp/model/search_query.dart';
import 'package:instadrunkapp/screens/products/widgets/product.dart';
import 'package:instadrunkapp/shared/widgets/loading.dart';
import 'package:instadrunkapp/dto/product.dart' as dto;
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchQuery>(builder: (context, searchQuery, _) {
      return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasError && snapshot.hasData) {
              return Expanded(
                child: Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: ListView(
                        shrinkWrap: true,
                        children: snapshot.data.docs
                            .where((doc) => doc
                                .data()["name"]
                                .toString()
                                .toLowerCase()
                                .contains(searchQuery.query))
                            .map((doc) {
                          final product = dto.Product.fromJson(doc.data());
                          return Product(product);
                        }).toList())),
              );
            }

            return Loading();
          });
    });
  }
}
