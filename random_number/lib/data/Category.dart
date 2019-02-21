class Category{
  final String backgroundAssetPath;
  final String gameName;
  final int gameIndex;
  Category({this.backgroundAssetPath,this.gameName,this.gameIndex});
}
final List<Category> backgroundCards = [
  Category(
    backgroundAssetPath: 'lib/res/images/number.jpg',
    gameName: 'Number',
    gameIndex: 1,
),
  Category(
    backgroundAssetPath:'lib/res/images/color.jpg',
    gameName: 'Color',
    gameIndex: 2,
  ),
  Category(
    backgroundAssetPath:'lib/res/images/animal.jpg',
    gameName: 'Animal',
    gameIndex: 3,
  ),
  Category(
    backgroundAssetPath:'lib/res/images/vehicle.jpg',
    gameName: 'Vehicle',
    gameIndex: 4,
  ),
  Category(
    backgroundAssetPath:'lib/res/images/fruit.jpg',
    gameName: 'Fruit',
    gameIndex: 5
  ),
];