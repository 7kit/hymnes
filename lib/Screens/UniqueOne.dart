import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';

const _PANEL_HEADER_HEIGHT = 40.0;

class UniqueOne extends StatefulWidget {
  final int numero;
  UniqueOne({this.numero});
  @override
  _UniqueOneState createState() => _UniqueOneState();
}

class _UniqueOneState extends State<UniqueOne> with SingleTickerProviderStateMixin {
  //HymnesBrain brain = HymnesBrain();
  String voix = 'soprano';
  AnimationController _controller;
  bool favoris = false;
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

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
  final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
  final ThemeData theme = Theme.of(context);
  return new Container(
    color: Colors.lime[100],
    child: new Stack(
      children: <Widget>[
        new Center(
          child: new Text("base"),
        ),
        new PositionedTransition(
        rect: animation,
        child: new Material(
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0)),
          elevation: 12.0,
          child: new Column(children: <Widget>[
            new Container(
              height: _PANEL_HEADER_HEIGHT,
              child: Row(children : <Widget>[Expanded(flex: 7, child: Center(child: new Text("Histoire"))),
              Expanded(
                flex: 3,
                              child: Center(
                                                              child: new IconButton(
                  onPressed: () {
                    _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
                  },
                  icon: new AnimatedIcon(
                    icon: AnimatedIcons.add_event,
                    progress: _controller.view,
                  ),
                ),
                              ),
              ),]),
            ),
            new Expanded(child: new Center(child: new Text("Ceci est l histoire du comte de Zinzendorf !")))
          ]),
        ),
        )
        
      ],
    ),
  );
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
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          // title: new Text("Step1"),
          backgroundColor: Colors.green,
          leading: null,
        ),
        body: new LayoutBuilder(
          builder: _buildStack,
        ),
        );
  }
}
