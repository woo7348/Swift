//
//  AppDelegate.swift
//  LoginExample
//
//  Created by 강민우 on 2023/02/27.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import AuthenticationServices


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()


      
    return true
  }
}
