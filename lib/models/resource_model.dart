class ResouceModel {
  final String title;
  final String quantity;
  final String image;
  final List<ResouceModel>? resources;
  bool isComplete;

  ResouceModel({
    required this.title,
    required this.quantity,
    required this.image,
    this.resources,
    this.isComplete = false,
  });
}
