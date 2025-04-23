

import 'package:flutter/material.dart';
import 'package:unstage_app/component/local_storage.dart';
import 'package:unstage_app/component/svg_icon.dart';
import 'package:unstage_app/pages/artist_page.dart';
import 'package:unstage_app/pages/calendar_page.dart';
import 'package:unstage_app/pages/home_page.dart';
import 'package:unstage_app/pages/profile_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late final PageController _pageController;
  int _currentIndex = 0;


  _onChangePage({required int page}) {
    if (_currentIndex == page) return;

    setState(() => _currentIndex = page);
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    _pageController = PageController();
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 내비게시연 바 뒤로 화면 확장됨
      body: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            ArtistPage(),
            CalendarPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.zero,
        child: SizedBox(
          height: 57,
          child: Center(
            child: Container(
              width: 300,
              height: 57,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 6),
                        blurRadius: 12,
                        color: Colors.black12
                    ),
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomIcon(
                    sIcon: SIcon.home,
                    title: '홈',
                    callback: () => _onChangePage(page: 0),
                    isPressed: _currentIndex == 0,
                  ),
                  BottomIcon(
                    sIcon: SIcon.star,
                    title: '아티스트',
                    callback: () => _onChangePage(page: 1),
                    isPressed: _currentIndex == 1,
                  ),
                  BottomIcon(
                    sIcon: SIcon.calendar,
                    title: '일정',
                    callback: () => _onChangePage(page: 2),
                    isPressed: _currentIndex == 2,
                  ),
                  BottomIcon(
                    sIcon: SIcon.user,
                    title: '프로필',
                    callback: () => _onChangePage(page: 3),
                    isPressed: _currentIndex == 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _init() async {
  await LocalStorage.initInstance();
}

class BottomIcon extends StatelessWidget {

  final SIcon sIcon;
  final String title;
  final GestureTapCallback callback;
  final bool isPressed;

  const BottomIcon({super.key, required this.sIcon, required this.title, required this.callback, required this.isPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 67,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon.asset(
                sIcon: sIcon,
                style: isPressed
                    ? SvgIconStyle(color: Theme.of(context).colorScheme.onPrimary,)
                    : null
            ),
            const SizedBox(height: 2,),
            Text(title,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                color: isPressed
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
