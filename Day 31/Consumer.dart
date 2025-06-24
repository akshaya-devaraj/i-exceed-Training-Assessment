class MyHome2 extends StatelessWidget {
  const MyHome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context,ref,name){
      return Center(child: Text("Welcome"+ref.watch(nameProvider)));
    }),);
  }
}