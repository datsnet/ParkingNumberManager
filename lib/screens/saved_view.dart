import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_number_manager/domain/states/main_screen_ui_state.dart';
import 'package:parking_number_manager/domain/viewmodels/main_screen_view_model.dart';

class SavedView extends ConsumerStatefulWidget {
  @override
  ConsumerState<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends ConsumerState<SavedView> {
  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    final MainScreenViewModel viewModel = ref.read(mainScreenViewModelProvider.notifier);
    viewModel.fetchItems();
    final MainScreenUiState uiState = ref.watch(mainScreenViewModelProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              if (_selectedItems.isNotEmpty) {
                viewModel.deleteSelectedItems(_selectedItems.toList());
                setState(() {
                  _selectedItems.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('選択されたアイテムが削除されました')),
                );
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: uiState.savedList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = uiState.savedList[index];

          return Dismissible(
            key: Key(item.id.toString()),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              viewModel.deleteItem(item.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.numberText}が削除されました')),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 4,
              child: ListTile(
                title: Text(item.numberText, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.location != null) 
                      Text('位置情報: ${item.location}', style: TextStyle(color: Colors.grey[600])),
                    SizedBox(height: 4),
                    Text('登録日: ${item.createdAt}', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                trailing: Checkbox(
                  value: _selectedItems.contains(item.id),
                  onChanged: (bool? isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        _selectedItems.add(item.id);
                      } else {
                        _selectedItems.remove(item.id);
                      }
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}