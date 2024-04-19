/// Fine-tuning the CipherVault
class CipherVaultConfig {
  final String? alphabetCipherVault;
  final int? minLenghtCipherVault;
  final int? maxLenghtCipherVault;
  final Duration? updateAnimationUpdate;
  final Duration? updatePasswordAnimationUpdate;
  final double? showAnimationFrequency;
  final double? showPasswordAnimationFrequency;
  final int? countAttemp;

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
    this.alphabetCipherVault,
    this.minLenghtCipherVault,
    this.maxLenghtCipherVault,
    this.updateAnimationUpdate,
    this.updatePasswordAnimationUpdate,
    this.showAnimationFrequency,
    this.showPasswordAnimationFrequency,
    this.countAttemp,
  });

  /// @return CipherVaultConfig with defaultValues
  factory CipherVaultConfig.defaultValues() => const CipherVaultConfig(
        alphabetCipherVault:
            // ignore: lines_longer_than_80_chars
            'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()-_=+',
        minLenghtCipherVault: 7,
        maxLenghtCipherVault: 16,
        updateAnimationUpdate: Duration(milliseconds: 100),
        updatePasswordAnimationUpdate: Duration(milliseconds: 100),
        showAnimationFrequency: 0.2,
        showPasswordAnimationFrequency: 0.5,
        countAttemp: 5,
      );

  CipherVaultConfig copyWith({
    final String? alphabetCipherVault,
    final int? minLenghtCipherVault,
    final int? maxLenghtCipherVault,
    final Duration? updateAnimationUpdate,
    final Duration? updatePasswordAnimationUpdate,
    final double? showAnimationFrequency,
    final double? showPasswordAnimationFrequency,
    final int? countAttemp,
  }) =>
      CipherVaultConfig(
        alphabetCipherVault: alphabetCipherVault ?? this.alphabetCipherVault,
        minLenghtCipherVault: minLenghtCipherVault ?? this.minLenghtCipherVault,
        maxLenghtCipherVault: maxLenghtCipherVault ?? this.maxLenghtCipherVault,
        updateAnimationUpdate:
            updateAnimationUpdate ?? this.updateAnimationUpdate,
        updatePasswordAnimationUpdate:
            updatePasswordAnimationUpdate ?? this.updatePasswordAnimationUpdate,
        showAnimationFrequency:
            showAnimationFrequency ?? this.showAnimationFrequency,
        showPasswordAnimationFrequency: showPasswordAnimationFrequency ??
            this.showPasswordAnimationFrequency,
        countAttemp: countAttemp ?? this.countAttemp,
      );

  CipherVaultConfig copyWithClass({
    final CipherVaultConfig? config,
  }) =>
      CipherVaultConfig(
        alphabetCipherVault: config?.alphabetCipherVault ?? alphabetCipherVault,
        minLenghtCipherVault:
            config?.minLenghtCipherVault ?? minLenghtCipherVault,
        maxLenghtCipherVault:
            config?.maxLenghtCipherVault ?? maxLenghtCipherVault,
        updateAnimationUpdate:
            config?.updateAnimationUpdate ?? updateAnimationUpdate,
        updatePasswordAnimationUpdate: config?.updatePasswordAnimationUpdate ??
            updatePasswordAnimationUpdate,
        showAnimationFrequency:
            config?.showAnimationFrequency ?? showAnimationFrequency,
        showPasswordAnimationFrequency:
            config?.showPasswordAnimationFrequency ??
                showPasswordAnimationFrequency,
        countAttemp: config?.countAttemp ?? countAttemp,
      );

  @override
  String toString() =>
      'CipherVaultConfig(alphabetCipherVault: $alphabetCipherVault, '
      'minLenghtCipherVault: $minLenghtCipherVault, '
      'maxLenghtCipherVault: $maxLenghtCipherVault, '
      'updateAnimationUpdate: $updateAnimationUpdate, '
      'updatePasswordAnimationUpdate: $updatePasswordAnimationUpdate, '
      'showAnimationFrequency: $showAnimationFrequency, '
      'showPasswordAnimationFrequency: $showPasswordAnimationFrequency, '
      'countAttemp: $countAttemp)';

  @override
  bool operator ==(covariant final CipherVaultConfig other) {
    if (identical(this, other)) {
      return true;
    }

    return other.alphabetCipherVault == alphabetCipherVault &&
        other.minLenghtCipherVault == minLenghtCipherVault &&
        other.maxLenghtCipherVault == maxLenghtCipherVault &&
        other.updateAnimationUpdate == updateAnimationUpdate &&
        other.updatePasswordAnimationUpdate == updatePasswordAnimationUpdate &&
        other.showAnimationFrequency == showAnimationFrequency &&
        other.showPasswordAnimationFrequency ==
            showPasswordAnimationFrequency &&
        other.countAttemp == countAttemp;
  }

  @override
  int get hashCode =>
      alphabetCipherVault.hashCode ^
      minLenghtCipherVault.hashCode ^
      maxLenghtCipherVault.hashCode ^
      updateAnimationUpdate.hashCode ^
      updatePasswordAnimationUpdate.hashCode ^
      showAnimationFrequency.hashCode ^
      showPasswordAnimationFrequency.hashCode ^
      countAttemp.hashCode;
}
