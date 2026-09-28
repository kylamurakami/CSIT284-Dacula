import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF810B38),
              onPrimary: const Color(0xFFF1E2D1),
              surface: const Color(0xFFF1E2D1),
              onSurface: const Color(0xFF541A1A),
            ),
          ),
          child: child!,
        );
      },
    );

    if (!mounted || pickedDate == null) return;

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(
      _amountController.text,
    );

    final amountIsInvalid =
        enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color(0xFFF1E2D1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Invalid Input',
            style: TextStyle(
              color: Color(0xFF541A1A),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Please make sure a valid title, amount, date and category were entered.',
            style: TextStyle(
              color: Color(0xFF541A1A),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text(
                'Okay',
                style: TextStyle(
                  color: Color(0xFF810B38),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text.trim(),
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            12,
            20,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 36,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCC3AA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // Title
                const Text(
                  'Add New Expense',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF541A1A),
                  ),
                ),

                const SizedBox(height: 20),

                // Expense Title
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  style: const TextStyle(
                    color: Color(0xFF541A1A),
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: const Color(0xFF810B38),
                  decoration: InputDecoration(
                    labelText: 'Expense Title',
                    labelStyle: const TextStyle(
                      color: Color(0xFF541A1A),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xFF810B38),
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(
                      Icons.edit_outlined,
                      color: Color(0xFF810B38),
                    ),
                    counterStyle: const TextStyle(
                      color: Color(0xFF541A1A),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF1E2D1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFFDCC3AA),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFF810B38),
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                // Amount
                TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF541A1A),
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: const Color(0xFF810B38),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: const TextStyle(
                      color: Color(0xFF541A1A),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xFF810B38),
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(
                      Icons.attach_money,
                      color: Color(0xFF810B38),
                    ),
                    prefixText: '\$ ',
                    prefixStyle: const TextStyle(
                      color: Color(0xFF541A1A),
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF1E2D1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFFDCC3AA),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFF810B38),
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Date
                InkWell(
                  onTap: _presentDatePicker,
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1E2D1),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFDCC3AA),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Color(0xFF810B38),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _selectedDate == null
                                ? 'Select Date'
                                : formatter.format(_selectedDate!),
                            style: const TextStyle(
                              color: Color(0xFF541A1A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Color(0xFF541A1A),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Category
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1E2D1),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFDCC3AA),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Category>(
                      value: _selectedCategory,
                      isExpanded: true,
                      dropdownColor: const Color(0xFFF1E2D1),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF541A1A),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF541A1A),
                        fontWeight: FontWeight.w500,
                      ),
                      items: Category.values.map(
                        (category) {
                          return DropdownMenuItem<Category>(
                            value: category,
                            child: Row(
                              children: [
                                Icon(
                                  categoryIcons[category],
                                  color: const Color(0xFF810B38),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  category.name.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color(0xFF541A1A),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF541A1A),
                          side: const BorderSide(
                            color: Color(0xFFDCC3AA),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _submitExpenseData,
                        icon: const Icon(
                          Icons.save_outlined,
                        ),
                        label: const Text(
                          'Save Expense',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF810B38),
                          foregroundColor: const Color(0xFFF1E2D1),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}