class VillageModel {
  final String id;
  final String name;
  final String description;
  final String image;

  VillageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory VillageModel.fromJson(Map<String, dynamic> json) {
    return VillageModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
