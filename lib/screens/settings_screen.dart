import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _selectedLanguage = 'Português';
  bool _isDarkTheme = true;
  bool _isNotificationEnabled = true;
  final List<String> _languages = ['Português', 'Inglês', 'Espanhol', 'Francês'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Kimberlé'),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.turn_slight_left_outlined, size: 35),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text('Notificações', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Ativar notificações', style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        Switch(value: _isNotificationEnabled, onChanged: (value) {
                          setState(() {
                            _isNotificationEnabled = value;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('Tema', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text('Tema escuro', style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        Switch(value: _isDarkTheme, onChanged: (value) {
                          setState(() {
                            _isDarkTheme = value;
                          });
                        }),

                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('Idioma', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 5),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _languages.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(_languages[index], style: Theme.of(context).textTheme.bodySmall),
                          value: _languages[index],
                          groupValue: _selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value as String;
                            });
                          },
                          contentPadding: const EdgeInsets.all(0),
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text('Sobre', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    Text('Versão 1.0.0', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 10),
                    Text('Desenvolvido com o objetivo de facilitar a busca por vagas de emprego destinadas a minorias.', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 10),
                    Text('Desenvolvido por: Vinicius Castro', style: Theme.of(context).textTheme.bodySmall),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
