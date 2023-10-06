import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../loadingPage/loadingpage.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int page = 0;
  PageController _pageController = PageController();
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() {
        page = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF369CC7),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              Image.asset(
                "assets/customized/splash_screen.png",
              ),
              Image.asset(
                "assets/customized/introA.png",
              ),
              Image.asset(
                "assets/customized/introB.png",
              ),
              Stack(children: [
                Image.asset(
                  "assets/customized/introC.png",
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: width * 0.3),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoadingPage()));
                      },
                      child: Container(
                        height: 40,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Center(
                            child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: width * 0.8,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: (page != 0 && page != 1),
                    child: IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                          setState(() {
                            page--;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Visibility(
                    visible: (page != 3 && page != 0),
                    child: IconButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                          setState(() {
                            page++;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
