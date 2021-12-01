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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromState'] = this.fromState;
    data['fromTown'] = this.fromTown;
    data['capacity'] = this.capacity;
    data['toState'] = this.toState;
    data['toTown'] = this.toTown;
    data['travelTime'] = this.travelTime;
    data['packageType'] = this.packageType;
    data['transportMode'] = this.transportMode;
    return data;
  }
}
