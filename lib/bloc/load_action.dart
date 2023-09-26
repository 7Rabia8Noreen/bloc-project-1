


import 'package:bloc_project_1/model/person.dart';
 

  typedef PersonsLoader= Future<Iterable<Person>> Function(String url);
abstract class LoadAction{
  LoadAction();
}

class LoadPersonAction implements LoadAction{
   final String url;
    final PersonsLoader loader;
  LoadPersonAction({required this.url, required this.loader}): super();
}