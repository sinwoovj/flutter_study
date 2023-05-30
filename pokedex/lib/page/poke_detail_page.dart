import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widget/text_widget.dart';

import '../logger.dart';

class PokeDetailPage extends StatefulWidget {
  const PokeDetailPage(this.selectedItem, {Key? key}) : super(key: key);
  final PokemonModel selectedItem;
  @override
  State<PokeDetailPage> createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  double level = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          buildTitle(widget.selectedItem.indexNum.toString(), widget.selectedItem.name),
          buildImage(),
          Text('포켓몬 레벨 : ${level.toInt().toString()}'),
          buildSlider(),
          buildtable(),
        ],
      ),
    );
  }

  Slider buildSlider() {
    return Slider(
        min: 1,
        max: 99,
        divisions: 98,
        value: level,
        onChanged: (value) {
          logger.d('value : $value');
          logger.i('value : $value');
          logger.e('value : $value');
          level = value;
          setState(() {});
        });
  }

  Row buildtable() {
    List<SkillModel> skillList =
        widget.selectedItem.skills.where((element) => element.learningLevel < level).toList();
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Table(
            border: TableBorder.all(width: 2, color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                Center(child: Text('Level')),
                Center(child: Text('Skills')),
                Center(child: Text('Damage')),
                Center(child: Text('pp'))
              ]),
              ...List.generate(
                  skillList.length,
                  (index) => TableRow(children: [
                        Text(skillList[index].learningLevel.toString()),
                        Text(skillList[index].name),
                        Text(skillList[index].damage.toString()),
                        Text(skillList[index].pp.toString()),
                      ]))
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget buildImage() {
    return SizedBox(
        width: double.maxFinite,
        height: 200,
        child: Container(
          color: Colors.lightBlue,
          child: Hero(
            tag: widget.selectedItem.name,
            child: Image.asset(widget.selectedItem.imageAddress,
                fit: BoxFit.fitHeight, color: level < 50 ? Colors.blueGrey : null),
          ),
        ));
  }
}
