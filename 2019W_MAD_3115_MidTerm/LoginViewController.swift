//
//  ViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var studentId: UITextField!
    @IBOutlet weak var studentPassword: UITextField!
    @IBOutlet weak var rememberMe: UISwitch!
    
    let tempStudentId : String = "admin"
    let tempStudentPassword : String = "admin@123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        if let id = userDefault.string(forKey: "studentId") {
            studentId.text = id
        }
        if let psw = userDefault.string(forKey: "password") {
            studentPassword.text = psw
            rememberMe.isOn = true
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if (studentId.text == tempStudentId && studentPassword.text == tempStudentPassword) {
            let userDefault = UserDefaults.standard
            if (rememberMe.isOn) {
                userDefault.set(tempStudentId, forKey: "studentId")
                userDefault.set(tempStudentPassword, forKey: "password")
            } else {
                userDefault.removeObject(forKey: "studentId")
                userDefault.removeObject(forKey: "password")
            }
            print("Logged In")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainNC = sb.instantiateViewController(withIdentifier: "mainNC") as! MainNavigationController
            present(mainNC,animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Student ID or Password Wrong!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

