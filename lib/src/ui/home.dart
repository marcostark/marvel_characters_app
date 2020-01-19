import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:mobx_sample_app/src/model/character.dart';
import 'package:mobx_sample_app/src/model/result.dart';
import 'package:mobx_sample_app/src/util/keys.dart';
import 'package:mobx_sample_app/src/api/api.dart';
import 'package:crypto/crypto.dart' as crypto;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Character> character;
  String url;

  @override
  void initState() {
    print("Iniciando");
    var ts = DateTime.now().millisecondsSinceEpoch;
    var hash = generateMd5("$ts" + Keys.PRIVATE + Keys.PUBLIC);
    character = Api.getData(ts, hash);
    print('Herois => ${character.toString()}');
    setState(() {});
  }

  ///Generate MD5 hash
  generateMd5(String data) {
    //print('Data => ${data}');
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: <Widget>[
          Expanded(
            child: character != null
                ? FutureBuilder<Character>(
                    future: character,
                    builder: (context, snapshot) {
                      print("snapshot is $snapshot");
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.data.results.length,
                              itemBuilder: (context, index) {
                                return _buildCharacter(context, index,
                                    snapshot.data.data.results[index]);
                                // return Text(snapshot.data.data.results[index]
                                //     .toString());
                              },
                            )
                          : Center(child: CircularProgressIndicator());
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          )
        ],
      )),
    );
  }

  Widget _buildCharacter(BuildContext context, int index, Result result) {
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
