class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
    description: 'Empowering Farmers and Landowners to\nConnect Seamlessly',
    image: "images/screen1.png",
    title: 'Welcome to\nKheti Shayak',
  ),
  UnboardingContent(
    description: 'Access tools and crops whenever you need them.',
    image: "images/screen2.png",
    title: 'Start Renting Today',
  ),
  UnboardingContent(
    description: 'Explore our rental options for efficient farming.',
    image: "images/screen3.png",
    title: 'Enhance Your Farming Experience',
  )
];
