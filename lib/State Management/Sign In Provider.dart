import 'dart:async';

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Authrization/Auth With _Email Adress/Household_SignIn.dart';
import '../Authrization/Auth With _Email Adress/utils.dart';

class LoginProvider with ChangeNotifier {
  bool _passwordObsecure = true;
  String _role = 'User Side';
  String _rolejob = 'Plumber';
  bool _isEmailVerified = false;
  Timer? _timer;
  EmailOTP _emailOTP = EmailOTP();
  bool checkEmail = false;
  // String _selectesIndex = '';
  // String _email = '';
  // String _password = '';
  // String _popbuton = '';

  bool get passwordObsecure => _passwordObsecure;
  String get role => _role;
  String get rolejob => _rolejob;

  Timer? get timer => _timer;
  bool get isEmailverified => _isEmailVerified;
  EmailOTP get emailOTP => _emailOTP;
  // String get selectesIndex => _selectesIndex;
  // String get email => _email;
  // String get password => _password;
  // String get popbuton => _popbuton;

  void setIconChange() {
    _passwordObsecure = !_passwordObsecure;

    notifyListeners();
  }

  void setMethod(globalvalue) {
    _role = globalvalue;
    _rolejob = globalvalue;

    // _email = globalvalue;
    // _password = globalvalue;
    // _email = globalvalue;

    notifyListeners();
  }

  // void setDropdown(selectesIndex) {
  //   _selectesIndex = selectesIndex;
  //   _popbuton = selectesIndex;
  //   notifyListeners();
  // }
  // void isVerifiyMethod() {
  //   _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   if (!_isEmailVerified) {
  //     sendVerificationEmail();
  //     _timer = Timer.periodic(
  //       Duration(seconds: 3),
  //       (_) => checkEmailVerified(),
  //     );
  //   }
  //   notifyListeners();
  // }

  Future checkEmailVerified() async {
    // call after email verification
    FirebaseAuth.instance.currentUser!.reload();

    _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (isEmailverified) timer?.cancel();
    notifyListeners();
  }

  Future sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    notifyListeners();
  }

// Send OTP Verification....................................................>>>
  void setOTPVerification(emailController) async {
    try {
      _emailOTP.setConfig(
          appEmail: "samiu09950@gmail.com",
          userEmail: emailController.text.toString(),
          otpLength: 5,
          otpType: OTPType.digitsOnly);
    } catch (Seterror) {
      utils().toastMethod(Seterror.toString());
    }
    notifyListeners();
  }

//Conform OTP ....................................................>>>
  void confromOTP(OTPController, context) async {
    try {
      if (await _emailOTP.verifyOTP(otp: OTPController.text.toString()) ==
          true) {
        _isEmailVerified = true;
        notifyListeners();
        utils().toastMethod("Your Email has been Verified");
        SignIn().launch(context);
      }
      _isEmailVerified = false;
      notifyListeners();
    } catch (conformError) {
      utils().toastMethod(conformError.toString());
    }

    notifyListeners();
  }
}
