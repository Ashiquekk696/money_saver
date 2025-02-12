class SavingsModel {
  final double compA;
  final double compB;
  final List<String> history;

  SavingsModel({
    required this.compA,
    required this.compB,
    required this.history,
  });

  Map<String, dynamic> toMap() {
    return {
      'compA': compA,
      'compB': compB,
      'history': history.join(';'),
    };
  }

  factory SavingsModel.fromMap(Map<String, dynamic> map) {
    return SavingsModel(
      compA: map['compA'] ?? 0.0,
      compB: map['compB'] ?? 0.0,
      history: (map['history'] as String).split(';'),
    );
  }
}
