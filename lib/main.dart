import 'package:bloc_project_1/bloc/person_bloc.dart';
import 'package:bloc_project_1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  BlocProvider(
        create: (context) => PersonBloc(),
        child: HomePage(),
      ),
    );
  }
}

// const names=['A', 'B', 'C',];

// extension RandomElement<T> on Iterable<T>{
//   T getRandomElement()=> elementAt(math.Random().nextInt(length));
// }

// class NamesCubit extends Cubit<String?>{
//   NamesCubit(): super(null);
//   void pickRandomName()=> emit(names.getRandomElement());
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, });

  

 

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//   late final NamesCubit cubit;
//   @override
//   void initState() {
   
//     super.initState();
//     cubit= NamesCubit();
//   }

//   @override
//   void dispose() {
//     cubit.close();
//     super.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
   
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
//         title: Text('First Bloc Test Project'),
//       ),
//       body: StreamBuilder(stream: cubit.stream, builder: (context, snapshot) {
//         final button= TextButton(onPressed: ()=> cubit.pickRandomName(), child: Text('Pick a random name'));
//         switch(snapshot.connectionState){
          
//           case ConnectionState.none:
//            return button;
//           case ConnectionState.waiting:
//            return button;
//           case ConnectionState.active:
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(snapshot.data??''),
//                     button
//                   ],
//                 ),
//               );
//           case ConnectionState.done:
//            return SizedBox();
//         }
//       },),
//       );
//   }
// }


