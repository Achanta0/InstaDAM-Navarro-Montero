import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaDAM',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => DatabaseProvider(),
        child: LoginPage(),
      ),
    );
  }
}

class DatabaseProvider with ChangeNotifier {
  late Database _database;

  Future<void> initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'instadam.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Aquí puedes crear las tablas de la base de datos
        // Ejemplo: db.execute('CREATE TABLE photos (id INTEGER PRIMARY KEY, imageUrl TEXT)');
      },
    );
  }

  Future<void> insertData(String table, Map<String, dynamic> data) async {
    await _database.insert(table, data);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> fetchData(String table) async {
    return await _database.query(table);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<DatabaseProvider>(context);
    databaseProvider.initDatabase();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inicio de sesion',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Altura de la pantalla completa
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: AuthPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              'assets/insta.png',
              height: 300.0,
            ),
            SizedBox(height: 32.0),
            TextField(
              style: TextStyle(color: Colors.white), // Color del texto
              decoration: InputDecoration(
                labelText: 'Correo',
                labelStyle: TextStyle(color: Colors.white), // Color de la etiqueta
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              style: TextStyle(color: Colors.white), // Color del texto
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.white), // Color de la etiqueta
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Implementar lógica para "He olvidado la contraseña"
                  },
                  child: Text(
                    'He olvidado la contraseña',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navegar a la página de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroPage()),
                    );
                  },
                  child: Text(
                    'Registrarse',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica para el inicio de sesión
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}