import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/utils.dart';
import 'package:household/Household%20Technician%20Side/Household_T_Drawer.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../State Management/Sign In Provider.dart';
import '../utils/Widget.dart';

// ignore: must_be_immutable
class TechnisionSide extends StatefulWidget {
  String? name;
  TechnisionSide({this.name});

  @override
  State<TechnisionSide> createState() => _TechnisionSideState();
}

class _TechnisionSideState extends State<TechnisionSide> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLooding = false;
  String? imageUrl = '';
  File? logoImage;
  XFile? imageFile;

  CollectionReference technicians =
      FirebaseFirestore.instance.collection("technicians");

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final AddressController = TextEditingController();
  final numberController = TextEditingController();
  final discriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    AddressController.dispose();
    numberController.dispose();
    discriptionController.dispose();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.transparent);
    var roleProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: T_Drawerpage(),
      appBar: appBarProperty(context,
          showback: false,
          backgroundColor: colorPrimary,
          backbuttonColor: whiteColor,
          title: text(widget.name.toString(),
              textColor: white,
              fontSize: textSizeLargeMedium,
              fontWeight: FontWeight.w500),
          elevation: 0),
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                T_Dashboard_hello,
                fontSize: textSizeLarge,
                fontWeight: FontWeight.w500,
                maxLine: 3,
              ).paddingTop(spacing_twinty),
              text(
                T_Dashboard_ListSkill,
                fontSize: textSizeSMedium,
                textColor: textGreyColor,
                maxLine: 3,
              ).paddingTop(spacing_standard),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: colorPrimary.withOpacity(.6),
                      radius: 50,
                      backgroundImage:
                          logoImage == null ? null : FileImage(logoImage!),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: colorPrimary, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            imageFile = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (imageFile != null) {
                              logoImage = File(imageFile!.path);
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.camera_alt_outlined),
                          color: whiteColor,
                          iconSize: 20,
                        )),
                  ],
                ),
              ).paddingTop(spacing_twinty),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textformfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Fill the field ';
                          }
                          return null;
                        },
                        controller: nameController,
                        obscureText: false,
                        hinttext: T_Dashboard_Name,
                        prefixIcons: Icon(Icons.person_outline),
                      ).paddingTop(spacing_standard_new),
                      textformfield(
                        controller: emailController,
                        obscureText: false,
                        hinttext: T_Dashboard_Email_Address,
                        prefixIcons: Icon(Icons.email_outlined),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is Required';
                          } else if (!value.contains('@')) {
                            return "Enter a Valid Email,'@ 'is Required";
                          }
                          return null;
                        },
                      ).paddingTop(spacing_standard_new),
                      textformfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Fill the field ';
                          }
                          return null;
                        },
                        controller: AddressController,
                        obscureText: false,
                        hinttext: T_Dashboard_Address,
                        prefixIcons: Icon(Icons.place_outlined),
                      ).paddingTop(spacing_standard_new),
                      textformfield(
                        keyboardType: TextInputType.phone,
                        controller: numberController,
                        obscureText: false,
                        hinttext: T_Dashboard_PhoneNO,
                        prefixIcons: Icon(Icons.email_outlined),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Fill the field ';
                          }
                          return null;
                        },
                      ).paddingTop(spacing_standard_new),
                      textformfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Fill the field ';
                          }
                          return null;
                        },
                        hight: 80.0,
                        maxLine: 6,
                        controller: discriptionController,
                        obscureText: false,
                        hinttext: T_Dashboard_Description,
                        prefixIcons: Icon(Icons.details_outlined),
                      ).paddingTop(spacing_standard_new),
                      Consumer<LoginProvider>(
                        builder: (context, val, child) {
                          return SizedBox(
                            height: 65,
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black.withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 0,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  elevation: 0,
                                  value: val.rolejob,
                                  isExpanded: true,
                                  items: const [
                                    DropdownMenuItem<String>(
                                      child: Text('Choose the Side'),
                                      value: 'Choose the Side',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Plumber'),
                                      value: 'Plumber',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Electrician'),
                                      value: 'Electrician',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Painting'),
                                      value: 'Painting',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Mechanics'),
                                      value: 'Mechanics',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Tution Teacher'),
                                      value: 'Tution Teacher',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Construction'),
                                      value: 'Construction',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('architecture'),
                                      value: 'architecture',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Interior Design'),
                                      value: 'Interior Design',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('Carpainter'),
                                      value: 'Carpainter',
                                    ),
                                  ],
                                  validator: (value) {
                                    if (val.rolejob == 'Choose the Side') {
                                      return 'Select one of these';
                                    }
                                    return null;
                                  },
                                  onChanged: (dynamic value) {
                                    roleProvider.setMethod(value);
                                  },
                                ),
                              ),
                            ),
                          ).paddingTop(spacing_twinty);
                        },
                      ),
                      elevatedButton(
                        context,
                        looding: isLooding,
                        width: double.infinity,
                        widget: text('Submit', textColor: whiteColor),
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLooding = true;
                            });
                            if (logoImage == null) {
                              utils().toastMethod("Please Select the Image");
                            } else {
                              String uniqueName = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceDirImage =
                                  referenceRoot.child('Technision images');
                              // create refrence to the image to be Store .........................
                              Reference referenceImageUpload =
                                  referenceDirImage.child(uniqueName);
                              try {
                                // store the file
                                await referenceImageUpload
                                    .putFile(File(imageFile!.path));
                                imageUrl =
                                    await referenceImageUpload.getDownloadURL();

                                technicians.doc().set({
                                  'name': nameController.text.toString(),
                                  'email': emailController.text.toString(),
                                  'address': AddressController.text.toString(),
                                  'number': numberController.text.toString(),
                                  'roleJob': roleProvider.rolejob.toString(),
                                  'description':
                                      discriptionController.text.toString(),
                                  'Technision Image': imageUrl
                                }).then((value) {
                                  setState(() {
                                    isLooding = false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: text(
                                                "Congrats! Data Submittion Sucessful",
                                                textColor: white)));
                                  });
                                });
                              } catch (e) {}
                            }
                          }
                        },
                      ).paddingTop(spacing_thirty)
                    ],
                  ))
            ],
          ).paddingSymmetric(horizontal: spacing_twinty),
        ),
      ),
    );
  }
}
