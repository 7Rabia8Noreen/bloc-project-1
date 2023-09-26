import 'package:bloc_project_1/bloc/fetch_result.dart';
import 'package:bloc_project_1/bloc/load_action.dart';
import 'package:bloc_project_1/model/person.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonBloc extends Bloc<LoadAction, FetchResult?>{
  final Map<String, Iterable<Person> > _cache={};
  PersonBloc(): super(null){
    on<LoadPersonAction>((event, emit)async {
      final url= event.url;
      if(_cache.containsKey(url)){
        final cachedPersons= _cache[url];
        final result= FetchResult(persons: cachedPersons!, isRetrievedFromCache: true);
        emit(result);
      }
      else{
        final loader= event.loader;
         final persons=  await loader(url);
         _cache[url]= persons;
         final result= FetchResult(persons: persons, isRetrievedFromCache: false);
         emit(result);
      }
    });
  }

}

