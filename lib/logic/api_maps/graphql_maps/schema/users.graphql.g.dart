// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fragment$basicMutationReturnFields _$Fragment$basicMutationReturnFieldsFromJson(
        Map<String, dynamic> json) =>
    Fragment$basicMutationReturnFields(
      code: json['code'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$basicMutationReturnFieldsToJson(
        Fragment$basicMutationReturnFields instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      '__typename': instance.$__typename,
    };

Fragment$userFields _$Fragment$userFieldsFromJson(Map<String, dynamic> json) =>
    Fragment$userFields(
      username: json['username'] as String,
      userType: $enumDecode(_$Enum$UserTypeEnumMap, json['userType'],
          unknownValue: Enum$UserType.$unknown),
      sshKeys:
          (json['sshKeys'] as List<dynamic>).map((e) => e as String).toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$userFieldsToJson(
        Fragment$userFields instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userType': _$Enum$UserTypeEnumMap[instance.userType]!,
      'sshKeys': instance.sshKeys,
      '__typename': instance.$__typename,
    };

const _$Enum$UserTypeEnumMap = {
  Enum$UserType.NORMAL: 'NORMAL',
  Enum$UserType.PRIMARY: 'PRIMARY',
  Enum$UserType.ROOT: 'ROOT',
  Enum$UserType.$unknown: r'$unknown',
};

Query$AllUsers _$Query$AllUsersFromJson(Map<String, dynamic> json) =>
    Query$AllUsers(
      users:
          Query$AllUsers$users.fromJson(json['users'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$AllUsersToJson(Query$AllUsers instance) =>
    <String, dynamic>{
      'users': instance.users.toJson(),
      '__typename': instance.$__typename,
    };

Query$AllUsers$users _$Query$AllUsers$usersFromJson(
        Map<String, dynamic> json) =>
    Query$AllUsers$users(
      allUsers: (json['allUsers'] as List<dynamic>)
          .map((e) => Fragment$userFields.fromJson(e as Map<String, dynamic>))
          .toList(),
      rootUser: json['rootUser'] == null
          ? null
          : Fragment$userFields.fromJson(
              json['rootUser'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$AllUsers$usersToJson(
        Query$AllUsers$users instance) =>
    <String, dynamic>{
      'allUsers': instance.allUsers.map((e) => e.toJson()).toList(),
      'rootUser': instance.rootUser?.toJson(),
      '__typename': instance.$__typename,
    };

Variables$Query$GetUser _$Variables$Query$GetUserFromJson(
        Map<String, dynamic> json) =>
    Variables$Query$GetUser(
      username: json['username'] as String,
    );

Map<String, dynamic> _$Variables$Query$GetUserToJson(
        Variables$Query$GetUser instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

Query$GetUser _$Query$GetUserFromJson(Map<String, dynamic> json) =>
    Query$GetUser(
      users:
          Query$GetUser$users.fromJson(json['users'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$GetUserToJson(Query$GetUser instance) =>
    <String, dynamic>{
      'users': instance.users.toJson(),
      '__typename': instance.$__typename,
    };

Query$GetUser$users _$Query$GetUser$usersFromJson(Map<String, dynamic> json) =>
    Query$GetUser$users(
      getUser: json['getUser'] == null
          ? null
          : Fragment$userFields.fromJson(
              json['getUser'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$GetUser$usersToJson(
        Query$GetUser$users instance) =>
    <String, dynamic>{
      'getUser': instance.getUser?.toJson(),
      '__typename': instance.$__typename,
    };

Variables$Mutation$CreateUser _$Variables$Mutation$CreateUserFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$CreateUser(
      user: Input$UserMutationInput.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Variables$Mutation$CreateUserToJson(
        Variables$Mutation$CreateUser instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
    };

Mutation$CreateUser _$Mutation$CreateUserFromJson(Map<String, dynamic> json) =>
    Mutation$CreateUser(
      createUser: Mutation$CreateUser$createUser.fromJson(
          json['createUser'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$CreateUserToJson(
        Mutation$CreateUser instance) =>
    <String, dynamic>{
      'createUser': instance.createUser.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$CreateUser$createUser _$Mutation$CreateUser$createUserFromJson(
        Map<String, dynamic> json) =>
    Mutation$CreateUser$createUser(
      code: json['code'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      $__typename: json['__typename'] as String,
      user: json['user'] == null
          ? null
          : Fragment$userFields.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Mutation$CreateUser$createUserToJson(
        Mutation$CreateUser$createUser instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      '__typename': instance.$__typename,
      'user': instance.user?.toJson(),
    };

Variables$Mutation$DeleteUser _$Variables$Mutation$DeleteUserFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$DeleteUser(
      username: json['username'] as String,
    );

Map<String, dynamic> _$Variables$Mutation$DeleteUserToJson(
        Variables$Mutation$DeleteUser instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

Mutation$DeleteUser _$Mutation$DeleteUserFromJson(Map<String, dynamic> json) =>
    Mutation$DeleteUser(
      deleteUser: Mutation$DeleteUser$deleteUser.fromJson(
          json['deleteUser'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$DeleteUserToJson(
        Mutation$DeleteUser instance) =>
    <String, dynamic>{
      'deleteUser': instance.deleteUser.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$DeleteUser$deleteUser _$Mutation$DeleteUser$deleteUserFromJson(
        Map<String, dynamic> json) =>
    Mutation$DeleteUser$deleteUser(
      code: json['code'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$DeleteUser$deleteUserToJson(
        Mutation$DeleteUser$deleteUser instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      '__typename': instance.$__typename,
    };

Variables$Mutation$UpdateUser _$Variables$Mutation$UpdateUserFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$UpdateUser(
      user: Input$UserMutationInput.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Variables$Mutation$UpdateUserToJson(
        Variables$Mutation$UpdateUser instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
    };

Mutation$UpdateUser _$Mutation$UpdateUserFromJson(Map<String, dynamic> json) =>
    Mutation$UpdateUser(
      updateUser: Mutation$UpdateUser$updateUser.fromJson(
          json['updateUser'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$UpdateUserToJson(
        Mutation$UpdateUser instance) =>
    <String, dynamic>{
      'updateUser': instance.updateUser.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$UpdateUser$updateUser _$Mutation$UpdateUser$updateUserFromJson(
        Map<String, dynamic> json) =>
    Mutation$UpdateUser$updateUser(
      code: json['code'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      $__typename: json['__typename'] as String,
      user: json['user'] == null
          ? null
          : Fragment$userFields.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Mutation$UpdateUser$updateUserToJson(
        Mutation$UpdateUser$updateUser instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      '__typename': instance.$__typename,
      'user': instance.user?.toJson(),
    };

Variables$Mutation$AddSshKey _$Variables$Mutation$AddSshKeyFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$AddSshKey(
      sshInput: Input$SshMutationInput.fromJson(
          json['sshInput'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Variables$Mutation$AddSshKeyToJson(
        Variables$Mutation$AddSshKey instance) =>
    <String, dynamic>{
      'sshInput': instance.sshInput.toJson(),
    };

Mutation$AddSshKey _$Mutation$AddSshKeyFromJson(Map<String, dynamic> json) =>
    Mutation$AddSshKey(
      addSshKey: Mutation$AddSshKey$addSshKey.fromJson(
          json['addSshKey'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$AddSshKeyToJson(Mutation$AddSshKey instance) =>
    <String, dynamic>{
      'addSshKey': instance.addSshKey.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$AddSshKey$addSshKey _$Mutation$AddSshKey$addSshKeyFromJson(
        Map<String, dynamic> json) =>
    Mutation$AddSshKey$addSshKey(
      code: json['code'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      $__typename: json['__typename'] as String,
      user: json['user'] == null
          ? null
          : Fragment$userFields.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Mutation$AddSshKey$addSshKeyToJson(
        Mutation$AddSshKey$addSshKey instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      '__typename': instance.$__typename,
      'user': instance.user?.toJson(),
    };

Variables$Mutation$RemoveSshKey _$Variables$Mutation$RemoveSshKeyFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$RemoveSshKey(
      sshInput: Input$SshMutationInput.fromJson(
          json['sshInput'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Variables$Mutation$RemoveSshKeyToJson(
        Variables$Mutation$RemoveSshKey instance) =>
    <String, dynamic>{
      'sshInput': instance.sshInput.toJson(),
    };

Mutation$RemoveSshKey _$Mutation$RemoveSshKeyFromJson(
        Map<String, dynamic> json) =>
    Mutation$RemoveSshKey(
      removeSshKey: Mutation$RemoveSshKey$removeSshKey.fromJson(
          json['removeSshKey'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$RemoveSshKeyToJson(
        Mutation$RemoveSshKey instance) =>
    <String, dynamic>{
      'removeSshKey': instance.removeSshKey.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$RemoveSshKey$removeSshKey _$Mutation$RemoveSshKey$removeSshKeyFromJson(
        Map<String, dynamic> json) =>
    Mutation$RemoveSshKey$removeSshKey(
      code: json['code'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      $__typename: json['__typename'] as String,
      user: json['user'] == null
          ? null
          : Fragment$userFields.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Mutation$RemoveSshKey$removeSshKeyToJson(
        Mutation$RemoveSshKey$removeSshKey instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      '__typename': instance.$__typename,
      'user': instance.user?.toJson(),
    };
