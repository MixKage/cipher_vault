import 'package:cipher_vault/cipher_vault.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CipherVault Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // You can use a different alphabet.
  static const String cyrillicAlphabet = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
      'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ!@#%^&*()-_=+';
  late bool isShowSecret;
  late String? secret1;
  late String? secret2;
  late String? secret3;
  // You can create, store, and modify Config using copyWith and CopyWithClass
  late CipherVaultConfig config;

  @override
  void initState() {
    secret1 = null;
    secret2 = null;
    secret3 = null;
    isShowSecret = true;
    config = const CipherVaultConfig(
      minLengthCipherVault: 10,
      maxLengthCipherVault: 22,
      showPasswordAnimationFrequency: 0.8,
    );
    super.initState();
  }

  Future<void> _getSecret() async {
    // Getting the secret with Future
    await Future.delayed(
      const Duration(seconds: 1),
      () => setState(
        () {
          secret1 = isShowSecret ? 'My Secret 1' : null;
          secret2 = isShowSecret ? 'My Long Secret 2' : null;
          secret3 = isShowSecret ? 'Мой длинный секрет 3' : null;
          isShowSecret = !isShowSecret;
        },
      ),
    );
  }

  Future<void> _copyButtonSecret() async {
    Clipboard.setData(ClipboardData(text: secret1 ?? '')).then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The text has been copied'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CipherVault Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CipherVault(
                secret: secret1,
              ),
              CipherVault(
                secret: secret2,
                textStyle: const TextStyle(fontSize: 16.0),
                config: config,
                buttonCopy: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 16,
                  onPressed: _copyButtonSecret,
                  icon: const Icon(Icons.copy),
                ),
              ),
              // Example with another alphabet
              CipherVault(
                secret: secret3,
                textStyle: const TextStyle(fontSize: 18.0),
                config: config.copyWith(
                  alphabetCipherVault: cyrillicAlphabet,
                  countAttemp: 15,
                  showAnimationFrequency: 3.0,
                  updateAnimationUpdate: const Duration(milliseconds: 30),
                ),
                buttonCopy: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: _copyButtonSecret,
                  icon: const Icon(Icons.copy),
                ),
              ),
              ElevatedButton(
                onPressed: _getSecret,
                child: const Text('Get Secret'),
              ),
            ],
          ).withPadding(const EdgeInsets.all(16.0)),
        ),
      ),
    );
  }
}

extension ColumnPadding on Column {
  Column withPadding(EdgeInsetsGeometry padding) {
    return Column(
      children: children
          .map((widget) => Padding(
                padding: padding,
                child: widget,
              ))
          .toList(),
    );
  }
}
