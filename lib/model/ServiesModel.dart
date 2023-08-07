import 'package:household/utils/Images.dart';

class ServicesModel {
  String? providername;
  String? providerServies;
  String? ProviderAddress;
  String? ProvidePhoneNo;

  String? providerImage;

  ServicesModel(
      {this.ProvidePhoneNo,
      this.ProviderAddress,
      this.providerServies,
      this.providername,
      this.providerImage});
}

final servicesModel = [
  ServicesModel(
      providername: 'Sami Ullah',
      providerImage: ProfileImage,
      providerServies: 'Plumber',
      ProviderAddress: 'wrasta road Hangu',
      ProvidePhoneNo: '0330 32 10550'),
  ServicesModel(
      providername: 'Naqeeb Ur Rehman',
      providerImage: ProfileImage,
      providerServies: 'Electrician',
      ProviderAddress: 'wrasta road Hangu',
      ProvidePhoneNo: '0330 32 10550'),
  ServicesModel(
      providername: 'Fahad Salih Hayat',
      providerImage: ProfileImage,
      providerServies: 'cleaning',
      ProviderAddress: 'wrasta road Hangu',
      ProvidePhoneNo: '0330 32 10550'),
  ServicesModel(
      providername: 'Saim Ahmad',
      providerImage: ProfileImage,
      providerServies: 'Painting',
      ProviderAddress: 'wrasta road Hangu',
      ProvidePhoneNo: '0330 32 10550'),
  ServicesModel(
      providername: 'Sami Ullah',
      providerImage: ProfileImage,
      providerServies: 'Carpainter',
      ProviderAddress: 'wrasta road Hangu',
      ProvidePhoneNo: '0330 32 10550'),
  ServicesModel(
      providername: 'Fawad Ahmad',
      providerImage: ProfileImage,
      providerServies: 'Tuision Teacher',
      ProviderAddress: 'wrasta road Hangu',
      ProvidePhoneNo: '0330 32 10550'),
];
