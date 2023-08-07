import 'package:flutter/material.dart';
import 'package:household/utils/Images.dart';

// HomeServicesModel........................................................>>>
class HomeServicesModel {
  var serviceName;
  Icon? serviceIcon;

  HomeServicesModel({
    this.serviceIcon,
    this.serviceName,
  });
}

final homeServicesModel = [
  HomeServicesModel(serviceName: 'Plumber', serviceIcon: Icon(Icons.plumbing)),
  HomeServicesModel(
      serviceName: 'Electrician', serviceIcon: Icon(Icons.electrical_services)),
  HomeServicesModel(
      serviceName: 'Painting', serviceIcon: Icon(Icons.format_paint)),
  HomeServicesModel(
      serviceName: 'Mechanics', serviceIcon: Icon(Icons.carpenter)),
  HomeServicesModel(
      serviceName: 'Tution Teacher',
      serviceIcon: Icon(Icons.cleaning_services)),
];

// HomeBannerModel......................................................>>>
class HomeBannerModel {
  String? serviceIcon;

  HomeBannerModel({
    this.serviceIcon,
  });
}

final homebannerModel = [
  HomeBannerModel(serviceIcon: Home_banner),
  HomeBannerModel(serviceIcon: Home_banner2),
  HomeBannerModel(serviceIcon: Home_banner3),
];

// HomeConstructionModel...................................................>>>
class HomeConstructionModel {
  var serviceName;
  Icon? serviceIcon;

  HomeConstructionModel({
    this.serviceIcon,
    this.serviceName,
  });
}

final homeConstructionModel = [
  HomeConstructionModel(
      serviceName: 'Construction', serviceIcon: Icon(Icons.construction)),
  HomeConstructionModel(
      serviceName: 'architecture', serviceIcon: Icon(Icons.architecture)),
  HomeConstructionModel(
      serviceName: 'Interior Design', serviceIcon: Icon(Icons.design_services)),
  HomeConstructionModel(
      serviceName: 'Carpainter', serviceIcon: Icon(Icons.chair)),
  // HomeConstructionModel(
  //     serviceName: 'Tuision Teacher',
  //     serviceIcon: Icon(Icons.cleaning_services)),
];

// HomePapularModel......................................................>>>
class HomePapularModel {
  String? serviceIcon;

  HomePapularModel({
    this.serviceIcon,
  });
}

final homePapularModel = [
  HomePapularModel(serviceIcon: Home_cleaning),
  HomePapularModel(serviceIcon: Home_electrician),
  HomePapularModel(serviceIcon: Home_painting),
  HomePapularModel(serviceIcon: Home_plumber),
];
