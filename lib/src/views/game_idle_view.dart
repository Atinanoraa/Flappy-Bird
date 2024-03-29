part of views;

class GameIdleView extends StatelessWidget {
  const GameIdleView({
    Key? key,
    required this.player,
    required this.onStart,
  }) : super(key: key);

  final Entity player;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final playerExp = context.watch<PlayerExperience>();

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Background(
            assetImage: playerExp.backgroundImage.assetImage,
          ),
        ),
        Positioned(
          left: player.x,
          top: player.y,
          width: player.width,
          height: player.height,
          child: player.draw(context),
        ),
        Align(
          alignment: const Alignment(0, -0.6),
          child: Text(
            'Flappy Bird',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlayButton(onPressed: onStart),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.green,
                    ),
                    child: const Icon(Icons.settings),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomizationScreen(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.green,
                    ),
                    child: const Icon(Icons.auto_fix_high),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
