import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Step 1: Define a StateProvider
final counterProvider = StateProvider<int>((ref) => 0);

// Step 2: Wrap your app with ProviderScope
void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

// Step 3: Use ConsumerWidget to build UI that reacts to provider
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterPage(),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Step 4: Watch the provider to get current state
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter'),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(onPressed: (){
          ref.read(counterProvider.notifier).state=0;
        }, icon:Icon(Icons.refresh))
      ],),
      
      body: Center(
        child: Text(
          'Count: $count',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Step 5: Update state using the notifier
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
