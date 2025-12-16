import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/favorite_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/screen/section_resume/favorite/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<TextEditingController> _listNameController = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..init(userResumeId: widget.userResumeId),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
            child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
          ),
          centerTitle: true,
          title: Text(
            context.language.favorite,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              Expanded(child: _listView()),
              SizedBox(height: 16.0),
              _buttonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listView() {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state.isLoading) {
          DialogUtils.showLoadingDialog(context);
        } else {
          DialogUtils.hideLoadingDialog(context);
        }
        if (state.isSavedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.language.saveInformationSuccess,
                style: TextStyleUtils.normal(color: context.theme.backgroundColor, fontSize: 12),
              ),
              backgroundColor: context.theme.goodColor,
              duration: const Duration(seconds: 1),
            ),
          );
        }
        if (state.error.isNotEmpty) {
          DialogUtils.showErrorDialog(context: context, message: state.error);
          state.error = '';
        }

        _listNameController.clear();
        for (var it in state.listFavorite) {
          _listNameController.add(TextEditingController(text: it.name));
        }
      },
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.listFavorite.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.theme.lightGreyColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      if (state.listFavorite[index].displayOrder != state.listFavorite.length - 1) ...[
                        _buttonChange(type: 1, onChange: () {
                          saveTemp(state.listFavorite);
                          context.read<FavoriteCubit>().changeFavorite(index, index + 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      if (state.listFavorite[index].displayOrder != 0) ...[
                        _buttonChange(type: 2, onChange: () {
                          saveTemp(state.listFavorite);
                          context.read<FavoriteCubit>().changeFavorite(index, index - 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      _buttonChange(type: 0, onChange: () {
                        saveTemp(state.listFavorite);
                        context.read<FavoriteCubit>().deleteFavorite(index);
                      }),
                    ],
                  ),
                  BaseContent(
                    controller: _listNameController[index],
                    isRequired: true,
                    title: context.language.favorite,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buttonChange({required int type, Function()? onChange}) {
    return InkWell(
      onTap: onChange,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: type == 0 ? Colors.redAccent : context.theme.primaryColor, width: 1),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          type == 0
              ? FontAwesomeIcons.trashCan
              : type == 1
              ? FontAwesomeIcons.angleDown
              : FontAwesomeIcons.angleUp,
          color: type == 0 ? Colors.redAccent : context.theme.primaryColor,
          size: 18,
        ),
      ),
    );
  }

  Widget _buttonSave() {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    saveTemp(state.listFavorite);
                    context.read<FavoriteCubit>().addFavorite();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor.withAlpha((255 * 0.1).round()),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      context.language.add,
                      style: TextStyleUtils.bold(color: context.theme.primaryColor, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () {
                    saveTemp(state.listFavorite);
                    context.read<FavoriteCubit>().save(userResumeId: widget.userResumeId);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      context.language.save,
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  void saveTemp(List<FavoriteEntity> listFavorite) {
    for (var it in listFavorite) {
      final index = listFavorite.indexOf(it);
      it.name = _listNameController[index].text;
    }
  }
}
