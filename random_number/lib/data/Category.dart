class Category{
  final String backgroundAssetPath;
  final String gameName;
  final int gameIndex;
  final String backgroundGamePath;
  Category({this.backgroundAssetPath,this.gameName,this.gameIndex,this.backgroundGamePath});
}
final List<Category> backgroundCards = [
  Category(
    backgroundAssetPath: 'assets/image/background/number.jpg',
    gameName: 'Number',
    gameIndex: 1,
    backgroundGamePath:'assets/image/background/background_1.jpg'
),
  Category(
    backgroundAssetPath:'assets/image/background/color.jpg',
    gameName: 'Color',
    gameIndex: 2,
    backgroundGamePath: 'assets/image/background/background_3.jpg'
  ),
  Category(
    backgroundAssetPath:'assets/image/background/animal.jpg',
    gameName: 'Animal',
    gameIndex: 3,
    backgroundGamePath: 'assets/image/background/background_2.jpg'
  ),
  Category(
    backgroundAssetPath:'assets/image/background/vehicle.jpg',
    gameName: 'Vehicle',
    gameIndex: 4,
    backgroundGamePath: 'assets/image/background/background_3.jpg'
  ),
  Category(
    backgroundAssetPath:'assets/image/background/fruit.jpg',
    gameName: 'Fruit',
    gameIndex: 5,
    backgroundGamePath: 'assets/image/background/background_1.jpg'
  ),
];