import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:login_provider/feature/login/view/login_view.dart';
import 'package:login_provider/feature/onboard/on_board_model.dart';
import 'package:login_provider/feature/onboard/tab_indicator.dart';
import 'package:login_provider/product/padding/page_padding.dart';
import 'package:login_provider/product/widget/on_board_card.dart';
import 'package:provider/provider.dart';

import '../../product/model/state/project_context.dart';
part './module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTile = "Skip";

  int _selectedIndex = 0;
  bool get _isLastPage => OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  void _incrementAndChance([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    _changeBackEnable(false);
    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (isBackEnable.value == value) return;
    isBackEnable.value = value;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const Pagepadding.all(),
        child: Column(children: [
          Expanded(
            child: _pageViewItems(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabIndicator(selectedIndex: _selectedIndex),
              _StartFabButton(
                isLastPage: _isLastPage,
                onPress: () {
                  _incrementAndChance();
                },
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget _pageViewItems() {
    return PageView.builder(
      itemCount: OnBoardModels.onBoardItems.length,
      onPageChanged: (value) {
        _incrementAndChance(value);
      },
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        TextButton(
          onPressed: () {
            context.read<ProductContext>().changeName(
                  "Ali",
                );
            context.route.navigateToPage(const LoginView());
          },
          child: Text(_skipTile),
        ),
      ],
      title: Text(
        context.watch<ProductContext>().newUserName,
        style: const TextStyle(color: Colors.blueAccent),
      ),
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.black,
              ),
            ),
    );
  }
}
