import 'package:expenses_app_two/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem(this.expense, {super.key});

  final ExpenseModel expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${expense.amount.toStringAsFixed(2)}",
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(expense.formattingDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
