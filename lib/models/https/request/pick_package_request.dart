class PickPackageRequest {
  String? fromState;
  String? fromTown;
  int? capacity;
  String? toState;
  String? toTown;
  String? travelTime;
  String? packageType;
  String? transportMode;

  PickPackageRequest(
      {this.fromState,
      this.fromTown,
      this.capacity,
      this.toState,
      this.toTown,
      this.travelTime,
      this.packageType,
      this.transportMode});

  PickPackageRequest.fromJson(Map<String, dynamic> json) {
    fromState = json['fromState'];
    fromTown = json['fromTown'];
    capacity = json['capacity'];
    toState = json['toState'];
    toTown = json['toTown'];
    travelTime = json['travelTime'];
    packageType = json['packageType'];
    transportMode = json['transportMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromState'] = fromState;
    data['fromTown'] = fromTown;
    data['capacity'] = capacity;
    data['toState'] = toState;
    data['toTown'] = toTown;
    data['travelTime'] = travelTime;
    data['packageType'] = packageType;
    data['transportMode'] = transportMode;
    return data;
  }
}
