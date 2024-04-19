# Cipher Vault

<img src="https://raw.githubusercontent.com/MixKage/cipher_vault/main/.github/images/logo.gif" />

# Example of using

The simplest example is when we have two states. We don't know the password - we display the animation. We know the password - we display an animation that will eventually show the password.

```dart
if (visibleSecret) {
    CipherVault(
        key: UniqueKey(),
        secret: 'cipher_vault',
    ),
} else{
    CipherVault(
        key: UniqueKey(),
    )
}
```

When the password is shown at the end of the animation, we can copy using Selectable Text or use our copy widget

```dart
CipherVault(
    secret: 'My Password',
    buttonCopy: YourButtonCopyWidget(),
),
```

<img src="https://raw.githubusercontent.com/MixKage/cipher_vault/main/.github/images/example_with_copy.gif" />

You can fine-tune the animation using the configurator. For example, to adjust the animation speed or to use other languages

```dart
CipherVault(
    secret: 'cipher_vault',
    config: CipherVaultConfig(
        alphabetCipherVault: myAlphabet,
        minLenghtCipherVault: 5,
        maxLenghtCipherVault: 12,
    ),
),
```

All available settings at the moment

```dart
/// VaultConfig - Fine-tuning the CipherVault
///
/// [alphabetCipherVault] - The symbols that can make
///  up the animation of the secret
///
/// [minLenghtCipherVault] - Minimum secret length
///
/// [maxLenghtCipherVault] - Maximum secret length
///
/// [updateAnimationUpdate] - Animation widget refresh rate
///
/// [updatePasswordAnimationUpdate] - Refresh rate of the password
///  display animation widget
///
/// [showAnimationFrequency] - How often characters are replaced when
///  animating a classified secret. The standard value is 0.2
///
/// [showPasswordAnimationFrequency] - How often characters are replaced
///  when animating the declassification of a secret.
///  The standard value is 0.5
///
/// [countAttemp] - The number of possible replacements when the
///  password is declassified. The standard value is 5
const CipherVaultConfig({
    required this.alphabetCipherVault,
    required this.minLenghtCipherVault,
    required this.maxLenghtCipherVault,
    required this.updateAnimationUpdate,
    required this.updatePasswordAnimationUpdate,
    required this.showAnimationFrequency,
    required this.showPasswordAnimationFrequency,
    required this.countAttemp,
});
```

# Changelog

[Refer to the Changelog to get all release notes.](https://github.com/MixKage/cipher_vault/blob/main/CHANGELOG.md)

# Maintainers

[Valerij Shishov](https://github.com/MixKage)

This library is open for issues and pull requests. If you have ideas for improvements or bugs, the repository is open to contributions!

# License

[MIT](https://opensource.org/license/mit/)
