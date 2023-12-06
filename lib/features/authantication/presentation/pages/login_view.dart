import 'package:clean_architecture_with_provider/core/router/app_state.dart';
import 'package:clean_architecture_with_provider/core/router/models/page_config.dart';
import 'package:clean_architecture_with_provider/core/utils/globals/globals.dart';
import 'package:clean_architecture_with_provider/features/authantication/presentation/manager/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/enums/page_state_enum.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
AuthProvider loginProvider = sl();

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginProvider.login();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => loginProvider,
      child: Consumer<AuthProvider>(builder: (context, provider, child) {

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: provider.loginEmailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                TextField(
                  controller: provider.loginPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('object');
                    AppState appState = sl();
                    appState.goToNext(PageConfigs.userListPageConfig,pageState: PageState.addPage);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
