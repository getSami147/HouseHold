// ignore_for_file: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:household/main.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'dart:io';

import 'package:intl/intl.dart';

import 'Widget.dart';
import 'clusteringGoogleMaps/lat_lang_geohash.dart';

// E- Property AppBar.....................................................>>

AppBar appBarProperty(
  context, {
  VoidCallback? onTapBell,
  double? leadindWidth,
  double? titleSpacing,
  Widget? title,
  bool? titleCentre = false,
  bool? showback = true,
  Widget? leading,
  Color? backgroundColor = whiteColor,
  double elevation = 0,
  bool actionWidget = true,
  Color? backbuttonColor = blackColor,
  List<Widget>? action,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    leadingWidth: leadindWidth,
    titleSpacing: titleSpacing,
    elevation: elevation,
    leading: showback == true
        ? IconButton(
            color: backbuttonColor,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back))
        : leading ??
            Center(
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(
                    Appbar_ic_munu,
                    height: 20,
                    width: 20,
                    fit: BoxFit.contain,
                  ).paddingLeft(spacing_middle),
                ),
              ),
            ),
    title: title,
    centerTitle: titleCentre,
    actions: action ??
        [
          // PopupMenuButton(
          //   icon: Icon(
          //     Icons.more_vert,
          //     color: black,
          //   ),
          //   itemBuilder: (context) {
          //     return ['Dark Mode', 'Ligh Mode'].map((e) {
          //       return PopupMenuItem(child: text(e));
          //     }).toList();
          //   },
          // )
        ],
  );
}

// DropDrownButton.............................................................>>
Column dropdown({
  String? title,
  String? hinttext,
  ValueChanged? onChanged,
  List<DropdownMenuItem<dynamic>>? listItems,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text(title, fontWeight: FontWeight.w500).paddingTop(spacing_standard_new),
      Container(
              height: 55,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                underline: 0.height,
                hint: text(hinttext, fontSize: textSizeSMedium),
                elevation: 0,
                borderRadius: BorderRadius.circular(10),
                isExpanded: true,
                items: listItems,
                onChanged: onChanged,
              ).paddingSymmetric(horizontal: spacing_twinty))
          .paddingTop(spacing_standard),
    ],
  );
}
//.......................................................................>>>

//.....................................................................>>
Widget button(
  BuildContext context,
  String text, {
  Color textColor = grocery_color_white,
  Color backgroundColor = colorPrimary,
  double height = 40,
  double width = 150,
}) {
  return MaterialButton(
    onPressed: () {
      //
    },
    height: height,
    minWidth: width,
    padding: const EdgeInsets.all(0.0),
    child:
        Text(text, style: TextStyle(fontSize: 18), textAlign: TextAlign.center)
            .cornerRadiusWithClipRRect(25),
    textColor: textColor,
    color: backgroundColor,
  ).cornerRadiusWithClipRRect(10).paddingOnly(left: 8, right: 8);
}

// ignore: must_be_immutable, camel_case_types
class OutlineButton extends StatefulWidget {
  static String tag = '/dpButton';
  var textContent;
  var widget;
  var textColor;
  VoidCallback onPressed;
  var isStroked = false;
  var height;
  var width;
  var radius = 5.0;
  var bgColors = colorPrimary;
  var bodercolor = colorPrimary;

  OutlineButton(
      {this.textContent,
      var this.widget,
      this.textColor = whiteColor,
      required this.onPressed,
      this.isStroked = false,
      this.height = 50.0,
      var width = 100.0,
      this.radius = 5.0,
      this.bodercolor = colorPrimary,
      this.bgColors = colorPrimary});

  @override
  OutlineButtonState createState() => OutlineButtonState();
}

// ignore: camel_case_types
class OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        alignment: Alignment.center,
        child: widget.widget ??
            text(
              widget.textContent,
              textColor: widget.textColor,
              fontSize: textSizeMedium,
              isCentered: true,
              fontFamily: fontSemiBold,
            ),
        decoration: widget.isStroked
            ? boxDecoration(
                bgColor: Colors.transparent,
                color: widget.bodercolor,
                radius: widget.radius)
            : boxDecoration(
                bgColor: widget.bgColors,
                color: widget.bodercolor,
                radius: widget.radius),
      ),
    );
  }
}

// Elevated button .....................................>>>
// ignore: must_be_immutable
class elevatedButton extends StatelessWidget {
  VoidCallback? onPress;
  var isStroked = false;
  double? elevation;
  Widget? widget;
  ValueChanged? onFocusChanged;
  Color backgroundColor;
  Color bodersideColor;
  var height;
  var width;
  var borderRadius;
  var looding;

  elevatedButton(
    BuildContext context, {
    Key? key,
    this.looding = false,
    var this.isStroked = false,
    this.onFocusChanged,
    required var this.onPress,
    this.elevation,
    var this.widget,
    var this.backgroundColor = colorPrimary,
    var this.bodersideColor = colorPrimary,
    var this.borderRadius = 10.0,
    var this.height = 55.0,
    var this.width = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
          onFocusChange: onFocusChanged,
          onPressed: onPress,
          style: isStroked
              ? ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder())
              : ElevatedButton.styleFrom(
                  elevation: elevation,
                  side: BorderSide(color: bodersideColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                  backgroundColor: backgroundColor,
                ),
          child: looding
              ? CircularProgressIndicator(
                  color: whiteColor,
                  strokeWidth: 2,
                )
              : widget),
    );
  }
}
// Elevated button .....................................>>>Finished

// CheckBoxWidget .....................................>>>
// ignore: must_be_immutable
class CheckBoxWidget extends StatelessWidget {
  String? title;
  var value;
  ValueChanged? onChange;
  CheckBoxWidget({Key? key, this.onChange, this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      controlAffinity: ListTileControlAffinity.leading,
      title: text(title, fontSize: textSizeSmall),
      activeColor: colorPrimary,
      value: value,
      onChanged: onChange,
    );
  }
}
//CheckBoxWidget..............................................finished

// ignore: must_be_immutable
class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  var keyboardType;
  TextEditingController? mController;

  VoidCallback? onPressed;

  EditText(BuildContext context,
      {var this.fontSize = textSizeMedium,
      var this.textColor = textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.keyboardType,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow()]),
        child: TextFormField(
          controller: widget.mController,
          obscureText: widget.isPassword,
          cursorColor: grocery_textGreenColor,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 8),
            hintText: widget.text,
            hintStyle: primaryTextStyle(),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    const BorderSide(color: grocery_view_color, width: 0.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    const BorderSide(color: grocery_view_color, width: 0.0)),
          ),
          maxLines: widget.maxLine,
          style: primaryTextStyle(),
        ),
      );
    } else {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: colorPrimary,
        decoration: InputDecoration(
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: new Icon(
                widget.isPassword ? Icons.visibility : Icons.visibility_off),
          ),
          contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
          hintText: widget.text,
          labelText: widget.text,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
          ),
        ),
        style: TextStyle(
            fontSize: widget.fontSize,
            color: grocery_textColorPrimary,
            fontFamily: widget.fontFamily),
      );
    }
  }
}

Widget title(
    String title, Color headerColor, Color textColor, BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(color: headerColor),
      Center(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, size: 30, color: textColor)
                  .paddingOnly(top: spacing_standard_new),
              onPressed: () {
                finish(context);
              },
            ),
            text(title,
                    textColor: textColor,
                    fontSize: textSizeNormal,
                    fontFamily: fontBold,
                    isCentered: true)
                .paddingOnly(left: spacing_standard, top: 26)
          ],
        ).paddingOnly(left: spacing_standard, right: spacing_standard),
      )
    ],
  );
}

class PinEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final onSubmit;
  final fieldWidth;
  final fontSize;
  final isTextObscure;
  final showFieldAsBox;

  PinEntryTextField(
      {this.lastPin,
      this.fields: 4,
      this.onSubmit,
      this.fieldWidth: 40.0,
      this.fontSize: 16.0,
      this.isTextObscure: false,
      this.showFieldAsBox: false})
      : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(widget.fields, null, growable: false);
    _focusNodes = List<FocusNode?>.filled(widget.fields, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.fields, null,
        growable: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers.forEach((TextEditingController? t) => t!.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach(
        (TextEditingController? tEditController) => tEditController!.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i]!.text = widget.lastPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: boldTextStyle(
          size: 18,
        ),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
            counterText: "",
            border: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                    color: redColor,
                  ))
                : null),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ).paddingOnly(left: spacing_control, right: spacing_control),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  var leftIcon;
  var titleName;
  var rightIcon;
  VoidCallback onPressed;

  TopBar(var this.leftIcon, var this.titleName, var this.rightIcon,
      this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: colorPrimary,
        padding: EdgeInsets.only(right: spacing_standard_new),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(widget.leftIcon),
                  color: grocery_color_white,
                  onPressed: () {
                    finish(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Center(
                    child: text(widget.titleName,
                        fontFamily: fontBold,
                        textColor: grocery_color_white,
                        fontSize: textSizeLargeMedium),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: widget.onPressed,
              child: Icon(widget.rightIcon, color: grocery_color_white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget text(String? text,
    {var fontSize = textSizeMedium,
    Color? textColor,
    var fontFamily = 'Poppins',
    var isCentered = false,
    var maxLine = 1,
    TextOverflow? overflow,
    var latterSpacing = 0.5,
    bool textAllCaps = false,
    var isLongText = false,
    bool lineThrough = false,
    var fontWeight: FontWeight.w400}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: overflow,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: textColor ?? appStore.textSecondaryColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? appStore.scaffoldBackground,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

class CustomTheme extends StatelessWidget {
  final Widget? child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn
          ? ThemeData.dark().copyWith(
              backgroundColor: context.scaffoldBackgroundColor,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: appColorPrimary),
            )
          : ThemeData.light(),
      child: child!,
    );
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    Image.asset('images/placeholder.jpg', fit: BoxFit.cover);

Widget commonCacheImageWidget(String? url, double height,
    {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!,
          height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!,
        height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

ImageProvider commonImageProvider(String? url, double height,
    {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    return NetworkImage(url!);
  } else {
    return AssetImage(ImageConstant.Grocery_Placeholder_Image);
  }
}

Widget commonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('images/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget settingItem(context, String text,
    {Function? onTap,
    Widget? detail,
    Widget? leading,
    Color? textColor,
    int? textSize,
    double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  child: leading ?? SizedBox(),
                  width: 30,
                  alignment: Alignment.center),
              leading != null ? 10.width : SizedBox(),
              Text(text,
                      style: primaryTextStyle(
                          size: textSize ?? 18,
                          color: textColor ?? appStore.textPrimaryColor))
                  .expand(),
            ],
          ).expand(),
          detail ??
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: appStore.textSecondaryColor),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBarTitleWidget(context, String title,
    {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ?? appStore.appBarColor,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(
              color: color ?? appStore.textPrimaryColor, size: 20),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

AppBar appBar(BuildContext context, String title,
    {List<Widget>? actions,
    bool showBack = true,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: color ?? appStore.appBarColor,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back,
                color: appStore.isDarkModeOn ? white : black),
          )
        : null,
    title:
        appBarTitleWidget(context, title, textColor: textColor, color: color),
    actions: actions,
    elevation: 0.5,
  );
}

String convertDate(date) {
  try {
    return date != null
        ? DateFormat(dateFormat).format(DateTime.parse(date))
        : '';
  } catch (e) {
    print(e);
    return '';
  }
}

Widget formField(context, hint,
    {isEnabled = true,
    isDummy = false,
    controller,
    isPasswordVisible = false,
    isPassword = false,
    keyboardType = TextInputType.text,
    FormFieldValidator<String>? validator,
    onSaved,
    textInputAction = TextInputAction.next,
    FocusNode? focusNode,
    FocusNode? nextFocus,
    IconData? suffixIcon,
    IconData? prefixIcon,
    maxLine = 1,
    suffixIconSelector}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword ? isPasswordVisible : false,
    cursorColor: grocery_textColorPrimary,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(spacing_standard),
          borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(spacing_standard),
          borderSide: BorderSide(color: Colors.transparent)),
      filled: true,
      fillColor: grocery_edittext_background,
      hintText: hint,
      hintStyle:
          TextStyle(fontSize: textSizeSMedium, color: textColorSecondary),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: textColorSecondary,
              size: 20,
            )
          : null,
      suffixIcon: isPassword
          ? GestureDetector(
              onTap: suffixIconSelector,
              child: new Icon(
                suffixIcon,
                color: textColorSecondary,
                size: 20,
              ),
            )
          : Icon(
              suffixIcon,
              color: textColorSecondary,
              size: 20,
            ),
    ),
    style: TextStyle(
        fontSize: textSizeMedium,
        color: isDummy ? Colors.transparent : textColorSecondary,
        fontFamily: fontRegular),
  );
}

// Text TextFrom Feild FilledColor...........................................>>>
// ignore: must_be_immutable
class textformfield extends StatelessWidget {
  VoidCallback? onPressed;
  FormFieldValidator<String>? validator;
  FormFieldValidator<String>? onSaved;
  ValueChanged? onChanged;
  TextEditingController? controller;
  ValueChanged<String>? onFieldSubmitted;
  var hight;
  var hinttext;
  var filledColor;
  var suffixIcons;
  var prefixIcons;
  var borderSide;
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var suffixWidth;
  var maxLine;
  var obscureText = false;
  TextInputType? keyboardType;
  textformfield({
    Key? key,
    this.onFieldSubmitted,
    this.controller,
    required this.obscureText,
    this.validator,
    this.onSaved,
    this.onChanged,
    var this.hight = 50.0,
    this.onPressed,
    var this.suffixWidth = 50.0,
    var this.hinttext,
    var this.filledColor,
    var this.prefixIcons,
    var this.suffixIcons,
    var this.borderSide,
    var this.fontFamily,
    var this.fontSize = textSizeMedium,
    var this.isPassword = false,
    var this.isSecure = false,
    var this.keyboardType,
    var this.maxLine = 1,
    var this.text,
    var this.textColor = textColorSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: hight,
        child: TextFormField(
          maxLines: maxLine,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          obscureText: obscureText,
          onTap: onPressed,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
              prefixIcon: prefixIcons,
              suffixIcon: suffixIcons,
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 50, maxWidth: suffixWidth),
              filled: true,
              fillColor: filedColor,
              border: OutlineInputBorder(
                  borderSide: borderSide ?? BorderSide.none,
                  borderRadius: BorderRadius.circular(20)),
              hintText: hinttext,
              hintStyle: TextStyle(fontSize: 13.0)),
        ));
  }
}

// Text TextFrom .....................................>>>
// ignore: must_be_immutable
class textform extends StatefulWidget {
  var borderSide;
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  var keyboardType;
  TextEditingController? mController;

  VoidCallback? onPressed;

  textform(var this.borderSide,
      {var this.fontSize = textSizeMedium,
      var this.textColor = textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = false,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.keyboardType,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class textformState extends State<EditText> {
  var borderSide;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff505588).withOpacity(0.06),
            blurRadius: 16.72,
            spreadRadius: 0,
            offset: Offset(0, 4.46))
      ]),
      child: TextFormField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          contentPadding: const EdgeInsets.fromLTRB(20, 8, 4, 8),
          hintText: widget.text,
          hintStyle: primaryTextStyle(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: borderSide),
        ),
        maxLines: widget.maxLine,
        style: primaryTextStyle(),
      ),
    );
  }
}

// ignore: must_be_immutable
class OrderedHistory extends StatelessWidget {
  String? sericesTitle;
  String? sericesStatus;
  String? sericesName;
  String? sericesDate;
  String? sericesTime;
  String? TotalPrice;
  String? buttton;

  OrderedHistory(
      {Key? key,
      this.sericesTitle,
      this.TotalPrice,
      this.buttton,
      this.sericesDate,
      this.sericesName,
      this.sericesStatus,
      this.sericesTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: filedColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(sericesTitle,
                  fontWeight: FontWeight.w500,
                  fontSize: textSizeLargeMedium,
                  textColor: black),
              text(sericesStatus,
                  fontSize: textSizeSMedium, textColor: dating_orange),
            ],
          ),
          Divider(
            color: darkGrey,
          ).paddingTop(spacing_control),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  HomeServiesBook_SilverAppPic,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(sericesName,
                      fontWeight: FontWeight.w500,
                      fontSize: textSizeLargeMedium,
                      textColor: black),
                  RichText(
                      text: TextSpan(
                          text: sericesDate,
                          style: TextStyle(
                              fontSize: textSizeSMedium,
                              fontWeight: FontWeight.w500,
                              color: blackColor),
                          children: [
                        TextSpan(
                            text: Booking_at,
                            style: TextStyle(
                                fontSize: textSizeSMedium,
                                fontWeight: FontWeight.w500,
                                color: dating_orange)),
                        TextSpan(text: sericesTime)
                      ])),
                ],
              ).paddingLeft(spacing_middle),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: text(TotalPrice,
                fontSize: textSizeLargeMedium,
                textColor: blackColor,
                fontWeight: FontWeight.w500),
          ),
          Divider(
            color: darkGrey,
          ).paddingTop(spacing_control),
          text(buttton,
              fontSize: textSizeLargeMedium,
              textColor: colorPrimary,
              fontWeight: FontWeight.w500),
        ],
      ).paddingAll(spacing_middle),
    );
  }
}
