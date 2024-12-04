import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:parking_number_manager/domain/states/main_screen_ui_state.dart';
import 'package:parking_number_manager/domain/viewmodels/main_screen_view_model.dart';
import 'package:parking_number_manager/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(mainScreenViewModelProvider).loading;
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: LoaderOverlay(
          overlayWidgetBuilder: (_) {
            //ignored progress for the moment
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitPulsingGrid(
                    color: const Color.fromARGB(255, 215, 174, 159),
                    size: MediaQuery.of(context).size.width,
                  ),
                  if (loading != null)
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: Colors.blue),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: null,
                      icon: Text(
                        loading.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          // backgroundColor: Colors.grey[850]
                        ),
                      ),
                      label: Icon(Icons.settings),
                    )
                  else
                    SizedBox.shrink()
                ],
              ),
            );
          },
          child: MainScreen()),
    );
  }
}
