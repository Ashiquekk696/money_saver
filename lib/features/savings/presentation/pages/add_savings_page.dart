 
import 'package:dd_test/features/savings/presentation/bloc/savings_bloc.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_event.dart';
import 'package:flutter/material.dart';

class AddSavingsPage extends StatelessWidget {
  final TextEditingController _annualSavingsController =
      TextEditingController();
  final SavingsBloc savingsBloc;

  AddSavingsPage({super.key, required this.savingsBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Annual Savings'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Annual Savings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _annualSavingsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
                hintText: 'Enter annual savings',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final annualSavings =
                    double.tryParse(_annualSavingsController.text);
                if (annualSavings != null && annualSavings > 0) {
                  savingsBloc.add(
                    AddSavingsEvent(annualSavings: annualSavings),
                  );
                  Navigator.pop(context); // Return to the main screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid amount!'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
