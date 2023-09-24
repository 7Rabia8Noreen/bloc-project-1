import 'package:bloc_project_1/model/person.dart';

class FetchResult{
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;

  FetchResult({required this.persons, required this.isRetrievedFromCache});

  @override
  String toString() {
    // TODO: implement toString
    return "Fetched Result (IsRetrievedFromCache : $isRetrievedFromCache ,  Persons : $persons)";
  }
}