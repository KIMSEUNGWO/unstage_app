
import 'package:flutter/material.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/svg_icon.dart';

class FavoriteButton extends StatefulWidget {

  final bool has;
  final int artistId;
  final Function(int artistId, bool toggle) onChanged;


  const FavoriteButton({super.key, required this.artistId, required this.has, required this.onChanged});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  bool _isFavorite = false;

  _onChanged(int artistId) {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onChanged(artistId, _isFavorite);
  }

  @override
  void initState() {
    setState(() {
      _isFavorite = widget.has;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onChanged(widget.artistId);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(3, 2, 6, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: _isFavorite
            ? Theme.of(context).colorScheme.onSecondary
            : const Color(0xFFEEEEEE),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgIcon.asset(sIcon: SIcon.idol,
                style: SvgIconStyle(
                  color: _isFavorite
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.secondary
                )
              ),
              const SizedBox(width: 2,),
              Text('오시 추가',
                style: FontTheme.of(context,
                  size: FontSize.bodySmall,
                  color: _isFavorite
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.secondary
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
