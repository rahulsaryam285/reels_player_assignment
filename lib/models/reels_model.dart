import 'dart:convert';

class ReelsModel {
  ReelsModel({
    required this.videoUrl,
    required this.userName,
  });

  factory ReelsModel.fromMap(Map<String, dynamic> map) => ReelsModel(
        videoUrl: map['videoUrl'] as String? ?? '',
        userName: map['userName'] as String? ?? '',
      );

  factory ReelsModel.fromJson(String source) =>
      ReelsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String videoUrl;

  final String userName;

  ReelsModel copyWith({
    String? videoUrl,
    String? userName,
  }) =>
      ReelsModel(
        videoUrl: videoUrl ?? this.videoUrl,
        userName: userName ?? this.userName,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'videoUrl': videoUrl,
        'userName': userName,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ReelsModel(videoUrl: $videoUrl, userName: $userName)';

  @override
  bool operator ==(covariant ReelsModel other) {
    if (identical(this, other)) return true;

    return other.videoUrl == videoUrl && other.userName == userName;
  }

  @override
  int get hashCode => videoUrl.hashCode ^ userName.hashCode;
}
