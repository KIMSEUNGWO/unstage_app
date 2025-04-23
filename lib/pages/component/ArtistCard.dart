

import 'package:flutter/material.dart';
import 'package:unstage_app/dto/ArtistCardDto.dart';
import 'package:unstage_app/pages/component/custom_container.dart';

class ArtistCard extends StatefulWidget {

  final ArtistCardDto artist;
  const ArtistCard({super.key, required this.artist});

  @override
  State<ArtistCard> createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Center(

      ),
    );
  }
}
