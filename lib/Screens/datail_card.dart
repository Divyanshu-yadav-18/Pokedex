import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon_model.dart';

class DatailCard extends StatelessWidget {
  final Pokemon pokemon;
  const DatailCard({required this.pokemon, super.key});

  bodyCard(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 50),
              Text(pokemon.name!),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    pokemon.type!
                        .map(
                          (t) => FilterChip(
                            backgroundColor: const Color.fromARGB(
                              255,
                              184,
                              237,
                              228,
                            ),
                            label: Text(t),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
              ),
              Text("Weakness"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    pokemon.weaknesses!
                        .map(
                          (t) => FilterChip(
                            backgroundColor: const Color.fromARGB(
                              255,
                              192,
                              140,
                              241,
                            ),
                            label: Text(t),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
              ),
              ...pokemon.nextEvolution == null
                  ? const [Text("No Further Evolution")]
                  : [
                    const Text("Next Evolution"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          pokemon.nextEvolution!
                              .map(
                                (n) => FilterChip(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    236,
                                    170,
                                    123,
                                  ),
                                  label: Text(n.name!),
                                  onSelected: (b) {},
                                ),
                              )
                              .toList(),
                    ),
                  ],
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pokemon.img!,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(pokemon.img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name!)),
      body: bodyCard(context),
    );
  }
}
