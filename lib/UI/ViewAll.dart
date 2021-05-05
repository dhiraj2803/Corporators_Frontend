
import 'package:cropapp/UI/DataEntry.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'Residents.dart';

class viewAll extends StatefulWidget {
  @override
  _viewAllState createState() => _viewAllState();
}

class _viewAllState extends State<viewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Text(
                'Recently Added',
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            _card('213/A', 'abcdefghijklmnop', '15', '21/21/21', context),
            _card('123/B', 'Hellllllo World', '78', '21/21/21', context),
            _card('328/B', 'Welcome Back ', '12', '21/21/2001', context),
            _card('308/Z', 'Flutter Hello World', '127', '21/21/21', context),
            _card('217/M', 'hello', '75', '21/21/21', context),
            _card('213/T', 'abcd', '15', '21/21/21', context),
            _card('120/Z', 'mnopqrstuvwxyz', '12', '21/21/21', context),
            _card('211/V', 'abcd', '36', '21/21/21', context),
            _card('210/P', 'a', '89', '21/21/21', context),
            _card('213/C', 'mkolpuhb', '4', '21/21/21', context),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => dataEntry(),
            ));
          },
          label: Text(
            'New Home',
            style: TextStyle(
              
              fontFamily: 'ProductSans',
              color: navIcon,
              fontSize: 14.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  Widget _card(String a, String b, String c, String d, BuildContext context) {
    List address = [a, c];
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => resident(address: address),
          ));
        },
        child: Container(
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 1)),
            color: textBoxBack,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Row(children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _lefttopText('No: ' + a, context),
                        SizedBox(height: 10),
                        _leftbottomText(b, context),
                        //_leftText('', b, context)
                      ]),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rightText('Booth No: ' + c, context),
                        SizedBox(height: 10),
                        _rightText(d, context)
                      ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _lefttopText(String a, BuildContext context) {
    return Text(a,
        style: TextStyle(
          fontSize: 24,
          letterSpacing: 1,
          fontFamily: 'ProductSans',
          fontWeight: FontWeight.bold,
          color: text,
        ));
  }

  Widget _rightText(String a, BuildContext context) {
    return Text(
      a,
      style: TextStyle(
        fontSize: 20,
        letterSpacing: 1,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }

  _leftbottomText(String a, BuildContext context) {
    return FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          a,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}

