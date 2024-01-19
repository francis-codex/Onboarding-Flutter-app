import 'package:flutter/material.dart';
import 'package:text/pages/welcomeScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pagecontroller = PageController(initialPage: 0);
  int currentpage = 0;
  List<Widget> pages = [
    Itemboarding(
      image: 'assets/img/pngegg.png',
      title:
          'Find Ads Quickly and stress-free; all \n you need to do is search, and they\n will display',
    ),
    Itemboarding(
      image: 'assets/img/trust.png',
      title:
          "Unsure if a seller is tryesworthy? just\n give us a change and we won't let\n your down. we have you covered.",
    ),
    Itemboarding(
      image: 'assets/img/call.png',
      title:
          'On Pack, your preferred marketplace,\nyou may buy, sell, chat, call and do\n everything you like',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 8, 7, 35)),
      backgroundColor: Color.fromARGB(255, 8, 7, 35),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      decoration: BoxDecoration(
                          color: (index <= currentpage)
                              ? Colors.blue
                              : Color.fromARGB(255, 36, 35, 35),
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(2),
                      duration: const Duration(microseconds: 300),
                      height: 5,
                      width: 110,
                    ),
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(
          //   height: 100,
          // ),
          Expanded(
              child: PageView(
            children: pages,
            controller: pagecontroller,
            onPageChanged: (int val) {
              setState(() {
                currentpage = val;
              });
            },
          )),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      decoration: BoxDecoration(
                          color: (index == currentpage)
                              ? Colors.white
                              : Color.fromARGB(255, 36, 35, 35),
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(5),
                      duration: const Duration(microseconds: 300),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MaterialButton(
                padding: EdgeInsets.only(
                  right: 80,
                  left: 20,
                ),
                minWidth: 50,
                // color: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minWidth: 240,
                color: Colors.blue,
                onPressed: () {
                  pagecontroller.nextPage(
                      duration: Duration(microseconds: 300),
                      curve: Curves.easeIn);
                  (currentpage == 2)
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()))
                      : '';
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Itemboarding extends StatelessWidget {
  String image;
  String title;

  Itemboarding({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Image.asset(
            image,
            height: 400,
            width: 400,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
