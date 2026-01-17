import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_images.dart';
import 'package:islami/features/radio_tab/widgets/radio_cards.dart';
import 'package:islami/features/radio_tab/widgets/radio_tab_navigator.dart';

class RadioTabContent extends StatefulWidget {
  const RadioTabContent({super.key});

  @override
  State<RadioTabContent> createState() => _RadioTabContentState();
}

class _RadioTabContentState extends State<RadioTabContent> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesIslami),
        RadioTabNavigator(controller: _controller, currentPage: currentPage),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: 2,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return RadioCards(currentIndex: index);
            },
          ),
        ),
      ],
    );
  }
}
