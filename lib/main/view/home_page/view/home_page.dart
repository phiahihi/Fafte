import 'package:chat_app_b/constants/fonts.dart';
import 'package:chat_app_b/wigdets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/bloc/auth_bloc.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _conmmentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                  color: ColorsApp.colorBorderButtonAndText),
            );
          }
          if (state is Authenticated) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: SizesApp.s48 * SizesApp.s2 - SizesApp.s42,
                    color: Colors.black,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: ColorsApp.colorTheme,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            SizesApp.s16, SizesApp.s8, 0, SizesApp.s8),
                        child: Row(
                          children: [
                            _buildItemNewFeed(),
                            _buildItemNewFeed(),
                            _buildItemNewFeed(),
                            _buildItemNewFeed(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildItemPost(context),
                  _buildItemPost(context),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildItemPost(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: SizesApp.s8),
      child: Container(
        color: ColorsApp.colorTheme,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(SizesApp.s16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(SizesApp.s25),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                                width: SizesApp.s50,
                                height: SizesApp.s50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: SizesApp.s8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nguyễn Đức Hoàng Phi',
                                  style: FontsApp().fontBodyMedium.copyWith(
                                        fontSize: SizesApp.s16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(
                                  height: SizesApp.s4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '1 giờ',
                                      style: FontsApp().fontBodyMedium.copyWith(
                                            fontSize: SizesApp.s12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: SizesApp.s4,
                                    ),
                                    Image.asset(
                                      'assets/images/earth.png',
                                      width: SizesApp.s18,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconWithButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.close,
                          size: 24,
                          color: ColorsApp.colorBorderButtonAndText,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: SizesApp.s16,
                    ),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
                      style: FontsApp().fontBodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(SizesApp.s16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text('1000 like'), Text('17k bình luận')],
                  ),
                  const SizedBox(
                    height: SizesApp.s8,
                  ),
                  Divider(
                    color: ColorsApp.colorBorderButtonAndText,
                    height: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _contactButton(
                          text: 'Thich',
                          icon: Image.asset(
                            'assets/images/like.png',
                            width: SizesApp.s20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: _contactButton(
                          text: 'Bình luận',
                          icon: Icon(
                            Icons.inbox_rounded,
                            size: SizesApp.s24,
                            color: ColorsApp.colorBorderButtonAndText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorsApp.colorBorderButtonAndText,
                    height: 1,
                  ),
                  const SizedBox(
                    height: SizesApp.s16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(SizesApp.s25),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                                width: SizesApp.s50,
                                height: SizesApp.s50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: SizesApp.s8,
                            ),
                            Expanded(
                              child: TextField(
                                maxLines: 10,
                                minLines: 1,
                                cursorColor: ColorsApp.colorBorderButtonAndText,
                                style: FontsApp().fontBodySmall.copyWith(
                                      color: ColorsApp.colorBorderButtonAndText,
                                    ),
                                controller: _conmmentController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      ColorsApp.colorHintText.withOpacity(0.2),
                                  hintText: 'Ban la nguoi dau tien binh lua,',
                                  contentPadding:
                                      const EdgeInsets.all(SizesApp.s8),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.circular(SizesApp.s20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconWithButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: ColorsApp.colorBorderButtonAndText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactButton({required String text, required Widget icon}) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: SizesApp.s8,
          ),
          Text(
            text,
            style: FontsApp().fontBodySmall,
          )
        ],
      ),
      onPressed: () {},
    );
  }

  Widget _buildItemNewFeed() {
    return Padding(
      padding: const EdgeInsets.only(
        right: SizesApp.s8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizesApp.s8),
          border: Border.all(
            color: ColorsApp.colorFocusField.withOpacity(0.5),
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(SizesApp.s8),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                width: SizesApp.s100,
                height: SizesApp.s150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: SizesApp.s8,
              left: SizesApp.s8,
              child: Stack(
                children: [
                  Container(
                    width: SizesApp.s36,
                    height: SizesApp.s36,
                    decoration: BoxDecoration(
                      color: ColorsApp.colorTheme,
                      borderRadius: BorderRadius.circular(
                        SizesApp.s20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: SizesApp.s2,
                    left: SizesApp.s2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(SizesApp.s16),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                        width: SizesApp.s32,
                        height: SizesApp.s32,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(SizesApp.s8),
                  child: SizedBox(
                    width: SizesApp.s100,
                    child: Text(
                      'Nguyễn Đức Hoàng Phi',
                      style: FontsApp().fontBodySmall.copyWith(
                            color: ColorsApp.colorTheme,
                            fontSize: SizesApp.s12,
                          ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      SignOutRequested(),
    );
  }
}
