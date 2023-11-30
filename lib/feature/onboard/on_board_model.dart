class OnboardModel {
  final String title;
  final String description;
  final String imageName;

  OnboardModel({required this.title, required this.description, required this.imageName});
  String get imageWithPath => 'asset/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnboardModel> onBoardItems = [
    OnboardModel(
        title: "Order Your Food",
        description: "Now you can order food any time right from your mobile. ",
        imageName: "ic_chef"),
    OnboardModel(
        title: "Order Your Food",
        description: "Now you can order food any time right from your mobile. ",
        imageName: "ic_delivery"),
    OnboardModel(
        title: "Order Your Food",
        description: "Now you can order food any time right from your mobile. ",
        imageName: "ic_order"),
  ];
}
