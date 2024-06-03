class UserRepositoryMockData {
  UserRepositoryMockData._();

  static const List<Map<String, dynamic>> usersMapData = [
    {
      'id': '1',
      'name': 'Robert Green',
      'email': 'verified@gmail.com',
      'password': '123456',
      'balance': 2054.43,
      'isVerified': true,
      'beneficiaries': [
        {
          'id': '1',
          'name': 'John Doe',
          'phoneNumber': '(555) 555-0100',
        },
        {
          'id': '2',
          'name': 'Jane Smith',
          'phoneNumber': '(555) 555-0101',
        },
        {
          'id': '3',
          'name': 'Michael Johnson',
          'phoneNumber': '(555) 555-0102',
        },
        {
          'id': '4',
          'name': 'Emily Davis',
          'phoneNumber': '(555) 555-0103',
        },
        {
          'id': '5',
          'name': 'David Brown',
          'phoneNumber': '(555) 555-0104',
        },
      ],
    },
    {
      'id': '2',
      'name': 'Christopher Harris',
      'email': 'unverified@gmail.com',
      'password': '123456',
      'balance': 3602.43,
      'isVerified': false,
      'beneficiaries': [
        {
          'id': '6',
          'name': 'Linda Jones',
          'phoneNumber': '(555) 555-0105',
        },
        {
          'id': '7',
          'name': 'James Wilson',
          'phoneNumber': '(555) 555-0106',
        },
        {
          'id': '8',
          'name': 'Barbara Moore',
          'phoneNumber': '(555) 555-0107',
        },
        {
          'id': '9',
          'name': 'Paul Taylor',
          'phoneNumber': '(555) 555-0108',
        },
        {
          'id': '10',
          'name': 'Nancy Anderson',
          'phoneNumber': '(555) 555-0109',
        },
      ],
    },
    {
      'id': '2',
      'name': 'Tom Rogan',
      'email': 'low.balance@gmail.com',
      'password': '123456',
      'balance': 140.30,
      'isVerified': false,
      'beneficiaries': [
        {
          'id': '6',
          'name': 'Linda Jones',
          'phoneNumber': '(555) 555-0105',
        },
        {
          'id': '7',
          'name': 'James Wilson',
          'phoneNumber': '(555) 555-0106',
        },
        {
          'id': '8',
          'name': 'Barbara Moore',
          'phoneNumber': '(555) 555-0107',
        },
        {
          'id': '9',
          'name': 'Paul Taylor',
          'phoneNumber': '(555) 555-0108',
        },
        {
          'id': '10',
          'name': 'Nancy Anderson',
          'phoneNumber': '(555) 555-0109',
        },
      ],
    },
  ];
}
