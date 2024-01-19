import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text/pages/welcomeScreen.dart';

class SignUp extends StatefulWidget {
  String title;
  SignUp({super.key, required this.title});

  @override
  State<SignUp> createState() => _SignUpState();
}

final PageController pagecontroller = PageController(initialPage: 0);

class _SignUpState extends State<SignUp> {
  int currentpage = 0;
  List<Widget> pages = [
    Itemboarding(
      image: '',
      mainTitle: 'Welcome to Pack',
      title: 'Kindly Input your details to sign up',
    ),
    Itemboarding(
        image: '',
        mainTitle: 'Welcome to Pack',
        title: "We're almost done, just input your\npassword"),
    Itemboarding(
      image: 'assets/img/celebration.png',
      mainTitle: 'Sign up successful!',
      title:
          'You have successfully signed up, check\nyour mail for our verification link',
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
                      // margin: EdgeInsets.all(2),
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
            physics: NeverScrollableScrollPhysics(),
            controller: pagecontroller,
            onPageChanged: (int val) {
              setState(() {
                currentpage = val;
              });
            },
          )),
          // (currentpage < 2)
          //     ?
          //     : Column(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Itemboarding extends StatelessWidget {
  String image;
  String title;
  String mainTitle;

  Itemboarding(
      {super.key,
      required this.image,
      required this.title,
      required this.mainTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: (mainTitle == 'Sign up successful!') ? 0 : 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        mainTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                (mainTitle == 'Sign up successful!') ? 25 : 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                (mainTitle == 'Sign up successful!') ? 18 : 15),
                      ),
                    ]),
              )
            ],
          ),
          (mainTitle == 'Sign up successful!')
              ? Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    )
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      width: 350,
                      child: TextField(
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Phone Number",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(), // <-- This is the key
                          labelText: "Enter Phone Number",
                          fillColor: Color.fromARGB(255, 56, 51, 51),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        ),
                        // validator: _FormValidators.validateName,
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minWidth: 340,
                      color: Colors.blue,
                      onPressed: () {
                        pagecontroller.nextPage(
                            duration: Duration(microseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
