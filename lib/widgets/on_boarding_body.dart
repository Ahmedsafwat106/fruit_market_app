import 'package:ahmedsafwat/features/Auth/Presentation/Pages/login/%20login_view.dart';
import 'package:flutter/material.dart';
import 'package:ahmedsafwat/widgets/custom_button.dart';
import 'package:ahmedsafwat/widgets/custom_indicator.dart';
import 'package:ahmedsafwat/widgets/page_view_item.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<PageViewItem> pages = const [
    PageViewItem(
      image: "assets/images/shopping.jpg",
      title: "Shopping",
      subtitle: "Buy everything fresh and fast!",
    ),
    PageViewItem(
      image: "assets/images/delivary.jpg",
      title: "Delivery",
      subtitle: "Fast and easy delivery to your home.",
    ),
    PageViewItem(
      image: "assets/images/delivaryarrived.jpg",
      title: "Enjoy",
      subtitle: "Order arrived, time to enjoy!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginView()),
                );
              },
              child: const Text("Skip"),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: pages,
          ),
        ),
        const CustomIndicator(),
        const SizedBox(height: 20),
        CustomButton(
          text: _currentPage == pages.length - 1 ? "Get Started" : "Next",
          onPressed: () {
            if (_currentPage == pages.length - 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
              );
            } else {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
