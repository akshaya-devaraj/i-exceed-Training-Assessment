class MyHome3 extends ConsumerStatefulWidget {
  const MyHome3({super.key});

  @override
  ConsumerState<MyHome3> createState() => _MyHome3State();
}

class _MyHome3State extends ConsumerState<MyHome3> {
  @override
  Widget build(BuildContext context) {
    String name=ref.watch(nameProvider);
    return Scaffold(body: Container(child: Text("Welcome "+name),),);
  }
}