import 'package:bloc_project_1/bloc/fetch_result.dart';
import 'package:bloc_project_1/bloc/load_action.dart';
import 'package:bloc_project_1/bloc/person_bloc.dart';
import 'package:bloc_project_1/model/person.dart';
import 'package:bloc_project_1/uttils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Project 1'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
           Row(
            children: [
              TextButton(onPressed: (){
                context.read<PersonBloc>().add(LoadPersonAction(url: person1Url,
                loader: getPersons
                ));
              },
               child: Text('Load Person #1')),
              TextButton(onPressed: (){
                 context.read<PersonBloc>().add(LoadPersonAction(url: person2Url, loader: getPersons));
              },
               child: Text('Load Person #2'))
            ],
           ),
          Expanded(
            child: BlocBuilder<PersonBloc, FetchResult?>(
              buildWhen: (previousResult, currentResult) {
                return previousResult?.persons != currentResult?.persons;
              },
              builder: (context, fetchResult) {
                 final persons= fetchResult?.persons;
                 debugPrint(fetchResult.toString());
                 if(persons==null){
                  return SizedBox();
                 }
                 return ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    final person= persons[index];
                   return ListTile(
                    title: Text(person!.name),
                   );
                 },);
              },
              
              ),
          ) 
        ],
      ),
    );
  }
}

// extension Subscript<T> on Iterable<T>{
//   T? operator [](int index) => length> index ? elementAt(index): null;
// }