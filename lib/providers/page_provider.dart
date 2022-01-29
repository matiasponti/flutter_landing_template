import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  int _currentIndex = 0;
  List _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  createScrollController(String routerName) {
    this.scrollController =
        PageController(initialPage: getPageIndex(routerName)!);

    html.document.title = _pages[getPageIndex(routerName)!];

    this.scrollController.addListener(() {
      final pageIndex = (this.scrollController.page ?? 0).round();

      if (pageIndex != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title = _pages[pageIndex];
      }
    });
  }

  int? getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}
