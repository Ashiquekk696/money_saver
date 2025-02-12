import 'package:dd_test/data/data_sources/data_base_helper.dart';
import 'package:dd_test/data/models/savings_model.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_event.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsBloc extends Bloc<SavingsEvent, SavingsState> {
  final DatabaseHelper databaseHelper;

  SavingsBloc(this.databaseHelper)
      : super(SavingsState(compA: 0, compB: 0, history: [])) {
    on<LoadSavingsEvent>(_onLoadSavings);
    on<UpdateSavingsEvent>(_onUpdateSavings);
    on<AddSavingsEvent>(_onAddSavings);
  }

  Future<void> _onLoadSavings(
      LoadSavingsEvent event, Emitter<SavingsState> emit) async {
    final savings = await databaseHelper.getSavings();
    emit(SavingsState(
        compA: savings.compA, compB: savings.compB, history: savings.history));
  }

  Future<void> _onUpdateSavings(
      UpdateSavingsEvent event, Emitter<SavingsState> emit) async {
    final currentState = state;
    double newCompA = currentState.compA;
    double newCompB = currentState.compB;
    final newHistory = List<String>.from(currentState.history);

    if (event.isCompA) {
      newCompA -= event.amount;
      newHistory.add('Withdrew \$${event.amount} from CompA');
    } else {
      newCompB -= event.amount;
      newHistory.add('Withdrew \$${event.amount} from CompB');
    }

    final updatedSavings = SavingsModel(
      compA: newCompA,
      compB: newCompB,
      history: newHistory,
    );

    await databaseHelper.updateSavings(updatedSavings);
    emit(SavingsState(compA: newCompA, compB: newCompB, history: newHistory));
  }

  Future<void> _onAddSavings(
      AddSavingsEvent event, Emitter<SavingsState> emit) async {
    final currentState = state;
    double newCompA = currentState.compA + event.annualSavings / 2;
    double newCompB = currentState.compB + event.annualSavings / 2;
    final newHistory = List<String>.from(currentState.history)
      ..add('Added \$${event.annualSavings} to CompA and CompB');

    final updatedSavings = SavingsModel(
      compA: newCompA,
      compB: newCompB,
      history: newHistory,
    );

    await databaseHelper.updateSavings(updatedSavings);
    emit(SavingsState(compA: newCompA, compB: newCompB, history: newHistory));
  }
}
