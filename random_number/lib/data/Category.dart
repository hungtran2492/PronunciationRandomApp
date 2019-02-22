class Category{
  final String backgroundAssetPath;
  final String gameName;
  final int gameIndex;
  final String backgroundGamePath;
  Category({this.backgroundAssetPath,this.gameName,this.gameIndex,this.backgroundGamePath});
}
final List<Category> backgroundCards = [
  Category(
    backgroundAssetPath: 'lib/res/images/number.jpg',
    gameName: 'Number',
    gameIndex: 1,
    backgroundGamePath:'lib/res/images/background_1.jpg'
),
  Category(
    backgroundAssetPath:'lib/res/images/color.jpg',
    gameName: 'Color',
    gameIndex: 2,
    backgroundGamePath: 'lib/res/images/color_background.jpg'
  ),
  Category(
    backgroundAssetPath:'lib/res/images/animal.jpg',
    gameName: 'Animal',
    gameIndex: 3,
    backgroundGamePath: 'lib/res/images/background_2.jpg'
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