import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_number_manager/domain/states/main_screen_ui_state.dart';
import 'package:parking_number_manager/domain/viewmodels/main_screen_view_model.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:parking_number_manager/screens/main_view.dart';
import 'package:parking_number_manager/screens/saved_view.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(mainScreenViewModelProvider.notifier);
    final uiState = ref.watch(mainScreenViewModelProvider);
    if (uiState.loading != null) {
      context.loaderOverlay.show();
      if (uiState.loading == Loading.complete) {
        Future.delayed(Duration(seconds: 2))
            .then((_) => {
                  if (context.mounted) {context.loaderOverlay.hide()}
                })
            .whenComplete(() => viewModel.consumeLoadingEvent());
      }
    } else {
      context.loaderOverlay.hide();
    }
    final pageController = PageController(initialPage: 0);
    NavigationDestinationLabelBehavior labelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: uiState.currentPageIndex,
        onDestinationSelected: (int index) {
          viewModel.setCurrentPageIndex(index);
          pageController.jumpToPage(index);
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Main',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [MainView(), SavedView()],
        onPageChanged: (value) => viewModel.setCurrentPageIndex(value),
      ),
      floatingActionButton: uiState.currentPageIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                bool? isCamera = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("写真を撮影"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text("ギャラリーから取得"),
                        ),
                      ],
                    ),
                  ),
                );
                if (isCamera != null) {
                  viewModel.findImage(isCamera: isCamera);
                }
              },
              backgroundColor: Color.fromARGB(255, 215, 174, 159),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
