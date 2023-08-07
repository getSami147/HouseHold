import 'package:flutter/src/widgets/framework.dart';
import 'package:household/Household%20User%20Side/Household_HomeServices.dart';

// ignore: must_be_immutable
class HomeConstruction extends StatelessWidget {
  String? serviceName;
  HomeConstruction({required this.serviceName, super.key});

  @override
  Widget build(BuildContext context) {
    return HomeServices(serviceName: serviceName);
  }
}
