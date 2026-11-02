import 'package:flutter/material.dart';
import 'package:local_eye/Pages/home_page.dart';


class OnboardingScaffold extends StatefulWidget {
  final int initialIndex;
  const OnboardingScaffold({super.key, this.initialIndex = 0});

  @override
  State<OnboardingScaffold> createState() => _OnboardingScaffoldState();
}

class _OnboardingScaffoldState extends State<OnboardingScaffold> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = const [

  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentIndex == _pages.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF0B1F2A),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: isLastPage ? 0.0 : 1.0,
                child: TextButton(
                  onPressed: isLastPage ? null : _skip,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _pages,
              ),
            ),

            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    bool isLastPage = _currentIndex == _pages.length - 1;
    bool isFirstPage = _currentIndex == 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? const Color(0xFF1DE9B6)
                      : const Color(0x261DE9B6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: isFirstPage ? 0.0 : 1.0,
                child: TextButton(
                  onPressed: isFirstPage ? null : _previousPage,
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
              ),

              // زر التالي أو ابدأ (Next/Start) على اليمين
              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DE9B6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isLastPage ? 'Start' : 'Next',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B1F2A),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
