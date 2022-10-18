import 'dart:convert';

import 'package:chat_app_b/constants/fonts.dart';
import 'package:chat_app_b/user/model/user_model.dart';
import 'package:chat_app_b/wigdets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/bloc/auth_bloc.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../user/bloc/user_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is UnAuthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/signin',
              (route) => false,
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            print(state);
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(
                    color: ColorsApp.colorBorderButtonAndText),
              );
            }
            if (state is Authenticated) {
              return FutureBuilder<DocumentSnapshot?>(
                  future: userBloc.getUser(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // Map<String, dynamic> data =
                      //     snapshot.data!.data() as Map<String, dynamic>;
                      UserModel user = UserModel.fromFirestore(snapshot.data!);
                      return Container(
                        color: ColorsApp.colorTheme,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    SizesApp.s48 * SizesApp.s2 - SizesApp.s42,
                                color: Colors.black,
                              ),
                              Container(
                                padding: const EdgeInsets.all(SizesApp.s16),
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              SizesApp.s75),
                                          child: Image.network(
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
                                            width: SizesApp.s150,
                                            height: SizesApp.s150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: SizesApp.s4,
                                          right: SizesApp.s4,
                                          child: InkWell(
                                              onTap: () {},
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizesApp.s15),
                                                child: Container(
                                                  color: Colors.grey.shade400,
                                                  width: SizesApp.s30,
                                                  height: SizesApp.s30,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color:
                                                        ColorsApp.colorHintText,
                                                    size: SizesApp.s20,
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                              Text(
                                user.name,
                                style: FontsApp().fontBodyLarge.copyWith(
                                      fontSize: SizesApp.s24,
                                    ),
                              ),
                              const SizedBox(
                                height: SizesApp.s16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: SizesApp.s16),
                                child: Column(
                                  children: [
                                    _buildTextButton(
                                      context,
                                      text: 'Đổi mật khẩu',
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/change_password');
                                      },
                                    ),
                                    _buildTextButton(
                                      context,
                                      text: 'Đăng xuất',
                                      onPressed: () {
                                        _signOut(context);
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Error');
                    }
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: ColorsApp.colorTheme,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: ColorsApp.colorBorderButtonAndText,
                        )));
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildTextButton(BuildContext context,
      {required void Function()? onPressed, required String text}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizesApp.s8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: FontsApp().fontBodySmall,
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
