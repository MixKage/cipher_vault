/// Fine-tuning the CipherVault
class CipherVaultConfig {
  final String alphabetCipherVault;
  final int minLengthCipherVault;
  final int maxLengthCipherVault;
  final Duration updateAnimationUpdate;
  final Duration updatePasswordAnimationUpdate;
  final double showAnimationFrequency;
  final double showPasswordAnimationFrequency;
  final int countAttemp;

  /// VaultConfig - Fine-tuning the CipherVault
  ///
  /// [alphabetCipherVault] - The symbols that can make
  ///  up the animation of the secret
  ///
  /// [minLengthCipherVault] - Minimum secret length
  ///
  /// [maxLengthCipherVault] - Maximum secret length
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
    this.alphabetCipherVault = 'abcdefghijklmnopqrstuvwxyz'
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()-_=+',
    this.minLengthCipherVault = 7,
    this.maxLengthCipherVault = 16,
    this.updateAnimationUpdate = const Duration(milliseconds: 100),
    this.updatePasswordAnimationUpdate = const Duration(milliseconds: 100),
    this.showAnimationFrequency = 0.2,
    this.showPasswordAnimationFrequency = 0.5,
    this.countAttemp = 5,
  });

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
        minLengthCipherVault: minLenghtCipherVault ?? minLengthCipherVault,
        maxLengthCipherVault: maxLenghtCipherVault ?? maxLengthCipherVault,
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
        minLengthCipherVault:
            config?.minLengthCipherVault ?? minLengthCipherVault,
        maxLengthCipherVault:
            config?.maxLengthCipherVault ?? maxLengthCipherVault,
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
      'minLenghtCipherVault: $minLengthCipherVault, '
      'maxLenghtCipherVault: $maxLengthCipherVault, '
      'updateAnimationUpdate: $updateAnimationUpdate, '
      'updatePasswordAnimationUpdate: $updatePasswordAnimationUpdate, '
      'showAnimationFrequency: $showAnimationFrequency, '
      'showPasswordAnimationFrequency: $showPasswordAnimationFrequency, '
      'countAttemp: $countAttemp)';

  @override
  bool operator ==(covariant final CipherVaultConfig other) {
    if (!identical(this, other)) {
      return false;
    }

    return other.alphabetCipherVault == alphabetCipherVault &&
        other.minLengthCipherVault == minLengthCipherVault &&
        other.maxLengthCipherVault == maxLengthCipherVault &&
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
      minLengthCipherVault.hashCode ^
      maxLengthCipherVault.hashCode ^
      updateAnimationUpdate.hashCode ^
      updatePasswordAnimationUpdate.hashCode ^
      showAnimationFrequency.hashCode ^
      showPasswordAnimationFrequency.hashCode ^
      countAttemp.hashCode;
}
