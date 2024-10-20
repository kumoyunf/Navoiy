import '../../models/data_model.dart';

import '../data/data.dart';

class DataService {
  List<Data> getData(){
    return jsonData.map((e)=>Data.fromJson(e)).toList();
  }
}