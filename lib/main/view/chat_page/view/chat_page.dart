import 'package:chat_app_b/constants/fonts.dart';
import 'package:chat_app_b/wigdets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/bloc/auth_bloc.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
              color: ColorsApp.colorTheme,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizesApp.s48 * SizesApp.s2 - SizesApp.s42,
                      color: Colors.black,
                    ),
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                        _buildItemChat(),
                      ],
                    ))
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

  InkWell _buildItemChat() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizesApp.s16,
          vertical: SizesApp.s8,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(SizesApp.s40),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                width: SizesApp.s60,
                height: SizesApp.s60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: SizesApp.s16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Đức Hoàng Phi',
                    style: FontsApp().fontBodySmall.copyWith(
                          fontSize: SizesApp.s16,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.colorBorderButtonAndText
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(
                    height: SizesApp.s8,
                  ),
                  Text(
                    'Ban: Nguyen Duc Hoang Phi',
                    style: FontsApp().fontBodySmall.copyWith(
                          fontSize: SizesApp.s14,
                          fontWeight: FontWeight.w100,
                          color: ColorsApp.colorBorderButtonAndText
                              .withOpacity(0.5),
                        ),
                  ),
                ],
              ),
            ),
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
