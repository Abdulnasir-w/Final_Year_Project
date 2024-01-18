class Food {
  final int id;
  final int userId;
  final String foodName;
  final int quantity;
  Food({
    required this.id,
    required this.foodName,
    required this.userId,
    required this.quantity,
  });
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      userId: json['user_id'],
      foodName: json['foods_name'],
      quantity: json['qty'],
    );
  }
}
