class CategoryModel {
  String id;
  String label;
  String image;

  CategoryModel({required this.id, required this.label, required this.image});

  static List<CategoryModel> categories(String theme) {
    return [
      CategoryModel(
        id: 'general',
        label: 'General',
        image: 'assets/images/${theme}_general.png',
      ),
      CategoryModel(
        id: 'business',
        label: 'Business',
        image: 'assets/images/${theme}_business.png',
      ),
      CategoryModel(
        id: 'sports',
        label: 'Sports',
        image: 'assets/images/${theme}_sport.png',
      ),
      CategoryModel(
        id: 'technology',
        label: 'Technology',
        image: 'assets/images/${theme}_technology.png',
      ),
      CategoryModel(
        id: 'entertainment',
        label: 'Entertainment',
        image: 'assets/images/${theme}_entertainment.png',
      ),
      CategoryModel(
        id: 'health',
        label: 'Health',
        image: 'assets/images/${theme}_health.png',
      ),
      CategoryModel(
        id: 'science',
        label: 'Science',
        image: 'assets/images/${theme}_science.png',
      ),
    ];
  }
}
