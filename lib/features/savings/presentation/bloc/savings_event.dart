abstract class SavingsEvent {}

class LoadSavingsEvent extends SavingsEvent {}

class UpdateSavingsEvent extends SavingsEvent {
  final double amount;
  final bool isCompA;

  UpdateSavingsEvent({required this.amount, required this.isCompA});
}

class AddSavingsEvent extends SavingsEvent {
  final double annualSavings;

  AddSavingsEvent({required this.annualSavings});
}
