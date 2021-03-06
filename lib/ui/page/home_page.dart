
import 'package:flutter/material.dart';
import 'package:landing_page_flutter/provider/page_provider.dart';
import 'package:landing_page_flutter/ui/shared/custom_app_menu_widget.dart';
import 'package:landing_page_flutter/ui/view/about_view.dart';
import 'package:landing_page_flutter/ui/view/contact_view.dart';
import 'package:landing_page_flutter/ui/view/home_view.dart';
import 'package:landing_page_flutter/ui/view/location_view.dart';
import 'package:landing_page_flutter/ui/view/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildGradientBackgound(),
      child: Stack(
        children: [
          _HomeBody(),
          Positioned(
            right: 20,
            top: 20,
            child: CustomAppMenuWidget()
          )
        ],
      ),
    );
  }

}
  BoxDecoration buildGradientBackgound() {

      return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.purpleAccent
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5,0.5]
        )
      );
  }

class _HomeBody extends StatelessWidget {


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
        LocationView(),
      ],
    );
  }
}