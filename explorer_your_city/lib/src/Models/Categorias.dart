class Categoria {
  String name, path;

  Categoria({this.name, this.path});
}

List<Categoria> categorias = [
  Categoria(name: 'Gastronomia', path: 'assets/icons/gastronomy.png'),
  Categoria(name: 'Salud', path: 'assets/icons/health.png'),
  Categoria(name: 'Recreacion', path: 'assets/icons/recreation.png'),
  Categoria(name: 'Deporte', path: 'assets/icons/sport.png')
];

List<Map> categorie = [
  {'name': 'Gastronomia', 'path': 'assets/icons/Gastronomy.png'},
  {'name': 'Salud',       'path': 'assets/icons/Health.png'},
  {'name': 'Recreacion',  'path': 'assets/icons/Recreation.png'},
  {'name': 'Deporte',     'path': 'assets/icons/Sport.png'}
];
