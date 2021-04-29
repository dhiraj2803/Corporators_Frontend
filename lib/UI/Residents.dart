import 'package:cropapp/UI/ViewAll.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'DataEntry.dart';

class resident extends StatefulWidget {
  var address = new List();

  resident({this.address});

  @override
  _residentState createState() => _residentState(address);
}

class _residentState extends State<resident> {
  var address = new List();

  _residentState(this.address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Text(
                'No. ' + address[0] + ', ' + address[1] + ' Street',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Product_Sans_Bold',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Add Residents',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Product_Sans_Bold',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            relationName('Head', context),
            Wrap(
              children: [
                relationName('Father', context),
                relationName('Mother', context),
                relationName('Son', context),
                relationName('Daughter', context),
                relationName('Wife', context),
                relationName('Brother', context),
                relationName('Sister', context),
                relationName('Nephew', context),
                relationName('Neice', context),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 12),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => dataEntry(address: address),
                      ));
                    },
                    icon: Icon(
                      Icons.add_circle_rounded,
                      size: 35,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => viewAll()),
            );
          },
          label: Text(
            'View All',
            style: TextStyle(
              fontFamily: 'Product_Sans_Bold',
              color: navIcon,
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  Widget relationName(String a, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              size: 38,
            ),
          ),
          Text(
            a,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Product_Sans_Bold',
                fontWeight: FontWeight.bold,
                color: text),
          ),
        ],
      ),
    );
  }
}
