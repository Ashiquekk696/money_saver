import 'package:dd_test/features/savings/presentation/bloc/savings_bloc.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_state.dart';
import 'package:dd_test/features/savings/presentation/pages/add_savings_page.dart';
import 'package:dd_test/features/savings/presentation/pages/history_page.dart';
import 'package:dd_test/features/savings/presentation/pages/withdraw_page.dart';
import 'package:dd_test/utils/app_colors.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Savings Tracker',
          style: const TextStyle(color: AppColors.yellow50,),
        ),
        centerTitle: true,
        backgroundColor: AppColors.teal,
      ),
      body: BlocBuilder<SavingsBloc, SavingsState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.tealShade100, Colors.teal.shade50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                _buildSavingsCard(
                  title: "CompA Balance",
                  value: state.compA,
                  color: AppColors.teal,
                ),
                const SizedBox(height: 16),
                _buildSavingsCard(
                  title: "CompB Balance",
                  value: state.compB,
                  color: Colors.orange,
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  title: 'Add Annual Savings',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddSavingsPage(
                          savingsBloc: BlocProvider.of<SavingsBloc>(context),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  title: 'Withdraw',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WithdrawPage(
                          savingsBloc: BlocProvider.of<SavingsBloc>(context),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  title: 'View History',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HistoryPage(
                          savingsBloc: BlocProvider.of<SavingsBloc>(context),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSavingsCard(
      {required String title, required double value, required Color color}) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${value.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.tealShade400,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.offWhite),
      ),
    );
  }
}
