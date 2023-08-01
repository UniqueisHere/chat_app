import 'package:chat_app/core/constants/app_texts/app_texts.dart';
import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:chat_app/core/widgets/profile_avatar.dart';
import 'package:chat_app/features/profile/widgets/gender.dart';
import 'package:chat_app/layout/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AllColors.scaffoldColor,
        appBar: CustomAppBar(
          title: AppTexts.editProfile,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    const ProfileAvatar(
                      size: 120,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AllColors.bottonColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            )),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.pen,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintText: AppTexts.firstname,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: AppTexts.lastname,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: AppTexts.phoneNumber,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: AppTexts.address,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: AllColors.textFieldColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        color: AllColors.textColor,
                        size: 13,
                        text: AppTexts.gender,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: CustomText(
                                color: AllColors.textColor,
                                size: 12,
                                text: AppTexts.male,
                              ),
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(
                                  () {
                                    gender = Gender.male;
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: CustomText(
                                color: AllColors.textColor,
                                size: 12,
                                text: AppTexts.female,
                              ),
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(
                                  () {
                                    gender = Gender.female;
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: CustomText(
                                  color: AllColors.textColor,
                                  size: 12,
                                  text: AppTexts.other),
                              value: Gender.other,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(
                                  () {
                                    gender = Gender.other;
                                  },
                                );
                              },
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
        ),
      ),
    );
  }
}
