import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  bool border;
  TextStyle? style;
  bool enabled;

  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  Color? fillColor;
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.onSave,
      required this.inputType,
      this.border = true,
      this.onChange,
      this.nextFocus,
        this.style,
      this.validator,
      this.controller,
        this.enabled = true,
        this.fillColor,
      this.obscureText = false,
      this.decoration,
      this.focusNode,
      this.maxLines = 1,
      this.isHiddenPassword = false,
      this.obscuringCharacter = "*",
      this.inputFormatters,
      this.onTapShowHidePassword,
      this.textInputAction,
      this.suffixIcon,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChange,
      validator: validator,
      enabled: enabled,
      cursorColor: const Color(ColorCode.hintColor),
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      focusNode: focusNode,
      inputFormatters: inputFormatters ?? [],
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      onFieldSubmitted: nextFocus,
      style: style ?? TextStyles.text16.copyWith(
        color: const Color(ColorCode.hintColor),
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
      decoration: decoration ??
          InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.text16.copyWith(
              color: const Color(0xff979797),
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: border == true
                  ? BorderSide(
                      color: const Color(0xff808080).withOpacity(.2), width: 1)
                  : BorderSide(
                      color: const Color(0xff808080).withOpacity(.0), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: border == true
                  ? BorderSide(
                  color: const Color(0xff808080).withOpacity(.2), width: 1)
                  : BorderSide(
                  color: const Color(0xff808080).withOpacity(.0), width: 1)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: border == true
                  ? BorderSide(
                  color: const Color(0xff808080).withOpacity(.2), width: 1)
                  : BorderSide(
                  color: const Color(0xff808080).withOpacity(.9), width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: const Color(0xff808080).withOpacity(.2), width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: const Color(0xff808080).withOpacity(.2), width: 1),
            ),
            fillColor: fillColor ?? const Color(ColorCode.white).withOpacity(0.17),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14).r,
            prefixIcon: prefixIcon,
            suffixIcon: obscureText
                ? GestureDetector(
                    onTap: onTapShowHidePassword,
                    child: isHiddenPassword
                        ? const Icon(
                            Icons.visibility_off,
                            size: 24,
                            color: Color(0xff808080),
                          )
                        : null) //AppSVGAssets.getWidget(AppSVGAssets.showPassword))
                : suffixIcon,
          ),
    );
  }
}
