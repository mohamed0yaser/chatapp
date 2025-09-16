import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_app_bar.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
final TextEditingController phoneController = TextEditingController();
String? initialCountry;
String? countryEmoji;
String? phoneNumber;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

void selectCountry() {
  showCountryPicker(
    context: context,
    showPhoneCode: true,
    onSelect: (Country country) {
      setState(() {
        initialCountry = "+${country.phoneCode}";
        countryEmoji = country.flagEmoji;
      });
      log('Select country: ${country.displayName}');
    },
  );
  }

  void sendPhoneNumber() {
    if (phoneNumber != null && phoneNumber!.isNotEmpty) {
      ref.read(authControllerProvider.notifier).signInWithPhone(phoneNumber!, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Enter your phone number',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'WhatsApp will need to verify your phone number',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => selectCountry(),
                  child: const Text(
                    'Choose country',
                    style: TextStyle(
                      color: tabColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child:  Row(
                    children: [
                      if(initialCountry != null)
                       SizedBox(
                        width: 60,
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: '$countryEmoji $initialCountry',
                            hintStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                       const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          readOnly: initialCountry == null ? true : false,
                          onChanged: (value) {
                            phoneNumber = '$initialCountry$value';
                            log(phoneNumber ?? '');
                          },
                          controller: phoneController,
                          decoration: const InputDecoration(
                            hintText: 'Phone number',
                            hintStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Carrier charges may apply',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                
              ],
            ),
            CustomButton(
              text: 'NEXT',
              onPressed: () {
                sendPhoneNumber();
                log('Next pressed with phone number: ${phoneNumber!}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
