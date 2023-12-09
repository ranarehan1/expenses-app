import 'package:expenses_app_two/widgets/expenses_list/expenses_list_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app_two/models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onDelete});
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onDelete;
  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          if(width> 600){
            return Dismissible(
              direction: DismissDirection.startToEnd,
                key: ValueKey(expenses[index]),
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.4),
                  margin:  EdgeInsets.symmetric(
                      horizontal: Theme.of(context).cardTheme.margin!.horizontal - 16,
                      vertical: Theme.of(context).cardTheme.margin!.vertical - 8
                  ),
                  child:const Icon(Icons.delete, color: Colors.red,),
                ),
                onDismissed: (direction){
                  onDelete(expenses[index]);
                },
                child: ExpensesListItem(expenses[index]));
          }
          else{
            return Dismissible(

                key: ValueKey(expenses[index]),
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.4),
                  margin:  EdgeInsets.symmetric(
                      horizontal: Theme.of(context).cardTheme.margin!.horizontal - 16,
                      vertical: Theme.of(context).cardTheme.margin!.vertical - 8
                  ),
                  child:const Icon(Icons.delete, color: Colors.red,),
                ),
                onDismissed: (direction){
                  onDelete(expenses[index]);
                },
                child: ExpensesListItem(expenses[index]));
          }

        });
  }
}
