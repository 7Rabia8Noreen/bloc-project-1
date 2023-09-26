import 'dart:convert';

import 'dart:io';

class Person{
  final String name;
  final int age;

  Person({required this.name, required this.age});

  Person.fromJson(Map<String, dynamic> json):
  name= json['name'] as String,
  age= json['age'] as int;

  @override
  String toString() {
    
    return "Name : $name,  Age : $age";
  }
}

 Future<Iterable<Person>> getPersons(String url) => HttpClient().getUrl(Uri.parse(url))
 .then((req) => req.close()
 ).then((resp) => resp.transform(utf8.decoder).join())
 .then((str) => json.decode(str) as List<dynamic>)
 .then((list) => list.map((e) => Person.fromJson(e)));


//  enum PersonUrl{
//   person1,
//   person2
// }

// extension UrlString on PersonUrl{
//   String get urlString{
//     switch(this){
      
//       case PersonUrl.person1:
//         return 'http://192.168.1.101:5500/api/person1.json';
//       case PersonUrl.person2:
//        return 'http://192.168.1.101:5500/api/person2.json';
//     }
//   }
// }

extension Subscript<T> on Iterable<T>{
  T? operator [](int index) => length> index ? elementAt(index): null;
}
    