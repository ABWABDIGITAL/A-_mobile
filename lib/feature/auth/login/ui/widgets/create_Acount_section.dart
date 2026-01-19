
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/utils/spacing.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../register/ui/screens/register_screen.dart';

class CreateAccountSection extends StatelessWidget {
  const CreateAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr('no_account'),
            style: TextStyles.font14DarkGray400Weight,
          ),
          horizontalSpace(4),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
            },
            child: Text(
              tr('create_account'),
              style: TextStyles.font12Blue400Weight.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}