
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/local_storage.dart';
import 'package:unstage_app/component/svg_icon.dart';
import 'package:unstage_app/dto/ArtistCardDto.dart';
import 'package:unstage_app/pages/component/FavoriteButton.dart';
import 'package:unstage_app/pages/component/custom_container.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> with AutomaticKeepAliveClientMixin {

  bool _isLoading = true;

  final TextEditingController _textEditingController = TextEditingController();
  bool _cancelDisabled = true;
  final List<ArtistCardDto> _artists = [
    ArtistCardDto(artistId: 1, image: Image.asset('assets/temp/유메니온.jpg'), name: '유메니온'),
    ArtistCardDto(artistId: 2, image: Image.asset('assets/temp/아니마.jpg'), name: '아니마'),
    ArtistCardDto(artistId: 3, image: Image.asset('assets/temp/안타고니스트.jpg'), name: '안타고니스트'),
    ArtistCardDto(artistId: 4, image: Image.asset('assets/temp/네오에스픽.jpg'), name: '네오에스픽'),
    ArtistCardDto(artistId: 5, image: Image.asset('assets/temp/네온 퍼펫츠.jpg'), name: '네온 퍼펫츠'),
    ArtistCardDto(artistId: 6, image: Image.asset('assets/temp/네키루.jpg'), name: '네키루'),
    ArtistCardDto(artistId: 7, image: Image.asset('assets/temp/데이드림.jpg'), name: '데이드림'),
    ArtistCardDto(artistId: 8, image: Image.asset('assets/temp/닛코리.jpg'), name: '닛코리'),
    ArtistCardDto(artistId: 9, image: Image.asset('assets/temp/덴파마루.jpg'), name: '덴파마루'),
    ArtistCardDto(artistId: 10, image: Image.asset('assets/temp/라쿠와루.jpg'), name: '라쿠와루'),
    ArtistCardDto(artistId: 11, image: Image.asset('assets/temp/라디오조시.jpg'), name: '라디오조시'),
    ArtistCardDto(artistId: 12, image: Image.asset('assets/temp/라무네.jpg'), name: '라무네'),
    ArtistCardDto(artistId: 13, image: Image.asset('assets/temp/다카라.jpg'), name: '다카라'),
    ArtistCardDto(artistId: 14, image: Image.asset('assets/temp/료타츠키.jpg'), name: '료타츠키'),
    ArtistCardDto(artistId: 15, image: Image.asset('assets/temp/마이니치 마츠리.jpg'), name: '마이니치 마츠리'),
    ArtistCardDto(artistId: 16, image: Image.asset('assets/temp/메모리아.jpg'), name: '메모리아'),
    ArtistCardDto(artistId: 17, image: Image.asset('assets/temp/명계생물관리감찰과.jpg'), name: '명계생물관리감찰과'),
  ];

  Set<int> _favoriteIds = {};

  _textOnChanged(String text) {
    _textEditingController.text = text;
    setState(() {
      _cancelDisabled = text.isEmpty;
    });
  }

  _favoriteOnChanged(int artistId, bool toggle) async {
    if (toggle) {
      _favoriteIds.add(artistId);
    } else {
      _favoriteIds.removeWhere((element) => element == artistId,);
    }
    await LocalStorage.instance.saveFavorites(_favoriteIds);
  }

  _sort() {
    _artists.sort((a, b) => _favoriteIds.contains(a.artistId) ? 0 : 1,);
  }

  _init() async {
    _favoriteIds = await LocalStorage.instance.readFavorites();
    _sort();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        // TextField 외에 다른 부분 터치 시 unfocus
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-1.5, -1.5),
                    blurRadius: 1,
                    color: Colors.black12,
                    blurStyle: BlurStyle.inner
                  ),
                  BoxShadow(
                    offset: Offset(-1, -1),
                    blurRadius: 1,
                    color: Colors.white,
                    blurStyle: BlurStyle.inner
                  ),
                ]
              ),
              child: Stack(
                children: [
                  TextField(
                  controller: _textEditingController,
                  onChanged: (value) => _textOnChanged(value),
                  maxLines: 1,
                  style: FontTheme.of(context,
                    fontColor: FontColor.f1,
                    size: FontSize.bodyLarge,
                  ),
                  decoration: InputDecoration(
                    // icon: SvgIcon.asset(sIcon: SIcon.search),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 6), // 아이콘과 텍스트 사이 간격을 6으로 설정
                      child: SvgIcon.asset(sIcon: SIcon.search),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                    isDense: true, // 이 속성이 중요! 더 작은 높이를 제공합니다
                    contentPadding: EdgeInsets.zero, // 내부 패딩 제거
                    hintText: '아티스트를 검색해보세요.',
                    hintStyle: FontTheme.of(context,
                      fontColor: FontColor.f3,
                      size: FontSize.bodyLarge,
                    ),
                    hintMaxLines: 1,
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                    errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),

                  ),
                ),

                  if (!_cancelDisabled)
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _textOnChanged(''),
                        child: SvgIcon.asset(sIcon: SIcon.cancel),
                      ),
                    ),
                ]
              ),
            ),
            centerTitle: true,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 21,),),
          _isLoading
          ? const SliverToBoxAdapter(child: CupertinoActivityIndicator(),)
          : SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100, // 각 아이템의 최대 너비
                childAspectRatio: 0.65,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final artist = _artists[index];
                return CustomContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40, height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: artist.image,
                      ),
                      const SizedBox(height: 8,),
                      Text(artist.name,
                        textAlign: TextAlign.center,
                        style: FontTheme.of(context,
                          fontFamily: 'Tmoney',
                          weight: FontWeight.w500,
                          fontColor: FontColor.f2,
                          size: FontSize.bodyMedium
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12,),
                      FavoriteButton(
                        has: _favoriteIds.contains(artist.artistId),
                        artistId: artist.artistId,
                        onChanged: _favoriteOnChanged,
                      )
                    ],
                  ),
                );},
                childCount: _artists.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20,),)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
