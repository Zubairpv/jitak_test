class HomeDataModel {
  final String heading;
  final String subHeading;
  final String price;
  final String dateTimeData;
  final String descriptionData;
  final String subDescription;
  final String image;
  bool liked = false;

  HomeDataModel(
      {required this.heading,
      required this.subHeading,
      required this.image,
      required this.price,
      required this.dateTimeData,
      required this.descriptionData,
      required this.subDescription});
  static List<HomeDataModel> home = [
    HomeDataModel(
        heading: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
        subHeading: "介護付き有料老人ホーム",
        price: "¥ 6,000",
        image:
            "https://images.pexels.com/photos/3768131/pexels-photo-3768131.jpeg",
        dateTimeData: "5月 31日 (水) 08 : 00 ~ 17 : 00",
        descriptionData: "北海道札幌市東雲町3丁目916番地17号 交通費 300円",
        subDescription: "住宅型有料老人ホームひまわり倶楽部"),
    HomeDataModel(
        heading: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
        subHeading: "介護付き有料老人ホーム",
        price: "6,000円 ",
        dateTimeData: "5月 31日（水）00 : 00 ~ 00 : 00 （休憩60分）",
        image:
            "https://images.pexels.com/photos/7551610/pexels-photo-7551610.jpeg?auto=compress&cs=tinysrgb&w=600",
        descriptionData: "北海道札幌市東雲町3丁目916番地17号 交通費 300円",
        subDescription: "住宅型有料老人ホームひまわり倶楽部"),
    HomeDataModel(
        heading: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
        subHeading: "介護付き有料老人ホーム",
        price: "6,000円 ",
        dateTimeData: "5月 31日（水）00 : 00 ~ 00 : 00 （休憩60分）",
        descriptionData: "北海道札幌市東雲町3丁目916番地17号 交通費 300円",
        subDescription: "住宅型有料老人ホームひまわり倶楽部",
        image:
            "https://santecares.com/wp-content/uploads/2018/03/iStock-804432340.jpg")
  ];
}
