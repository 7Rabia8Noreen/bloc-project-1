


import 'package:bloc_project_1/model/person.dart';

abstract class LoadAction{
  LoadAction();
}

class LoadPersonAction implements LoadAction{
   final PersonUrl url;

  LoadPersonAction({required this.url}): super();
}