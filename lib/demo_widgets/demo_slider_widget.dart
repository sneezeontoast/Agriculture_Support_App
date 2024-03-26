import '../demo_imports.dart';

//------------------------------------------------------------------------------
// This widget is a slider capable of taking various widgets as content
//------------------------------------------------------------------------------

import 'dart:async';
import 'package:flutter/material.dart';

class DemoSliderWidget extends StatefulWidget {
  final List<Widget> children;
  final Duration switchDuration;
  final Duration animationDuration;

  const DemoSliderWidget({
    Key? key,
    required this.children,
    this.switchDuration = const Duration(seconds: 15),
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _DemoSliderWidgetState createState() => _DemoSliderWidgetState();
}

class _DemoSliderWidgetState extends State<DemoSliderWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(widget.switchDuration, (timer) {
      if (_currentPage < widget.children.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: widget.animationDuration,
        curve: Curves.easeIn,
      );
    });
  }

  void _goToPrevious() {
    int previousPage = _currentPage > 0 ? _currentPage - 1 : widget.children
        .length - 1;
    _pageController.animateToPage(
      previousPage,
      duration: widget.animationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _goToNext() {
    int nextPage = _currentPage < widget.children.length - 1
        ? _currentPage + 1
        : 0;
    _pageController.animateToPage(
      nextPage,
      duration: widget.animationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _toggleAutoSlide() {
    setState(() {
      if (_timer?.isActive == true) {
        _timer?.cancel();
      } else {
        _startAutoSlide();
      }
    });
  }


  Widget _buildDotsIndicator() {
    List<Widget> dots = [];
    for (int i = 0; i < widget.children.length; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CircleAvatar(
            radius: _currentPage == i ? 5 : 3,
            backgroundColor: _currentPage == i ? Colors.black : Colors.grey,
          ),
        ),
      );
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: dots);
  }

  @override
  Widget build(BuildContext context) {
    const double cardMarginHorizontal = 36; // Horizontal margin for the card
    const double iconGap = 30; // Gap between card and icons

    return Stack(
      alignment: Alignment.center, // Ensure the stack centers its children
      children: [
        Column(
          children: [
            Expanded(
              child: Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(horizontal: cardMarginHorizontal),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index; // Update _currentPage with the new index
                    });
                  },
                  children: widget.children.map((child) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Adjust radius for desired curvature
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          // Adjust color and opacity for desired border color
                          width: 1, // Adjust width for desired border thickness
                        ),
                      ),
                      child: ClipRRect( // ClipRRect is used here to apply the same rounded corners to the child's content
                        borderRadius: BorderRadius.circular(10.0),
                        // Ensure it's the same as Card's borderRadius
                        child: child,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildDotsIndicator(),
            ),
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: cardMarginHorizontal - iconGap, // Correct the position for left arrow
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: _goToPrevious,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: cardMarginHorizontal - (iconGap+5), // Correct the position for right arrow
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: _goToNext,
          ),
        ),
        Positioned(
          top: 10,
          right: cardMarginHorizontal + 15.0, // Position the pause button with the specified gap
          child: IconButton(
            icon: Icon(_timer?.isActive == true ? Icons.pause : Icons.play_arrow),
            onPressed: _toggleAutoSlide,
          ),
        ),
      ],
    );
  }
}