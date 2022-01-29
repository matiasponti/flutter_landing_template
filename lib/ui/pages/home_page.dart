import 'package:flutter/material.dart';
import 'package:flutter_scrollable_landing/providers/page_provider.dart';
import 'package:flutter_scrollable_landing/ui/shared/custom_app_menu.dart';
import 'package:flutter_scrollable_landing/ui/views/about_view.dart';
import 'package:flutter_scrollable_landing/ui/views/contact_view.dart';
import 'package:flutter_scrollable_landing/ui/views/home_view.dart';
import 'package:flutter_scrollable_landing/ui/views/location_view.dart';
import 'package:flutter_scrollable_landing/ui/views/princing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: buildBoxDecoration(),
          child: Stack(
            children: const [
              _HomeBody(),
              Positioned(right: 20, top: 20, child: CustomAppMenu())
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
          0.5,
          0.5
        ],
            colors: [
          Colors.pink,
          Colors.purpleAccent,
        ]));
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}
