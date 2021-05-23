//
//  SceneDelegate.swift
//  URLreboot
//
//  Created by william Vise on 23/5/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        if let url = connectionOptions.urlContexts.first?.url {
                    handleURL(url: url)
                }
        
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
            // Get the first URL out of the URLContexts set. If it does not exist, abort handling the passed URLs and exit this method.
            guard let url = URLContexts.first?.url else {
                return NSLog("No URL passed to open the app")
            }
            print(url)
            handleURL(url: url)
        }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    // celsiusapp://hostpart/my/path/?name=celsius&color=blue
    func handleURL(url: URL) {

          // A host, a path and query params are expected, else the URL will not be handled.
          guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host,
              let _ = components.path,
              let params = components.queryItems else {
                  NSLog("Invalid URL. Host, path and query params are expected")
                  return
          }
          
          NSLog("host: \(host)")
          
          for (index, pathComponent) in url.pathComponents.enumerated() {
              NSLog("pathComponent \(index): \(pathComponent)")
          }
          
          for query in params {
              if let value = query.value {
                  NSLog("Query param \(query.name): \(value)")
                  continue
              }
            
              NSLog("Query param \(query.name) has no value")
          }
      }

}

