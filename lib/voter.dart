import 'package:flutter/material.dart';

class MyVoter extends StatefulWidget {
  const MyVoter({super.key});

  @override
  State<MyVoter> createState() => _MyVoterState();
}

class _MyVoterState extends State<MyVoter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 130),
                child: const Text(
                  'Welcome\n Voters',
                  style: TextStyle(color: Colors.white, fontSize: 43),
                ),
              ),
              Center(
                child: Container(
                  width: 195,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/voter1.png',
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 530),
                  child: Column(children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'home');
                          null;
                        },
                        child: const Text(
                          'Tap Here',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 150,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text(
                        'Admin Click Here',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          color: Color(0xff4c505b),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
