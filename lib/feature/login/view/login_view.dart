import 'package:flutter/material.dart';
import 'package:login_provider/feature/login/view_model/login_view_model.dart';
import 'package:login_provider/product/constant/image_enum.dart';
import 'package:kartal/kartal.dart';
import 'package:login_provider/product/model/state/user_context.dart';
import 'package:login_provider/product/padding/page_padding.dart';
import 'package:login_provider/product/utility/input_decorations.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String fieldName = "Name";
  final String loginTitle = "Login";
  final String rememberTitle = "Remember me";
  late final LoginViewModel _loginViewModel;
  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView(context);
      },
    );
  }

  Widget _bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.read<UserContext?>()?.name ?? "",
          style: const TextStyle(color: Colors.red),
        ),
        leading: _leadingAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const Pagepadding.low(),
          child: Column(children: [
            SizedBox(
              height: context.sized.dynamicHeight(0.2),
              width: context.sized.dynamicWidth(0.3),
              child: ImageEnums.door.toImage,
            ),
            Text(
              loginTitle,
              style: context.general.textTheme.titleMedium,
            ),
            TextField(
              decoration: ProjectInputs(fieldName),
            ),
            ElevatedButton(
              onPressed: _loginViewModel.isLoading
                  ? null
                  : () {
                      _loginViewModel.controlTextValue();
                    },
              child: Center(
                child: Text(
                  loginTitle,
                ),
              ),
            ),
            CheckboxListTile(
              value: context.watch<LoginViewModel>().isCheckBoxokay,
              title: Text(rememberTitle),
              onChanged: (value) {
                context.read<LoginViewModel>().chackBoxChange(value ?? false);
              },
            )
          ]),
        ),
      ),
    );
  }

  Widget _leadingAppBar() {
    return Selector<LoginViewModel, bool>(
      builder: (context, value, child) {
        return value ? const Center(child: CircularProgressIndicator()) : const SizedBox();
      },
      selector: (context, viewModel) {
        return viewModel.isLoading;
      },
    );
  }
}
