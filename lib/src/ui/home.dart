import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_sample_app/src/model/character.dart';
import 'package:mobx_sample_app/src/model/characters_list.dart';
import 'package:mobx_sample_app/src/model/result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _charList = CharactersList();

  @override
  void initState() {
    super.initState();
    _charList.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
      builder: (_) => (_charList.characters != null)
          ? FutureBuilder<Character>(
              future: _charList.characters,
              builder: (context, snapshot) {
                print("snapshot is $snapshot");
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.data.results.length,
                        itemBuilder: (context, index) {
                          return _buildCharacter(
                              snapshot.data.data.results[index]);
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            )
          : Center(child: CircularProgressIndicator()),
    ));
  }

  Widget _buildCharacter(Result result) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 50, //200,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('${result.name}',
                  style: Theme.of(context).textTheme.headline),
            ),
          ],
        ),
      ),
    );
  }
}
