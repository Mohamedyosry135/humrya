import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class CustomDropDownWidget<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final Function(T?) onChange;
   TextStyle?textStyles;
   Widget ?icon;
   String ?title;
   CustomDropDownWidget({Key? key,this.title,required this.value,required this.items,required this.onChange,this.textStyles,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14),
      decoration: BoxDecoration(
        color: const Color(ColorCode.white),
          borderRadius: BorderRadius.circular(10),

      ),
      child: DropdownButton<T>(
        value: value,
        icon: icon,
        elevation: 0,
        style: TextStyles.text22.copyWith(

            color: const Color(ColorCode.black),
        ),
        items: items.map((T items) {
          return DropdownMenuItem(
            value: items,

            child: CustomText(
              items.toString(),
              textStyle:textStyles?? TextStyles.text16.copyWith(),
            )
          );
        }).toList(),
        dropdownColor: const Color(ColorCode.white),
        menuMaxHeight: 300,
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (T? val){
          onChange(val);
        },
      ),
    );
  }
}
