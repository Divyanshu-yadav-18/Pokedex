import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon_model.dart';

class DatailCard extends StatelessWidget {
  final Pokemon pokemon;
  const DatailCard({required this.pokemon, super.key});

  bodyCard() => Stack(
    children: <Widget>[
      Container(
        child: Card(
          child: Column(
            children: <Widget>[
              Text(pokemon.name!),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    pokemon.type!
                        .map(
                          (t) => FilterChip(label: Text(t), onSelected: (b) {}),
                        )
                        .toList(),
              ),
              Text("Weakness"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    pokemon.weaknesses!
                        .map(
                          (t) => FilterChip(label: Text(t), onSelected: (b) {}),
                        )
                        .toList(),
              ),
              Text("Next Evolution"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    pokemon.nextEvolution!
                        .map(
                          (n) => FilterChip(
                            label: Text(n.name!),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name!)),
      body: bodyCard(),
    );
  }
}
