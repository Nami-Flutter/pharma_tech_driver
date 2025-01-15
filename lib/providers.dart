
import 'package:flutter/cupertino.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/provider/login_provider.dart';
import 'package:pharma_tech_driver/presentation/modules/home/Notifications/provider/notifications_provider.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/order_details_view_model.dart';
import 'package:pharma_tech_driver/presentation/modules/home/provider/home_provider.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/settingViewModel.dart';
import 'package:provider/provider.dart';
import 'data/datasource/locale/locale_data_source.dart';
import 'injection.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LoginLogoutViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<SettingViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<OrderDetailsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<NotificationViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),
      ],
      child: child,
    );
  }
}
