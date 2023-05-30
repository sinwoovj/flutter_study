enum Permission {
  unAble('사용 불가'),
  denied('거부'),
  deniedForever('계속 거부'),
  permitted('허용');

  final String info;
  const Permission(this.info);
}

enum ReportType {
  noRelation('관련 없는 컨텐츠'),
  advertisement('광고성 게시물'),
  etc('직접 작성');

  final String info;
  const ReportType(this.info);
}
