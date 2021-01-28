class UserModel
{
  final String name;
  final String phone;
  final String id;
  final String image;
  final bool verified;
  final bool completed;

  UserModel({
    this.name,
    this.phone,
    this.id,
    this.image,
    this.verified,
    this.completed,
  });

  Map<String, dynamic> toMap()
  {
    return {
      'name': name,
      'phone': phone,
      'id': id,
      'image': image,
      'verified': verified,
      'completed': completed,
    };
  }
}
