import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/components/widgets/custom_appbar.dart';
import 'package:social_app/core/init/lang/locale_keys.g.dart';

class NoNetworkPage extends StatelessWidget {
  const NoNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.pages_nonetwork.tr(),
      ),
      body: const Center(
        child: Text(
          "Internet bağlantınız bulunmamaktadır.\n Lütfen kontrol ediniz",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
