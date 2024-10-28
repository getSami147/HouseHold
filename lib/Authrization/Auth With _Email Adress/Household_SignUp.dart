import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/utils.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../State Management/Sign In Provider.dart';
import '../../utils/Strings.dart';
import 'Household_SignIn.dart';
import 'Household_VerifySignUp.dart';

class SignUp extends StatefulWidget {
  static String tag = '/GrocerySignIn';

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // String role = 'User Side';
  bool islooding = false;
  String imageUrl = '';
  File? logoImage;
  XFile? imageFile;
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    var roleProvider = Provider.of<LoginProvider>(context, listen: false);
    final prvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget('', elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(signIn_hello,
                            fontSize: textSizeLarge,
                            fontWeight: FontWeight.w500,
                            maxLine: 5,
                            fontFamily: fontPoppins)
                        .paddingOnly(top: spacing_xxLarge, right: spacingBig),
                    Consumer<LoginProvider>(
                      builder: (context, val, child) {
                        return Form(
                          key: _formKey,
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          colorPrimary.withOpacity(.6),
                                      radius: 50,
                                      backgroundImage: logoImage == null
                                          ? null
                                          : FileImage(logoImage!),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: colorPrimary,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                          onPressed: () async {
                                            ImagePicker picker = ImagePicker();
                                            imageFile = await picker.pickImage(
                                                source: ImageSource.gallery);
                                            if (imageFile != null) {
                                              logoImage = File(imageFile!.path);
                                              setState(() {});
                                            }
                                            if (imageFile == null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "No File  selected")));
                                            }
                                          },
                                          icon: Icon(Icons.camera_alt_outlined),
                                          color: whiteColor,
                                          iconSize: 20,
                                        )),
                                  ],
                                ),
                              ),
                              textformfield(
                                keyboardType: TextInputType.name,
                                controller: userNameController,
                                obscureText: false,
                                hinttext: SignUp_UserName,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Username';
                                  }
                                  return null;
                                },
                                prefixIcons: Icon(Icons.person_outline),
                              ).paddingTop(spacing_standard_new),
                              textformfield(
                                // keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                obscureText: false,
                                hinttext: SignUp_Email_Address,
                                prefixIcons: Icon(Icons.email_outlined),

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is Required';
                                  } else if (!value.contains('@gmail')) {
                                    return "Enter a Valid Email Address";
                                  }
                                  return null;
                                },
                              ).paddingTop(spacing_standard_new),
                              Consumer<LoginProvider>(
                                builder: (context, Consumervalue, child) {
                                  return textformfield(
                                    controller: passwordController,
                                    obscureText: prvider.passwordObsecure,
                                    hinttext: SignUp_Password,
                                    prefixIcons: Icon(Icons.lock_outline),
                                    suffixIcons: IconButton(
                                        onPressed: () {
                                          prvider.setIconChange();
                                        },
                                        icon: Consumervalue.passwordObsecure
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: colorPrimary,
                                              )
                                            : Icon(Icons.visibility)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is Required';
                                      }
                                      return null;
                                    },
                                  );
                                },
                              ).paddingTop(spacing_standard_new),
                              SizedBox(
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
                                      value: val.role,
                                      isExpanded: true,
                                      items: const [
                                        DropdownMenuItem<String>(
                                          child: Text('Choose the Side'),
                                          value: 'Choose the Side',
                                        ),
                                        DropdownMenuItem<String>(
                                          child: Text('User Side'),
                                          value: 'User Side',
                                        ),
                                        DropdownMenuItem<String>(
                                          child: Text('Technision Side'),
                                          value: 'Technision Side',
                                        ),
                                      ],
                                      validator: (value) {
                                        if (val.role == 'Choose the Side') {
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
                              ).paddingTop(spacing_twinty),
                              elevatedButton(
                                context,
                                looding: islooding,
                                onPress: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      islooding = true;
                                    });
                                    if (logoImage == null) {
                                      utils().toastMethod(
                                          "Please Select the Image");

                                      setState(() {
                                        islooding = false;
                                      });
                                    } else {
                                      _auth
                                          .createUserWithEmailAndPassword(
                                              email:
                                                  emailController.text.trim(),
                                              password: passwordController.text
                                                  .trim())
                                          .then((value) async {
                                        VerifySignUp().launch(context);

                                        setState(() {
                                          islooding = false;
                                        });
                                        String uniqueName = DateTime.now()
                                            .microsecondsSinceEpoch
                                            .toString();
                                        Reference referenceRoot =
                                            FirebaseStorage.instance.ref();
                                        Reference referenceDirImage =
                                            referenceRoot.child('images');
                                        // create refrence to the image to be Store .........................
                                        Reference referenceImageUpload =
                                            referenceDirImage.child(uniqueName);

                                        // store the file
                                        await referenceImageUpload
                                            .putFile(File(imageFile!.path));
                                        imageUrl = await referenceImageUpload
                                            .getDownloadURL();
                                            
                                        users.doc(_auth.currentUser!.uid).set({
                                          'username': userNameController.text
                                              .toString(),
                                          'email':
                                              emailController.text.toString(),
                                          'roles': val.role,
                                          'id': _auth.currentUser!.uid,
                                          "userImage": imageUrl,
                                        }).then((value) {
                                          debugPrint(
                                              "Form Data Uploaded successfully");
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Form Data Uploaded successfully");
                                        });
                                      }).onError((error, stackTrace) {
                                        debugPrint(error.toString());
                                        utils().toastMethod(error.toString());
                                        setState(() {
                                          islooding = false;
                                        });
                                      });
                                    }
                                  }
                                },
                                width: double.infinity,
                                widget: text(SignUp_Register,
                                    textColor: Colors.white,
                                    fontFamily: fontMedium),
                              ).paddingTop(spacing_twinty),
                            ],
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        text(
                          SignUp_OrRegister,
                          fontSize: textSizeSMedium,
                        ).paddingSymmetric(horizontal: spacing_standard),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                      ],
                    ).paddingTop(spacing_xxLarge),
                  ],
                ).paddingSymmetric(horizontal: spacing_twinty),
              ),
            ),
            GestureDetector(
              onTap: () {
                SignIn().launch(context);
              },
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: blackColor,
                          fontSize: textSizeMedium,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                      text: SignUp_HaveAccount,
                      children: [
                    TextSpan(
                        text: SignUp_LoginNow,
                        style: TextStyle(
                            color: colorPrimary, fontFamily: 'Poppins'))
                  ])).paddingBottom(spacing_twinty).center(),
            )
          ],
        ),
      ),
    );
  }
}
