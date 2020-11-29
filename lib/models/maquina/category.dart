class Category {
  final int id;
  final String categoryName;

  Category(this.id, this.categoryName);

  @override
  String toString() {
    return 'Category{id: $id, categoryName: $categoryName}';
  }
}
