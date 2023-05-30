import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/page/poke_detail_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
      ),
      body: ListView(
        //scrollDirection: Axis.horizontal,
        children: List.generate(
            PokemonModel.samples.length,
            (index) => GestureDetector(
                  onTap: () {
                    print('onshortPress');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokeDetailPage(PokemonModel.samples[index]),
                      ),
                    );
                  },
                  onLongPress: () {
                    print('onLongPress');
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Hero(
                              tag: PokemonModel.samples[index].name,
                              child: Image.asset(PokemonModel.samples[index].imageAddress)),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onDoubleTap: () {
                              print('두번 이름 클릭 $index');
                            },
                            onLongPress: () {
                              print('길게 이름 클릭 $index');
                            },
                            onTap: () {
                              print('짥게 이름 클릭 $index');
                            },
                            child: Text(
                              PokemonModel.samples[index].name,
                              style: TextStyle(
                                  color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
