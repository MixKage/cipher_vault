import 'dart:async';
import 'dart:math';

import 'package:cipher_vault/cipher_vault.dart';
import 'package:flutter/material.dart';

/// Widget that displays the secret
/// Depending on the argument, is it a secret?
///  displays either an animation or a secret
class CipherVault extends StatefulWidget {
  final Widget buttonCopy;
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
    this.buttonCopy = const SizedBox.shrink(),
    this.config,
  });

  @override
  State<CipherVault> createState() => _CipherVaultState();
}

class _CipherVaultState extends State<CipherVault> {
  late String runningText;
  Timer? timer;
  late final CipherVaultConfig config =
      widget.config ?? const CipherVaultConfig();
  final Random random = Random();
  bool isShowPassword = false;

  @override
  void initState() {
    super.initState();
    if (widget.secret != null) {
      showPassword(widget.secret!);
    } else {
      showCipherVault();
    }
  }

  @override
  void didUpdateWidget(covariant final CipherVault oldWidget) {
    super.didUpdateWidget(oldWidget);
    timer?.cancel();
    if (widget.secret != null) {
      showPassword(widget.secret!);
    } else {
      showCipherVault();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void showCipherVault() {
    runningText = _generateRandomString();
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (final t) {
        setState(
          () {
            runningText = _generateRunningText();
            isShowPassword = false;
          },
        );
      },
    );
  }

  void showPassword(final String password) {
    timer?.cancel();
    final List<int> runningCharsAttemp = List.filled(password.length, 0);
    runningText = _generateRandomString(length: password.length);
    timer = Timer.periodic(
      config.updateAnimationUpdate,
      (final t) {
        setState(
          () {
            runningText = _generateShowPassword(
              runningCharsAttemp,
              password,
            );
          },
        );

        if (runningText == password) {
          timer?.cancel();
          setState(
            () {
              isShowPassword = true;
            },
          );
        }
      },
    );
  }

  String _generateRandomString({final int? length}) {
    final int stringLength = length ??
        (config.minLengthCipherVault +
            random.nextInt(
              config.maxLengthCipherVault - config.minLengthCipherVault + 1,
            ));
    return List.generate(
      stringLength,
      (final index) => config.alphabetCipherVault[
          random.nextInt(config.alphabetCipherVault.length)],
    ).join();
  }

  String _generateRunningText() {
    final List<String> runningChars = runningText.split('');
    for (int i = 0; i < runningChars.length; i++) {
      if (random.nextDouble() < config.showAnimationFrequency) {
        runningChars[i] = config.alphabetCipherVault[
            random.nextInt(config.alphabetCipherVault.length)];
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
      if (random.nextDouble() < config.showPasswordAnimationFrequency) {
        if (runnigCharsAttemp[i] > config.countAttemp) {
          runningChars[i] = password[i];
          continue;
        }
        runnigCharsAttemp[i]++;
        runningChars[i] = config.alphabetCipherVault[
            random.nextInt(config.alphabetCipherVault.length)];
      }
    }
    return runningChars.join();
  }

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isShowPassword)
            Flexible(
              child: Text(
                runningText,
                style: widget.textStyle,
              ),
            )
          else
            Flexible(
              child: SelectableText(
                runningText,
                style: widget.textStyle,
              ),
            ),
          if (isShowPassword) widget.buttonCopy,
        ],
      );
}
