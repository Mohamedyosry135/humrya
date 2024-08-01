import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../first_team_views/presentation/views/first_team_news_view.dart';
import '../Media_news_View.dart';

class MedianewsWidget extends StatelessWidget {
  double heigtimage;
  double weightimage;
  List albumsPhotos;
  List text;




  MedianewsWidget( this.albumsPhotos,this.heigtimage,this.weightimage,this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ]),
        child:
        GridView.builder(
          primary: true,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing:8,
            childAspectRatio:50 / 40,
             ),
          itemBuilder: (BuildContext _context, int _index) {
            return InkWell(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen:   FirstTeamNewsView(backwadget: MedianewsView(),title: text[_index]),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              child: Container(
                height: heigtimage.h,
                width: weightimage.w,
                decoration: BoxDecoration(
                    color: const Color(ColorCode.primary).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        image: albumsPhotos[_index], fit: BoxFit.fill)),
                child: Center(
                    child: CustomText(
                      text[_index],
                      maxLines: 4,
                      textStyle: TextStyles.text13.copyWith(
                          fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white),
                    )),
              ),
            );
          },
          itemCount: 6,
        ),
      );


  }
}







