part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const ONBOARDING = '/onboarding';
  static const SINGLE_MISSION_INTRO = '/singleMissionIntro';
  static const HOME = '/home';
  static const MAIN = '/main';
  static const TICKET = '/ticket';
  static const MATCHDETAILS = '/matchDetails';
  static const BOOKTICKET = '/bookTicket';
  static const CLUB = '/club';
  static const PERIODICTABLE =  '/periodicTable';
  static const FIRSTTEAMNEWS = '/FirstTeamNews';
  static const OTP = '/otp';
  static const FOOTBALL = '/football';
  static const FIRSTTEAM = '/firstTeam';
  static const GALLERY = '/gallery';
  static const SHARQACLUPSGALLERY = '/sharqaClubsGallery';
  static const COACHINGSTAFF = '/coachingStaff';
  static const STARTING = '/starting';
  static const ACHIEVE = '/achieve';
  static const CEO = '/ceo';
  static const PLAYERS = '/players';
  static const COACHING = '/coaching';
  static const FUTSALPLAYERS = '/futsalPlayers';
  static const SPORTSPLAYERS = '/sportsPlayers';
  static const SPORTSGALLERY = '/sportsGallery';
  static const ABOUTCLUB = '/aboutClub';
  static const CONFIRMBOOKING = '/confirmBooking';
  static const POLICY = '/confirmBooking';
  static const SINGLE_MIISION_STEP2 = '/singleMissionStep2';
  static const NOTIFICATIONS = '/notifications';
  static const MENU = '/menu';
  static const FORGET_PASSWORD = '/forgetPassword';
  static const SINGLE_MIISION_STEP3 = '/singleMissionStep3';
  static const SINGLE_MISSION_COMPLETED = '/singleMissionCompleted';
  static const ACC_DETAILS = '/acc_details';
  static const STATISTIC = '/Statistics';
  static const ALL_TASKS = '/all_tasks';
  static const COMPLETE_STEP5 = '/complete_step5';
  static const SETTING = '/setting';
  static const STEP2COVERAGEDENSITIES = '/step2CoverageDensities';
  static const STEP2_INSECT_EXPLORATION_ADULT = '/Step2InsectExplorationAdult';
  static const STEP2_INSECT_EXPLORATION_LARVAL =
      '/Step2InsectExplorationLarval';
  static const STEP2_REPORT_COVERAGE = '/Step2ReportCoverage';
  static const STEP2_Covering_Suspected_Dengue_Fever =
      '/coveringSuspectedDengueFever';
  static const STEP2_EXTERNAL_COMBAT = '/externalCombat';
  static const FULLIMAGE = '/fullImage';
  static const SUPPORT = '/support';
  static const UPDATEPASS = '/updatePassword';
  static const SportsGame = '/SportsGame';
  static const individualGame = '/individualGame';
  static const teamGame = '/teamGame';
  static const MYNOTIFICATION = '/MYNOTIFICATION';
  static const MYSETTING = '/MYSETTING';






  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$SIGNUP?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}
