class WindowsNetworkAdapterInfoData {
  WindowsNetworkAdapterInfoData({
    required this.adapterName,
    required this.description,
    required this.ipAddress,
  });

  String adapterName;
  String description;
  String ipAddress;

  factory WindowsNetworkAdapterInfoData.fromJson(Map<String, dynamic> json) =>
      WindowsNetworkAdapterInfoData(
        adapterName: json['adapterName'],
        description: json['description'],
        ipAddress: json['ipAddress'],
      );

  Map<String, dynamic> toJson() => {
        'adapterName': adapterName,
        'description': description,
        'ipAddress': ipAddress,
      };
}
