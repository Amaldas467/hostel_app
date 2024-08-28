import 'package:hostel_app/screens/bookingscreen/booking.dart';
import 'package:hostel_app/screens/favouritescreen/favourites.dart';
import 'package:hostel_app/screens/homescreen/widgets/drawer_screens/profile_screen.dart';
//import 'package:hostel_app/screens/homescreen/widgets/drawer_screens/profile_screen.dart';
import 'package:hostel_app/screens/mainscreen/mainscreen.dart';
import 'package:hostel_app/screens/search_screen/search_view.dart';
import 'package:hostel_app/screens/signin_page/signin_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../screens/homescreen/widgets/drawer_screens/refer_screen.dart';
import '../screens/signup_page/signup_view.dart';
import '../screens/splash_screen/splash_view.dart';
import '../services/api_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: MainScreen),
    MaterialRoute(page: SearchScreen),
    MaterialRoute(page: Booking),
    MaterialRoute(page: Favourites),
    MaterialRoute(page: ProfileScreen),
    MaterialRoute(page: ReferScreen),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {}
