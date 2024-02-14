class Country {
  String name;
  String capital;
  double population;
  double area;
  String flagUrl;

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.area,
    required this.flagUrl,
  });
   factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      capital: json['capital'] != null ? json['capital'][0] : 'N/A',
      population: json['population'] ?? 0,
      area: json['area'] ?? 0,
      flagUrl: json['flags']['png'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'capital': capital,
      'population': population,
      'area': area,
      'flagUrl': flagUrl,
    };
  }

}