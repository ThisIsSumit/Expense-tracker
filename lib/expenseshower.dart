import 'package:expence_tracker/newexpense.dart';
import 'package:expence_tracker/widgets/chart/chart.dart';
import 'package:expence_tracker/widgets/expense_list.dart';
import 'package:expence_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenceShower extends StatefulWidget {
  const ExpenceShower({super.key});
  @override
  State<ExpenceShower> createState() {
    return ExpenceShowerState();
  }
}

class ExpenceShowerState extends State<ExpenceShower> {
  final List<Expense> registeredExpense = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "pizza",
        amount: 5,
        date: DateTime.now(),
        category: Category.food),
  ];
  void addExpence(Expense expence) {
    setState(() {
      registeredExpense.add(expence);
    });
  }

  void removeExpence(Expense expence) {
    final expenseIndex = registeredExpense.indexOf(expence);

    setState(() {
      registeredExpense.remove(expence);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "undo",
            onPressed: () {
              setState(() {
                registeredExpense.insert(expenseIndex, expence);
              });
            }),
      ),
    );
  }

  void openAddExpences() {
    //adding modal sheet
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      //setting the overlays from bottom
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addExpence),
    );
  }

  @override
  Widget build(context) {
    final width=MediaQuery.of(context).size.width;
    Widget maincontent =
        const Center(child: Text("No expenses found. Start adding some!"));
    if (registeredExpense.isNotEmpty) {
      maincontent =
          ExpenseList(onRemove: removeExpence, expenses: registeredExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ExpenseTracker"),
        actions: [
          IconButton(onPressed: openAddExpences, icon: const Icon(Icons.add)),
        ],
      ),
      body: width<600? Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Chart(expenses: registeredExpense),
          Expanded(child: maincontent),
        ],
      ) : Row(children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(child: Chart(expenses: registeredExpense)),
          Expanded(child: maincontent),

      ]),
    );
  }
}
