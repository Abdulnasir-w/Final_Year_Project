class Food {
  final String id;
  final String userId;
  final String foodName;
  final String quantity;
  final String otp;
  Food({
    required this.id,
    required this.foodName,
    required this.userId,
    required this.quantity,
    required this.otp,
  });
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'].toString(),
      userId: json['user_id'].toString(),
      foodName: json['foods_name'].toString(),
      quantity: json['qty'].toString(),
      otp: json['otp'].toString(),
    );
  }
}
