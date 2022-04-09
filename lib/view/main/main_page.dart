import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/main/discussion/discussion_page.dart';
import 'package:flutter_bootcamp/view/main/home_page.dart';
import 'package:flutter_bootcamp/view/main/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pc = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/main/ic_discuss.png",
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscussionPage(),
              ),
            );
          }),
      bottomNavigationBar: _buildBottomNavigation(),
      body: PageView(
        controller: _pc,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ProfilePage(),
        ],
      ),
    );
  }

  Container _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
            offset: Offset(
              0,
              -2,
            ),
          )
        ],
      ),
      child: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      index = 0;
                      _pc.animateToPage(
                        0,
                        curve: Curves.easeInOut,
                        duration: Duration(microseconds: 1),
                      );
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/main/ic_home.png",
                          height: 25,
                        ),
                        // color: MrtColors.mrtBlueColor,

                        Text(
                          'Home',
                          style: TextStyle(
                            // color: MrtColors.mrtBlueColor,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Opacity(
                        opacity: 0,
                        child: Icon(
                          Icons.home,
                          size: 25,
                          // color: MrtColors.mrtBlueColor,
                        ),
                      ),
                      Text(
                        'Diskusi',
                        style: TextStyle(
                          // color: MrtColors.mrtBlueColor,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      index = 1;
                      _pc.animateToPage(
                        1,
                        curve: Curves.easeInOut,
                        duration: Duration(microseconds: 1),
                      );
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.blueGrey,
                          // color: MrtColors.mrtBlueColor,
                        ),
                        Text(
                          'My Menu',
                          style: TextStyle(
                              // color: MrtColors.mrtBlueColor,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // shape: CircularNotchedRectangle(),
      ),
    );
  }
}
