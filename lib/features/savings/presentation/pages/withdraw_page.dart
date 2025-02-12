import 'package:dd_test/features/savings/presentation/bloc/savings_bloc.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_event.dart';
import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  final SavingsBloc savingsBloc;

  const WithdrawPage({super.key, required this.savingsBloc});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final TextEditingController _amountController = TextEditingController();
  String selectedComponent = 'CompA'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedComponent,
              isExpanded: true,
              items: ['CompA', 'CompB'].map((String component) {
                return DropdownMenuItem<String>(
                  value: component,
                  child: Text(component),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedComponent = value ?? selectedComponent;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Enter Withdrawal Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
                hintText: 'Enter amount to withdraw',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final amount = double.tryParse(_amountController.text);
                if (amount != null && amount > 0) {
                  widget.savingsBloc.add(
                    UpdateSavingsEvent(
                      amount: amount,
                      isCompA: selectedComponent == 'CompA',
                    ),
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
              child: const Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
