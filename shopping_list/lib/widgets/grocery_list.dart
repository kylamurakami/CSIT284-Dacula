
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() {
    return _GroceryListState();
  }
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];

  var _isLoading = true;
  String? _error;

  final _url = Uri.parse(
    'https://shopping-list-app-5c726-default-rtdb.asia-southeast1.firebasedatabase.app/shopping-list.json',
  );

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(_url);

      if (response.statusCode >= 400) {
        throw Exception('Failed to fetch grocery items.');
      }

      if (response.body == 'null') {
        setState(() {
          _groceryItems = [];
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData =
          json.decode(response.body);

      final List<GroceryItem> loadedItems = [];

      for (final item in listData.entries) {
        final itemData = Map<String, dynamic>.from(item.value);

        final category = categories.values.firstWhere(
          (category) => category.title == itemData['category'],
          orElse: () => categories[Categories.other]!,
        );

        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: itemData['name'],
            quantity: itemData['quantity'],
            category: category,
          ),
        );
      }

      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Could not load items. Please try again.';
        _isLoading = false;
      });
    }
  }

  Future<void> _addItem() async {
  final newItem = await Navigator.of(context).push<GroceryItem>(
    MaterialPageRoute(
      builder: (ctx) => const NewItem(),
    ),
  );

  if (newItem == null || !mounted) {
    return;
  }

  await _loadItems();
}

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_error != null) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _loadItems,
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    } else if (_groceryItems.isEmpty) {
      content = const Center(
        child: Text('No items added yet.'),
      );
    } else {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _groceryItems[index].category.color,
          ),
          trailing: Text(
            _groceryItems[index].quantity.toString(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
