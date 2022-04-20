//
//  ViewController.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-19.
//

import FBSDKLoginKit

class ViewController: UIViewController {

    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: FBLoginButton!
    @IBOutlet var normalLoginButton: UIButton!
    
    //    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let token = AccessToken.current, !token.isExpired {
//
//            let token = token.tokenString
//
//            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
//            request.start { (connection, result, error) in
//                print("RESULT , \(result)")
//            }
//        } else {
//            loginButton.permissions = ["public_profile", "email"]
//            loginButton.delegate = self
//        }
        setUpUI()
    }
    
    func setUpUI() {
        setUpLoginButton()
        setUpTextFields()
    }
    
    func setUpTextFields() {
        emailTextField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        emailTextField.becomeFirstResponder()
    }
    
    func setUpLoginButton() {
//        loginButton.delegate = self
//        loginButton.permissions = ["public_profile", "email"]
//        loginButton.addTarget(self, action: #selector(navigateToHotelScreen(_ :)), for: .touchUpInside)
    }
    
    @IBAction func normalLoginAction(_ sender: Any) {
        print("normal login")
        if (emailTextField.text == "test@gmail.com" && passwordTextField.text == "password") {
            let controller = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            controller.name = "Lakith"
            controller.email = "test@gmail.com"
            navigationController?.pushViewController(controller, animated: true)
            emailTextField.text = ""
            passwordTextField.text = ""
            normalLoginButton.isEnabled = false
        } else {
            emailTextField.text = ""
            passwordTextField.text = ""
            normalLoginButton.isEnabled = false
            showAlert()
        }
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Invalid Email or Password", message: "Please try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Dismiss", style: .cancel) { action in
            print("tapped dismiss")
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    @objc private func validateFields() {
        normalLoginButton.isEnabled = emailTextField.text != "" && passwordTextField.text != ""
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        controller.name = "Lakith"
        controller.email = "test@gmail.com"
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ViewController: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//        let token = result?.token?.tokenString
//
//        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
//        request.start { (connection, result, error) in
//            print("RESULT , \(result)")
//        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//        print("Logout")
    }
    
}


