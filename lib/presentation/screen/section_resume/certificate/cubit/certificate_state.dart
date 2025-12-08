part of 'certificate_cubit.dart';

class CertificateState {
  final List<CertificateEntity> listCertificate;
  final String error;
  final bool isLoading;
  final bool isSavedSuccess;

  CertificateState({
    this.listCertificate = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  CertificateState copyWith({
    List<CertificateEntity>? listCertificate,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return CertificateState(
      listCertificate: listCertificate ?? this.listCertificate,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
