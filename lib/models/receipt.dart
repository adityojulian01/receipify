class Receipt {
  String title;
  String image;
  String ingredients;
  bool allocated;

  Receipt(
      {required this.title,
      required this.image,
      required this.allocated,
      required this.ingredients});
}

List<Receipt> receipt = [
  Receipt(
      title: "",
      image: "https://i.imgur.com/dXbbWJo.jpg",
      ingredients:
          "balsamic vinegar,brown sugar,chicken drumsticks,parsley,garlic cloves,honey,rosemary,sesame seeds,soy sauce",
      allocated: true),
  // Receipt(
  //     title: "Sainsbury",
  //     image:
  //         "https://images.iwaspoisoned.com/424042/tn1200w_16069525823769.jpeg",
  //     allocated: true),
  // Receipt(
  //     title: "Aldi",
  //     image:
  //         "https://images.iwaspoisoned.com/424042/tn1200w_16069525823769.jpeg",
  //     allocated: false),
];
