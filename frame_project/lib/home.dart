import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRwPdkcSU9LLX71OLe7Hmk0ulXQI5gDvenqQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmMPQb8IJeXeHn_Fxj8HN19mDbRKEFCmCjwQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOEzEgcCsGlYMT9UhxSqJ1JsUCwKz9ms8TYA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlRXkvUBr7rqO9oK60MJ3jABVT8nyImx2fFA&usqp=CAU',
    'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9942EE3A5FCDAB5420',
    'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99E9294B5FCDAB5420',
  ];
  late Timer timer;
  PageController controller = PageController(initialPage: 0);
  int currentPage = -1;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
      currentPage = (controller.page ?? 0).toInt();
      int nextPage = (currentPage == imageUrls.length - 1) ? 0 : currentPage + 1;
      print('timer~ nextpage : $nextPage, \ncurrentPage: $currentPage');

      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                ...List.generate(
                    imageUrls.length,
                    (index) => Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageUrls.length,
                  (index) => InkWell(
                    onTap: () {
                      currentPage = index;
                      controller.animateToPage(currentPage,
                          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: index == currentPage ? Colors.pink : Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
