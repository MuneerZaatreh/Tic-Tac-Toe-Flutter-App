import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/MultiPlayer.dart';
import 'package:flutter_application_1/Solo.dart';

import 'Transtion.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/images.jpg"), fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "T",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "I",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "C",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "T",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "A",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "C",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "T",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "O",
                            style: TextStyle(
                                fontSize: 70,
                                color: Color.fromARGB(255, 255, 17, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "E",
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Expanded(
                          child: GridView.count(
                              mainAxisSpacing: 50.0,
                              crossAxisSpacing: 20.0,
                              childAspectRatio: 5.0,
                              crossAxisCount: 1,
                              children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(EnterExitRoute(
                                    enterPage: const Solo(),
                                    exitPage: const HomePage()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                  child: Text(
                                    "Single Player",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(EnterExitRoute(
                                    enterPage: const MultiPlayer(),
                                    exitPage: const HomePage()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                  child: Text(
                                    "Local MultiPlayer",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                SystemNavigator.pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                  child: Text(
                                    "Exit",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                    ],
                  )),
            )));
  }
}
