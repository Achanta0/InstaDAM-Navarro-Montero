import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro de Cuenta',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                labelText: 'Nombre de Usuario',
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
            TextField(
              style: TextStyle(color: Colors.white), // Color del texto
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir contraseña',
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
            ElevatedButton(
              onPressed: () {
                // Implementar lógica para el registro
              },
              child: Text('Registrar Cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
