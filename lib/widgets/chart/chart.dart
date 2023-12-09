import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget{
  const Chart({super.key, required this.expense});
  final List<ExpenseModel> expense;

  List<ExpenseBucket> get buckets{
    return [
      ExpenseBucket.forCategory(expense, Category.leisure),
      ExpenseBucket.forCategory(expense, Category.food),
      ExpenseBucket.forCategory(expense, Category.travel),
      ExpenseBucket.forCategory(expense, Category.work),
      ExpenseBucket.forCategory(expense, Category.other),
    ];
  }

  double get maxTotalExpense{
    double maxTotalExpense = 0;

    for(final bucket in buckets){
      if(bucket.totalExpense > maxTotalExpense){
        maxTotalExpense = bucket.totalExpense;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context){
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return  Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(1),
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpense == 0
                        ? 0
                        : bucket.totalExpense / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    categoryIcons[bucket.category],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.7),
                  ),
                ),
              ),
            )
                .toList(),
          )
        ],
      ),
    );
     }
}