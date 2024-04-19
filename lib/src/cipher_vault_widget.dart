import 'dart:async';
import 'dart:math';

import 'package:cipher_vault/cipher_vault.dart';
import 'package:flutter/material.dart';

/// Widget that displays the secret
/// Depending on the argument, is it a secret?
///  displays either an animation or a secret
class CipherVault extends StatefulWidget {
  final Widget? buttonCopy;
  final TextStyle? textStyle;
  final String? secret;
  final CipherVaultConfig? config;

  /// Сreate a widget that displays the secret
  ///
  /// [secret] - The secret that the widget shows
  ///
  /// [textStyle] - Secret and animated text style
  ///
  /// [buttonCopy] - When the secret is shown, this widget will be displayed
  ///  to the right of the widget (usually used for the copy button)
  ///
  /// [config] - Fine-tuning the widget
  const CipherVault({
    super.key,
    this.secret,
    this.textStyle,
    this.buttonCopy,
    this.config,
  });

  @override
  State<CipherVault> createState() => _CipherVaultState();
}

class _CipherVaultState extends State<CipherVault> {
  late String runningText;
  late Timer timer;
  late CipherVaultConfig config;
  final Random random = Random();
  bool isShowPassword = false;

  @override
  void initState() {
    super.initState();
    config =
        CipherVaultConfig.defaultValues().copyWithClass(config: widget.config);
    if (widget.secret != null) {
      showPassword(widget.secret!);
    } else {
      showCipherVault();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void showCipherVault() {
    runningText = _generateRandomString();
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (final t) {
        setState(
          () {
            runningText = _generateRunningText();
          },
        );
      },
    );
  }

  void showPassword(final String password) {
    final List<int> runnigCharsAttemp = List.filled(password.length, 0);
    runningText = _generateRandomString(lenght: password.length);
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (final t) {
        setState(
          () {
            runningText = _generateShowPassword(
              runnigCharsAttemp,
              password,
            );
          },
        );

        if (runningText == password) {
          timer.cancel();
          setState(
            () {
              isShowPassword = true;
            },
          );
        }
      },
    );
  }

  String _generateRandomString({final int? lenght}) {
    final int length = lenght ??
        config.minLenghtCipherVault! +
            random.nextInt(
              config.maxLenghtCipherVault! - config.minLenghtCipherVault! + 1,
            );

    return List.generate(
      length,
      (final index) => config.alphabetCipherVault![
          random.nextInt(config.alphabetCipherVault!.length)],
    ).join();
  }

  String _generateRunningText() {
    final List<String> runningChars = runningText.split('');
    for (int i = 0; i < runningChars.length; i++) {
      if (random.nextDouble() < config.showAnimationFrequency!) {
        runningChars[i] = config.alphabetCipherVault![
            random.nextInt(config.alphabetCipherVault!.length)];
      }
    }
    return runningChars.join();
  }

  String _generateShowPassword(
    final List<int> runnigCharsAttemp,
    final String password,
  ) {
    final List<String> runningChars = runningText.split('');
    for (int i = 0; i < runningChars.length; i++) {
      if (random.nextDouble() < config.showPasswordAnimationFrequency!) {
        if (runnigCharsAttemp[i] > config.countAttemp!) {
          runningChars[i] = password[i];
          continue;
        }
        runnigCharsAttemp[i]++;
        runningChars[i] = config.alphabetCipherVault![
            random.nextInt(config.alphabetCipherVault!.length)];
      }
    }
    return runningChars.join();
  }

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isShowPassword)
            SelectableText(
              runningText,
              style: widget.textStyle,
            )
          else
            Text(
              runningText,
              style: widget.textStyle,
            ),
          if (isShowPassword)
            const SizedBox.shrink()
          else
            widget.buttonCopy ?? const SizedBox.shrink(),
        ],
      );
}
