import 'package:dd_test/features/savings/presentation/bloc/savings_bloc.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  final SavingsBloc savingsBloc;
  const HistoryPage({super.key, required this.savingsBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings History'),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<SavingsBloc, SavingsState>(
        bloc: savingsBloc, // Use the passed bloc instance
        builder: (context, state) {
          // Filter out empty items from the history list
          final filteredHistory =
              state.history.where((item) => item.isNotEmpty).toList();

          return filteredHistory.isEmpty
              ? const Center(child: Text('No history found'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: filteredHistory.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(filteredHistory[index]),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
