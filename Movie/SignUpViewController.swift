//
//  SignUpViewController.swift
//  Movie
//
//  Created by CHOI on 2022/07/07.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var infoSwitch: UISwitch!
    
    override func viewDidLoad() {
        
        emailTextField.placeholder = "이메일 주소 또는 전화번호"
        pwTextField.placeholder = "비밀번호"
        nicknameTextField.placeholder = "닉네임"
        locationTextField.placeholder = "위치"
        codeTextField.placeholder = "추천 코드 입력"
        
        changeTextField(textField: emailTextField)
        changeTextField(textField: pwTextField)
        changeTextField(textField: nicknameTextField)
        changeTextField(textField: locationTextField)
        changeTextField(textField: codeTextField)
        pwTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .emailAddress
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.setTitleColor(.yellow, for: .highlighted)
        
        
        infoSwitch.setOn(true, animated: true)
        infoSwitch.onTintColor = .red
        infoSwitch.thumbTintColor = .yellow
    }
    
    func changeTextField(textField: UITextField) {
        textField.backgroundColor = .lightGray
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
}
