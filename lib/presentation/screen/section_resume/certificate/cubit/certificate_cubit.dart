import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/certificate_entity.dart';
import 'package:career_coach/domain/use_case/get_certificates_use_case.dart';
import 'package:career_coach/domain/use_case/save_certificates_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'certificate_state.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit() : super(CertificateState());

  final getCertificatesUseCase = getIt<GetCertificatesUseCase>();
  final saveCertificatesUseCase = getIt<SaveCertificatesUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listCertificate = await getCertificatesUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listCertificate: listCertificate, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listCertificate) {
        if (it.name.trim().isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Certificate name cannot be empty.'));
          return;
        }
      }
      await saveCertificatesUseCase.call(
        userResumeId: userResumeId,
        listCertificate: state.listCertificate,
      );
      final listCertificate = await getCertificatesUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listCertificate: listCertificate,
          isLoading: false,
          isSavedSuccess: true,
          error: '',
        ),
      );
      emit(state.copyWith(isSavedSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> addCertificate() async {
    final newCertificate = CertificateEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listCertificate.length,
      name: '',
      certificatedAt: '',
      certificateLink: '',
    );
    final updatedList = List<CertificateEntity>.from(state.listCertificate)..add(newCertificate);
    emit(state.copyWith(listCertificate: updatedList));
  }

  Future<void> deleteCertificate(int index) async {
    final updatedList = List<CertificateEntity>.from(state.listCertificate)..removeAt(index);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listCertificate: updatedList));
  }

  Future<void> changeActivity(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listCertificate.length) return;
    final updatedList = List<CertificateEntity>.from(state.listCertificate);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listCertificate: updatedList));
  }
}
