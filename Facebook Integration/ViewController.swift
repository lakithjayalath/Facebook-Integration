//
//  ViewController.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-19.
//

import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {

    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let token = AccessToken.current, !token.isExpired {
//
//            let token = token.tokenString
//
//            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
//
//            request.start { connection, result, error in
//                print(result!)
//            }
//
//        } else {
//            setUpUI()
//        }
        setUpUI()
    }
    
    func setUpUI() {
        setUpLoginButton()
    }
    
    func setUpLoginButton() {
//        loginButton.delegate = self
//        loginButton.permissions = ["public_profile", "email"]
//        loginButton.addTarget(self, action: #selector(navigateToHotelScreen(_ :)), for: .touchUpInside)
    }
    
    @IBAction func loginAction(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
//        present(controller, animated: true, completion: nil)
    }
//    @objc func navigateToHotelScreen(_ sender: UIButton) {
//        print("HOTELS")
//    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
        
        request.start { connection, result, error in
            print(result!)
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
}



