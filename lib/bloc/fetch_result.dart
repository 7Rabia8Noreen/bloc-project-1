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

  @override
  bool operator== (covariant FetchResult other)=>
  persons.isEqualToIgnoringOrdering(other.persons) &&
  isRetrievedFromCache== other.isRetrievedFromCache;

  
  @override
  int get hashCode=> Object.hash(persons, isRetrievedFromCache);
}

extension IsEqualToIgnoringOrdering<T> on Iterable<T>{
  bool isEqualToIgnoringOrdering(Iterable<T> other)=>
  length== other.length && {...this}.intersection({...other}).length==length; 
}