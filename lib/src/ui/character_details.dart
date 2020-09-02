import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mobx_sample_app/src/model/result.dart';

class CharacterDetails extends StatelessWidget {
  final Result result;

  CharacterDetails(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body(context, result)),
    );
  }

  Widget _body(BuildContext context, Result article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerCharacter(context, article),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  article.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF05A8F3),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      article.name,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                ),
                Text(
                  article.description,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _headerCharacter(BuildContext context, Result character) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image:
              'https://sm.ign.com/ign_pt/screenshot/default/iron-man_derz.jpg',
          fit: BoxFit.cover,
        ),
        Container(
            padding: EdgeInsets.only(left: 0, right: 10, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Theme.of(context).backgroundColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ))
      ],
    );
  }
}
