import 'package:flutter/material.dart';
import 'package:text/pages/signUp.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 8, 7, 35)),
      backgroundColor: Color.fromARGB(255, 8, 7, 35),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(right: 115),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Welcome to Pack',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'How would you like to sign up?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minWidth: 320,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp(
                                    title: 'Email',
                                  )));
                    },
                    child: const Text(
                      'Sign up with Email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minWidth: 320,
                    color: Color.fromARGB(255, 42, 42, 50),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUp(title: 'Phone Number')));
                    },
                    child: const Text(
                      'Sign up with Phone Number',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  // margin: EdgeInsets.all(20),
                  margin: EdgeInsets.all(50),

                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade700, width: 1),
                    ),
                  ),
                  // child: Column(
                  //   children: [
                  //     Text(
                  //       'you can also',
                  //       style: TextStyle(color: Colors.grey.shade700),
                  //     ),
                  //   ],
                  // ),
                ),
                Positioned(
                  left: 160,
                  top: 40,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    color: Color.fromARGB(255, 8, 7, 35),
                    child: Text(
                      'you can also',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: 60,
              color: Colors.grey.shade700,
              padding: EdgeInsets.all(10),
              child: Text(
                'G',
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
