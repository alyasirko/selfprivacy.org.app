part of 'users.dart';

class _User extends StatelessWidget {
  const _User({Key? key, required this.user, required this.isRootUser})
      : super(key: key);

  final User user;
  final bool isRootUser;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBrandBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return _UserDetails(user: user, isRootUser: isRootUser);
          },
        );
      },
      child: Container(
        padding: paddingH15V0,
        height: 48,
        child: Row(
          children: [
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: user.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: isRootUser
                  ? BrandText.h4Underlined(user.login)
                  // cross out text if user not found on server
                  : BrandText.h4(user.login,
                      style: user.isFoundOnServer
                          ? null
                          : const TextStyle(
                              decoration: TextDecoration.lineThrough)),
            ),
          ],
        ),
      ),
    );
  }
}
