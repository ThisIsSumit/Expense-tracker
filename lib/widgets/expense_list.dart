import 'package:expence_tracker/model/expense.dart';
import 'package:expence_tracker/widgets/expense_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {required this.expenses, required this.onRemove, super.key});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.8),
            margin: Theme.of(context).cardTheme.margin,
          ),
          onDismissed: (direction) {
            onRemove(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expenses[index])),
    );
  }
}
