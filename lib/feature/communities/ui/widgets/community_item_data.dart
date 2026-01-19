class CommunityItemData {
  final String titleKey;
  final String descKey;
  final String membersKey;
  final String imageAsset;
  final bool isFollowing;

  const CommunityItemData({
    required this.titleKey,
    required this.descKey,
    required this.membersKey,
    required this.imageAsset,
    required this.isFollowing,
  });
}