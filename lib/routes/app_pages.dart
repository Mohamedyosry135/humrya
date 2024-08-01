
import 'package:example_structure/pages/about_club/binding/about_club_binding.dart';
import 'package:example_structure/pages/about_club/presentation/views/about_club_view.dart';
import 'package:example_structure/pages/achievements/binding/achieve_binding.dart';
import 'package:example_structure/pages/achievements/presentation/views/achieve_view.dart';
import 'package:example_structure/pages/book_ticket/bindings/book_ticket_binding.dart';
import 'package:example_structure/pages/book_ticket/presentation/views/book_ticket_view.dart';
import 'package:example_structure/pages/ceo_s/binding/ceo_binding.dart';
import 'package:example_structure/pages/ceo_s/presentation/views/ceo_view.dart';

import 'package:example_structure/pages/confirm_booking/binding/confirm_booking_binding.dart';
import 'package:example_structure/pages/confirm_booking/presentation/view/confirm_booking.dart';
import 'package:example_structure/pages/first_team/bindings/first_team_binding.dart';
import 'package:example_structure/pages/first_team_views/bindings/first_team_news_binding.dart';
import 'package:example_structure/pages/first_team_views/presentation/views/first_team_news_view.dart';
import 'package:example_structure/pages/football/bindings/football_binding.dart';
import 'package:example_structure/pages/futsal_coaching_staff/bindings/coaching_staff_binding.dart';
import 'package:example_structure/pages/futsal_coaching_staff/presentation/views/coaching_staff_view.dart';
import 'package:example_structure/pages/gallery/bindings/gallery_binding.dart';
import 'package:example_structure/pages/gallery/presentation/views/gallery_view.dart';
import 'package:example_structure/pages/hamrya_club/binding/club_binding.dart';
import 'package:example_structure/pages/hamrya_club/presentation/views/club_view.dart';
import 'package:example_structure/pages/home/bindings/home_binding.dart';
import 'package:example_structure/pages/home/presentation/views/home_view.dart';
import 'package:example_structure/pages/login/presentation/views/login_view.dart';
import 'package:example_structure/pages/match_details/bindings/match_details_binding.dart';
import 'package:example_structure/pages/match_details/presentation/views/match_details_view.dart';
import 'package:example_structure/pages/onboarding/presentation/views/onboarding_view.dart';
import 'package:example_structure/pages/periodic_table/bindings/periodic_table_binding.dart';
import 'package:example_structure/pages/periodic_table/presentation/views/periodic_table_view.dart';
import 'package:example_structure/pages/players/presentation/views/players_view.dart';
import 'package:example_structure/pages/quality_policy/binding/policy_binding.dart';
import 'package:example_structure/pages/quality_policy/presentation/views/policy_view.dart';
import 'package:example_structure/pages/splash/presentation/views/splash_view.dart';
import 'package:example_structure/pages/starting/binding/starting_binding.dart';
import 'package:example_structure/pages/starting/presentation/views/starting_view.dart';
import 'package:example_structure/pages/ticket/bindings/ticket_binding.dart';
import 'package:example_structure/pages/ticket/presentation/views/ticket_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../pages/first_team/presentation/views/first_team_view.dart';
import '../pages/football/presentations/views/football_view.dart';
import '../pages/futsal_players/bindings/futsal_players_binding.dart';
import '../pages/futsal_players/presentation/views/futsal_players_view.dart';
import '../pages/login/bindings/login_binding.dart';
import '../pages/main/bindings/main_view_binding.dart';
import '../pages/main/presentation/views/main_view.dart';
import '../pages/onboarding/bindings/onboarding_binding.dart';
import '../pages/otp/bindings/otp_binding.dart';
import '../pages/otp/presentation/views/otp_view.dart';
import '../pages/players/bindings/players_binding.dart';
import '../pages/sharqa_clubs_gallery/bindings/sharqa_clubs_bindings.dart';
import '../pages/sharqa_clubs_gallery/presentation/views/sharqa_clubs_gallery_views.dart';
import '../pages/signup/bindings/signup_binding.dart';
import '../pages/signup/presentation/views/signup_view.dart';
import '../pages/splash/bindings/splash_binding.dart';


part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.FUTSALPLAYERS,
      page: () => FutsalPlayersView(),
      binding: FutsalPlayersBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () =>  LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OTPView(),
      binding: OTPBinding(),
    ),
    GetPage(
        name: Routes.MAIN,
        page: () => const MainScreenView(),
        binding: MainViewBinding()),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.TICKET,
      page: () => const TicketView(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: Routes.MATCHDETAILS,
      page: () =>  MatchDetailsView(),
      binding: MatchDetailsBinding(),
    ),
    GetPage(
      name: Routes.BOOKTICKET,
      page: () =>  BookTicketView(),
      binding: BookTicketBinding(),
    ),
    GetPage(
      name: Routes.CONFIRMBOOKING,
      page: () => const ConfirmBookingView(),
      binding: ConfirmBookingBinding(),
    ),

    GetPage(
      name: Routes.CLUB,
      page: () => const ClubView(),
      binding: ClubBinding(),
    ),
    GetPage(
      name: Routes.ABOUTCLUB,
      page: () => const AboutClubView(),
      binding: AboutClubBinding(),
    ),
    GetPage(
      name: Routes.STARTING,
      page: () =>  StartingView(),
      binding: StartingBinding(),
    ),
    GetPage(
      name: Routes.ACHIEVE,
      page: () => const AchieveView(),
      binding: AchieveBinding(),
    ),
    GetPage(
      name: Routes.CEO,
      page: () => const CeoView(),
      binding: CeoBinding(),
    ),
    GetPage(
      name: Routes.FOOTBALL,
      page: () => FootballView(),
      binding: FootballBinding(),
    ),
    GetPage(
      name: Routes.FIRSTTEAM,
      page: () => FirstTeamView(),
      binding: FirstTeamBinding(),
    ),
    GetPage(
      name: Routes.GALLERY,
      page: () => GalleryView(),
      binding: GalleryBinding(),
    ),
    GetPage(
      name: Routes.SHARQACLUPSGALLERY,
      page: () => SharqaClubsGalleryView(),
      binding: SharqaClubsGalleryBindings(),
    ),

    GetPage(
        name: Routes.PLAYERS,
        page: () => PlayersView(),
        binding: PlayersBinding()),
    GetPage(
        name: Routes.PERIODICTABLE,
        page: () =>  PeriodicTableView(),
        binding: PeriodicTableBinding()),
    GetPage(
        name: Routes.FIRSTTEAMNEWS,
        page: () =>  FirstTeamNewsView(),
        binding: FirstTeamNewsBinding()),
    GetPage(name: Routes.COACHING, page: () =>  FutsalCoachingStaffView(),binding: FutsalCoachingStaffBinding())
  ];
}

