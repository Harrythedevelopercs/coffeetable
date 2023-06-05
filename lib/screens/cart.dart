import 'package:fastfodd/controllers/productcart.dart';
import 'package:fastfodd/widegts/menu/top.dart';
import 'package:flutter/material.dart';

import '../providers/appInformation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Appinformation.baseColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TopArea(context),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Appinformation.secondaryColor,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CartList(),
                    ],

                  )),
            )
          ],
        ),
      ),
    );
  }
}


class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    int results = AddtoCart.returnCartLenght();

    return Column(
      children: [
        Container(
          width: 500,
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: results,
            itemBuilder: (context, index) {
              return Column(

                children: [
                  ListTile(
                    title: Text("${AddtoCart.productCart[index]['title']}"),
                    subtitle: Text("${AddtoCart.productCart[index]['productPrice']}"),
                    trailing: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${AddtoCart.productCart[index]['quantity']}"),
                          Text("${AddtoCart.productCart[index]['total']}"),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Appinformation.baseColor,
                    height: 2,
                  ),

                ],
              );
            },
          ),
        ),
        ListTile(
          trailing: Text("Total : 1200"),
        )
      ],
    );
  }
}
