import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsfeed_screen/UI/HomeFeed.dart';
import 'package:newsfeed_screen/UI/NotificationView.dart';
import 'package:newsfeed_screen/UI/ProfileView.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// creating the stateful  of BottomNav( Bottom Navigation Bar)

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  //initializing the variable current index   and   pageControler
  //Default index is 1 so when the app start it will display the News Feed(HomeFeed)  page as a default selection

  int _currentIndex = 1;
  PageController _pageController;

  //Creating the object of the page controller class to initiate and dispose the page

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

    // creating list of profiles view  for Bottom Navigation Bar
    //index of Notification is 0 , HomeFeed is 1 , Profile is 2

    static List<Widget> _bottomNavView = [
    NotificationView(),
    HomeFeed(),
    ProfileView(),
  ];



  @override
  Widget build(BuildContext context) {

    //returning the Scaffold which contains the Bottom Navigation Bar And Profile View in Body

    return Scaffold(
        backgroundColor: background,

        //profile view as per the Index of the Bottom Navigation Bar


        body: _bottomNavView.elementAt(_currentIndex),

      // Bottom Navigation Bar

      bottomNavigationBar: BottomNavyBar(
        backgroundColor: navBarBackground,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index
          );
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 1000),
          curve: Curves.ease);
        },


        //items of the bottom navigation bar  -> i.e Complaints , News Feed , Profile


        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Center(child: Text('Complaints')),
              icon: SvgPicture.asset('assets/alert-octagon.svg',width: 25,color: navIcon, ),
              activeColor: navIcon,
              inactiveColor: navBarSelectedGrey,
          ),
          BottomNavyBarItem(
              title: Center(child: Text('News Feed')),
              icon: SvgPicture.asset('assets/home.svg',width: 25,color: navIcon, ),
              activeColor: navIcon,
              inactiveColor: navBarSelectedGrey,
          ),
          BottomNavyBarItem(
              title: Center(child: Text('Login')),
              icon: SvgPicture.asset('assets/user.svg',width: 25,color: navIcon, ),
              activeColor: navIcon,
              inactiveColor: navBarSelectedGrey,
          ),
        ],
      ),
    );
  }
}
