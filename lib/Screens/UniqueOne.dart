import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:hymnes/components/MarqueeWidget.dart';
import 'package:provider/provider.dart';

import '../HymnesBrain.dart';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';

const _PANEL_HEADER_HEIGHT = 40.0;

class UniqueOne extends StatefulWidget {
  final int numero;
  UniqueOne({this.numero});
  @override
  _UniqueOneState createState() => _UniqueOneState();
}

class _UniqueOneState extends State<UniqueOne>
    with SingleTickerProviderStateMixin {
  static AudioPlayer player = new AudioPlayer();
  AudioCache localTo = new AudioCache(fixedPlayer: player);
  //HymnesBrain brain = HymnesBrain();
  String voix = 'soprano';
  AnimationController _controller;
  bool favoris = false;
  bool playing = false;
  bool stopped = true;
  bool paused = false;
  // fontScaling property
  double _fontSize = 16;
  final double _baseFontSize = 16;
  double _fontScale = 1;
  double _baseFontScale = 1;
  @override
  initState() {
    print('bhbgvgvg');
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 100), value: 0.0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  String retourProchain(String voix) {
    switch (voix) {
      case 'soprano':
        return 'alto';
        break;
      case 'alto':
        return 'tenor';
        break;
      case 'tenor':
        return 'basse';
        break;
      case 'basse':
        return 'soprano';
        break;
      default:
        return 'basse';
    }
  }

  String correctVoice(String voix) {
    switch (voix) {
      case 'soprano':
        return 'S';
        break;
      case 'alto':
        return 'A';
        break;
      case 'tenor':
        return 'T';
        break;
      case 'basse':
        return 'B';
        break;
      default:
        return 'B';
    }
  }

  double fontReturn(double data) {
    if (data <= 16) return 16;
    if (data >= 32) return 32;
    return data;
  }

  Widget _myCustomDropDown() {
    return (new GestureDetector(
        onTap: () {
          setState(() {
            voix = retourProchain(voix);
            playing = false;
            stopped = true;
            paused = false;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Text(correctVoice(voix)),
        )));
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    final ThemeData theme = Theme.of(context);
    return Consumer<HymnesBrain>(builder: (context, brain, child) {
      return (new Container(
        color: Colors.lime[100],
        height: MediaQuery.of(context).size.height - 20.0,
        child: new Stack(
          children: <Widget>[
            GestureDetector(
              onScaleStart: (ScaleStartDetails scaleStartDetails) {
                _baseFontScale = _fontScale;
              },
              onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
                setState(() {
                  _fontScale =
                      (_baseFontScale * scaleUpdateDetails.scale).clamp(0.5, 5);
                  _fontSize = fontReturn(_fontScale * _baseFontSize);
                });
              },
              child: SingleChildScrollView(
                child: new Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 40.0),
                    child: new Text(
                      brain.getHymneChant(widget.numero - 1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _fontSize,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            new PositionedTransition(
              rect: animation,
              child: new Material(
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(16.0),
                    topRight: const Radius.circular(16.0)),
                elevation: 12.0,
                child: new Column(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
                    },
                    child: new Container(
                      height: _PANEL_HEADER_HEIGHT,
                      child: Row(children: <Widget>[
                        Expanded(
                            flex: 7,
                            child: Center(
                                child: new Text(
                              "Histoire",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ))),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: new IconButton(
                              onPressed: () {
                                _controller.fling(
                                    velocity: _isPanelVisible ? -1.0 : 1.0);
                              },
                              icon: new AnimatedIcon(
                                icon: AnimatedIcons.add_event,
                                progress: _controller.view,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  new Expanded(
                      child: SingleChildScrollView(
                    child: new Center(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(
                        brain.getHymneHistoire(widget.numero - 1),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )),
                  ))
                ]),
              ),
            )
          ],
        ),
      ));
    });
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;
    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnesBrain>(builder: (context, brain, child) {
      return (new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: MarqueeWidget(
            direction: Axis.horizontal,
            child: new Text(
              brain.getHymneTitre(widget.numero - 1),
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          actions: <Widget>[
            Center(child: _myCustomDropDown()),
            IconButton(
              icon: playing
                  ? Icon(Icons.pause_circle_filled)
                  : Icon(Icons.play_circle_filled),
              onPressed: () async {
                if (playing) {
                  setState(() {
                    playing = false;
                    paused = true;
                    stopped = false;
                  });
                  print('pausing $voix');
                  await player.pause();
                } else {
                  setState(() {
                    playing = true;
                    paused = false;
                    stopped = false;
                  });
                  print('playing $voix');
                  await localTo.play(
                      brain.getHymneAudio(widget.numero - 1, voix) + '.mp3');
                }
              },
            ),
            playing
                ? IconButton(
                    icon: Icon(Icons.stop_circle_outlined),
                    onPressed: () async {
                      setState(() {
                        stopped = true;
                        playing = false;
                        paused = false;
                      });
                      await player.stop();
                    },
                  )
                : Container(),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          color: Colors.green,
                          onPressed: () {
                            print('chanson bien ajoute aux favoris ');
                          },
                        ),
                        Text('Aimer'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
          backgroundColor: Colors.green,
          leading: null,
        ),
        body: new LayoutBuilder(
          builder: _buildStack,
        ),
      ));
    });
  }
}
