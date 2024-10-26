import '../../models/data_model.dart';

import '../data/data.dart';
import '../models/author_model.dart';

class DataService {
  List<Data> getData(){
    return jsonData.map((e)=>Data.fromJson(e)).toList();
  }

  List<Author> getAuthors(){
    return authors.map((e)=>Author.fromJson(e)).toList();
  }
}