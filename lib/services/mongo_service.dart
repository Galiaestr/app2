import 'package:app2/models/phone_model.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class MongoService {
  //Servicio para conectar con Mongo Atlas
  //Usando Singleton 
  static final MongoService _instance = MongoService._internal();

  late mongo.Db _db;

  MongoService._internal();

factory MongoService() {
  return _instance;
}

  Future<void> connect() async {
    _db = await mongo.Db.create(
      'mongodb+srv://galiciastrda:<db_password>@cluster0.0dxbd.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');
    await _db.open();
  }

mongo.Db get db {
  if ( !db.isConnected ) {
    throw StateError('Base de datos no inicializa, llama a connect() primero');
  }
  return _db;
}

  Future<List<PhoneModel>> getPhones() async {
    final collection = _db.collection('celulares');
    var phones =  await collection.find().toList(); 
    return phones.map((phone) => PhoneModel.fromJson(phone)).toList();
  }
}