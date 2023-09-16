class UserDetailsModel{
  final String name;
  final String address;

  UserDetailsModel({required this.name,required this.address});

  get displayName => null;
  Map<String,dynamic> getJson() =>{
    'name': name,
    'address': address,
  };
}