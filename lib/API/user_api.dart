import 'package:bareq/Models/user_model.dart';
import 'package:bareq/Shared/shared_obj.dart';
import 'package:bareq/Shared/shared_preferances.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/toast_helper.dart';
import 'package:bareq/models/user_study.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class UserApi
{
  static Future<bool> login({required String email,required String password,
    //required String role,
    required bool rememberMe})
  async
  {
    var response = await API.postRequest(
    url: API.login,
    headers: {
      "Accept":"application/json"
    },
    body: {
    "email" :email,
    "password":password,
    "provider":"users",
   // "role":role
    });

    if(response["success"] != null)
      {
        User user = User.fromJson(response["success"]);
        print("user birthdate = ${user.dateOfBirth}");
        if(rememberMe == true)
          {
            SharedPref.saveUserObj(user: user);
          }
        return true;
      }
    else
      {
        ToastHelper.showError(message: "login_fail".tr);
        return false;
      }
  }

  static Future<bool> logout(String token) async {
   var decodedData = await API.postRequest(
     url: API.logout,
     headers: {
       "Accept":"application/json",
       "Authorization":'Bearer $token'
     },
     body: {},
   );
    SharedPref.logOut();

    if(decodedData['success'] != null)
      {
        ToastHelper.showSuccess(message: "Logout Successfully");
        return true;
      }

    else
      {
        ToastHelper.showError(message: "Error in Logout");
        return false;
      }

  }

  static Future<bool> register({required String name,required String email,
    required String password, required String phone, required String birthDate,
    required String country})
  async
  {
    var response = await API.postRequest(
        url: API.register,
        headers: {
          "Accept":"application/json"
        },
        body: {
          "name" :name,
          "email":email,
          "password":password,
          "password_confirmation":password,
          "phone":phone,
          "birthdate":birthDate.isEmpty ? "" : birthDate,
          "time_zone": country.isEmpty ? "" : country,
        });

    if(response["success"] != null)
    {
      ToastHelper.showSuccess(message: "register_success".tr);
      return true;
    }
    else
    {
      ToastHelper.showError(message: response['error']);
      return false;
    }
  }


  static Future<bool> changePasssword({required String oldpassword,required String newPassword,
    required String confirmNewPassword, required String token,})
  async
  {
    var response = await API.postRequest(
        url: API.resetPassword,
        headers: {
          "Accept":"application/json",
          "Authorization":'Bearer $token'
        },
        body: {
          "old_password" :oldpassword,
          "password":newPassword,
          "password_confirmation":confirmNewPassword,
        });

    if(response["success"] != null)
    {
      ToastHelper.showSuccess(message: "password_changed".tr);
      return true;
    }
    else
    {
      ToastHelper.showError(message: "password_change_error".tr);
      return false;
    }
  }

  static Future<bool> forgetPasssword({required String email})
  async
  {
    var response = await API.postRequest(
        url: API.forgetPassword,
        headers: {
          "Accept":"application/json",
        },
        body: {
          "email" :email,
          "url":"https://bareq.me/changePasswordForm/student",
        });

    if(response["code"] == 200)
    {
      ToastHelper.showSuccess(message: response["success"]);
      return true;
    }
    else
    {
      //print("response error = ${}")
      ToastHelper.showError(message: response["message"]);
      return false;
    }
  }

  static Future<bool> updateUserData({required String name, required int id,required String email,
    required String phone,required String birthDate ,required String token,})
  async
  {
    var response = await API.postRequest(
        url: API.updateUserProfile,
        headers: {
          "Accept":"application/json",
          "Authorization":'Bearer $token'
        },
        body: {
          "id" : id.toString(),
          "name" :name,
          "email":email,
          "phone":phone,
          "birthdate":birthDate,
        });

    if(response["success"] != null)
    {
      SharedPref.logOut();
      ToastHelper.showSuccess(message: "profile_updated".tr);
      return true;
    }
    else
    {
      ToastHelper.showError(message: "profile_update_error".tr);
      return false;
    }
  }

  static Future<bool> updateUserLocation({required String timeZone ,required String token,})
  async
  {
    var response = await API.postRequest(
        url: API.updateUserLocation,
        headers: {
          "Accept":"application/json",
          "Authorization":'Bearer $token'
        },
        body: {
          "timezone" : timeZone,
        });

    if(response["success"] != null)
    {
      SharedPref.logOut();
      ToastHelper.showSuccess(message: "timezone_updated".tr);
      return true;
    }
    else
    {
      ToastHelper.showError(message: response["message"]);
      return false;
    }
  }

  static Future<bool> contactUs({required String name,required String email,
    required String subject,required String content})
  async
  {
    var response = await API.postRequest(
        url: API.contactUs,
        headers: {
          "Accept":"application/json",
        },
        body: {
          "name" :name,
          "email":email,
          "subject":subject,
          "content":content,
        });

    if(response["code"] == 200)
    {
      ToastHelper.showSuccess(message: "message_sent".tr);
      return true;
    }
    else
    {
      ToastHelper.showError(message: "message_not_sent".tr);
      return false;
    }
  }

  static Future<UserStudy> getUserStudy({required int userId , required String token})
  async
  {
    var response = await API.getRequest(
        url: API.userStudy(userId),
        headers: {
          "Accept":"application/json",
          "Authorization":'Bearer $token'
        });

    if(response["data"] != null)
    {
      return UserStudy.fromJson(response["data"]);
    }
    else
    {
      print("user data a7a");
      return UserStudy();
    }
  }
}