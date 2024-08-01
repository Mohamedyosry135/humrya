import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class RentalClubWidget extends StatelessWidget {
  double heigtimage;
  double weightimage;
  List albumsPhotos;
  List text;




  RentalClubWidget( this.albumsPhotos,this.heigtimage,this.weightimage,this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      primary: true,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing:14,
        childAspectRatio:50 / 40,
         ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            // PersistentNavBarNavigator.pushNewScreen(
            //   context,
            //   screen:  RentalHotelView(),
            //   withNavBar: false, // OPTIONAL VALUE. True by default.
            //   pageTransitionAnimation:
            //   PageTransitionAnimation.fade,
            // );

          },
          child: Container(
            height: heigtimage.h,
            width: weightimage.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),

                image: DecorationImage(colorFilter:
                ColorFilter.mode(const Color(ColorCode.primary).withOpacity(0.5), BlendMode.color),
                    image: albumsPhotos[index], fit: BoxFit.fill,),),
            child: Center(
                child: CustomText(
                  text[index],
                  maxLines: 4,
                  textStyle: TextStyles.text13.copyWith(
                      fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white),
                )),
          ),
        );
      },
      itemCount: 6,
    );


  }
}







