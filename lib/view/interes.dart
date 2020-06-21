import 'package:flutter/material.dart';
import 'package:intereses/models/categoria.dart';
import '../models/categoria.dart';

class InteresPage extends StatefulWidget {
  const InteresPage({Key key}) : super(key: key);

  @override
  _InteresPageState createState() => _InteresPageState();
}

class _InteresPageState extends State<InteresPage> {
  // List<Categoria> lista = [
  //   Categoria(id: 1, nombre: 'Ajedrez'),
  //   Categoria(id: 2, nombre: 'Futbol'),
  //   Categoria(id: 4, nombre: 'Lego'),
  //   Categoria(id: 5, nombre: 'Basket'),
  //   Categoria(id: 7, nombre: 'Tekken'),
  //   Categoria(id: 8, nombre: 'Algo mas'),
  // ];
  List<int> _idSeleccionados = List<int>();

  @override
  Widget build(BuildContext context) {
    agregarId(int id) {
      _idSeleccionados.add(id);
    }

    bool vacioId() => _idSeleccionados.length < 3;

    bool perteneceId(id) => _idSeleccionados.contains(id);
    eliminarId(id) {
      _idSeleccionados.remove(id);
    }

    List<Widget> listaCategoria(List<Categoria> lista) {
      return lista.map((Categoria c) {
        return new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                  elevation: 2.0,
                  color: perteneceId(c.id) ? Colors.green : Colors.teal[100],
                  child: InkWell(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: new Icon(Icons.gamepad)),
                      onTap: () {
                        setState(() {
                          if (!perteneceId(c.id)) {
                            agregarId(c.id);
                          } else {
                            eliminarId(c.id);
                          }
                        });

                        print(_idSeleccionados.toString());
                      })),
              new Center(
                child: new Text(
                  '${c.nombre}',
                  style: _textStyle(),
                ),
              )
            ]);
      }).toList();
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Text(
          'Escoge al menos 3 Categorias',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Container(
          child: Expanded(
            child: FutureBuilder(
                future: getCategorias(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return snapshot.hasData
                      ? GridView.count(
                          crossAxisSpacing: 2,
                          crossAxisCount: 4,
                          children: listaCategoria(snapshot.data))
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ),
      ]),
      floatingActionButton: Visibility(
        visible: !vacioId(),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}

TextStyle _textStyle() {
  return TextStyle(color: Colors.white);
}
