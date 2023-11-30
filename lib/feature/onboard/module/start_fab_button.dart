part of '../on_board_view.dart';

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({this.onPress, required this.isLastPage});
  final String _start = "Start";
  final String _next = "Next";
  final VoidCallback? onPress;
  final bool isLastPage;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: Text(
        isLastPage ? _start : _next,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
