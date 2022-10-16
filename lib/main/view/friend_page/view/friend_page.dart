import 'package:chat_app_b/constants/fonts.dart';
import 'package:chat_app_b/wigdets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/bloc/auth_bloc.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
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
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: SizesApp.s16),
              color: ColorsApp.colorTheme,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizesApp.s48 * SizesApp.s2 - SizesApp.s42,
                      color: Colors.black,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: SizesApp.s16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bạn bè',
                            style: FontsApp().fontBodyMedium.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          Container(
                            width: SizesApp.s40,
                            height: SizesApp.s40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizesApp.s20),
                              color: ColorsApp.colorBorderButtonAndText
                                  .withOpacity(0.1),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size(0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(SizesApp.s20),
                                ),
                              ),
                              child: Icon(
                                Icons.search_outlined,
                                color: ColorsApp.colorBorderButtonAndText,
                                size: SizesApp.s32,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizesApp.s16),
                        ),
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                        backgroundColor:
                            ColorsApp.colorHintText.withOpacity(0.2),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bạn bè',
                          style: FontsApp().fontBodySmall,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SizesApp.s16,
                    ),
                    const Divider(
                      height: 1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: SizesApp.s16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Lời mời kết bạn',
                                  style: FontsApp().fontBodySmall),
                              const SizedBox(
                                width: SizesApp.s4,
                              ),
                              Text(
                                '128',
                                style: FontsApp()
                                    .fontBodySmall
                                    .copyWith(color: Colors.red),
                              )
                            ],
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(
                                  0,
                                  0,
                                ),
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            child: const Text('Xem tất cả'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                    _buildItemInvite(),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildItemInvite() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SizesApp.s8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(SizesApp.s40),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                width: SizesApp.s80,
                height: SizesApp.s80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: SizesApp.s16,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nguyễn Đức Hoàng Phi',
                        style: FontsApp().fontBodySmall,
                      ),
                      Text(
                        '5 năm',
                        style: FontsApp().fontBodySmall.copyWith(
                            fontSize: SizesApp.s12,
                            fontWeight: FontWeight.w400,
                            color: ColorsApp.colorHintText),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizesApp.s12,
                  ),
                  Row(
                    children: [
                      _buildTextButton(
                        backgroundColor: Colors.blue,
                        onPressed: () {},
                        textColor: ColorsApp.colorTheme,
                        text: 'Chấp nhận',
                      ),
                      const SizedBox(
                        width: SizesApp.s8,
                      ),
                      _buildTextButton(
                        backgroundColor:
                            ColorsApp.colorHintText.withOpacity(0.2),
                        onPressed: () {},
                        textColor: ColorsApp.colorBorderButtonAndText,
                        text: 'Xóa bỏ',
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

  Widget _buildTextButton({
    required Color backgroundColor,
    required void Function()? onPressed,
    required Color textColor,
    required String text,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(0, 0)),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: SizesApp.s8),
          child: Text(
            text,
            style: FontsApp().fontBodySmall.copyWith(color: textColor),
          ),
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
