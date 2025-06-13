import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/data/pokemon_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub? pokeHub;
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await http.get(Uri.parse(url));
    var decodeJson = jsonDecode(response.body);
    pokeHub = PokeHub.fromJson(decodeJson);

    setState(() {
      pokeHub = PokeHub.fromJson(decodeJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Poke~Dex")),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body:
          pokeHub == null || pokeHub!.pokemon == null
              ? Center(child: CircularProgressIndicator())
              : GridView.count(
                crossAxisCount: 2,
                children:
                    pokeHub!.pokemon!
                        .map(
                          (pok) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () => {},
                              child: Card(
                                elevation: 4.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      height: 100.00,
                                      width: 100.00,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            pok.img ??
                                                'https://via.placeholder.com/150',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      pok.name!,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),

      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightGreenAccent,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
