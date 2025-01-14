
import 'package:flutter/cupertino.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/settingViewModel.dart';
import 'package:provider/provider.dart';
import 'data/datasource/locale/locale_data_source.dart';
import 'injection.dart';
import 'presentation/modules/auth/auth_view_model.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<SettingViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),
      ],
      child: child,
    );
  }
}
