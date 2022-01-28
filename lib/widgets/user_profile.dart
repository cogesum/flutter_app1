// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.call, 'Звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notification_add, 'Уведомления и звуки'),
    MenuRowData(Icons.price_change, 'Конфиденциальность'),
    MenuRowData(Icons.data_usage, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];
  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _UserInfo(),
            SizedBox(
              height: 30,
            ),
            _MenuWidget(
              menuRow: firstMenuRow,
            ),
            SizedBox(
              height: 30,
            ),
            _MenuWidget(
              menuRow: secondMenuRow,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          _AvatarWidget(),
          SizedBox(height: 30),
          _UserNameWidget(),
          SizedBox(height: 7),
          _UserPhoneWidget(),
          SizedBox(height: 5),
          _UserNickNameWidget(),
        ],
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow
            .map((data) => _MenuWidgetRow(
                  data: data,
                ))
            .toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData? data;

  const _MenuWidgetRow({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data?.icon),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(data!.text),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "@cogesum",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "+7(123)456 78 90",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ilya Stykalo",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Placeholder(),
    );
  }
}
