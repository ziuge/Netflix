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
    
    @IBOutlet weak var saveIdBtn: UIButton!
    @IBOutlet weak var savePwBtn: UIButton!
    
    override func viewDidLoad() {
        changeTextField(emailTextField, buttonPH: "이메일 주소 또는 전화번호")
        changeTextField(pwTextField, buttonPH: "비밀번호")
        changeTextField(nicknameTextField, buttonPH: "닉네임")
        changeTextField(locationTextField, buttonPH: "위치")
        changeTextField(codeTextField,buttonPH: "추천 코드 입력")
        pwTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .emailAddress
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.setTitleColor(.yellow, for: .highlighted)
        
        infoSwitch.setOn(true, animated: true)
        infoSwitch.onTintColor = .red
        infoSwitch.thumbTintColor = .yellow
        
        if UserDefaults.standard.string(forKey: "email") != nil {
            emailTextField.text = UserDefaults.standard.string(forKey: "email")
            saveIdBtn.isSelected = true
        } else {
            emailTextField.text = nil
        }
        
        if UserDefaults.standard.string(forKey: "password") != nil {
            pwTextField.text = UserDefaults.standard.string(forKey: "password")
            savePwBtn.isSelected = true
        } else {
            pwTextField.text = nil
        }
    }
    
    // TextField UI
    func changeTextField(_ textField: UITextField, buttonPH: String) {
        textField.backgroundColor = .lightGray
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = buttonPH
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        view.endEditing(true)
        
        // 회원가입 성공 여부 판별 코드
        var signUpSuccess = false
        
        if emailTextField.text?.isEmpty == true {
            showAlertController(title: "", message: "이메일을 입력하세요")
        } else if pwTextField.text?.isEmpty == true {
            showAlertController(title: "", message: "비밀번호를 입력하세요")
        } else if pwTextField.text!.count < 6 {
            showAlertController(title: "", message: "비밀번호는 6자리 이상 작성해주세요")
        } else if codeTextField.text?.allSatisfy({ $0.isNumber }) != true {
            showAlertController(title: "", message: "추천코드는 숫자만 입력 가능해요")
        } else {
            signUpSuccess = true
            print("회원가입 완료!")
        }
        
    }
    
    func showAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveIdBtnClicked(_ sender: Any) {
        if saveIdBtn.isSelected {
            saveIdBtn.isSelected = false
        } else {
            saveIdBtn.isSelected = true
        }
        
        UserDefaults.standard.set(emailTextField.text, forKey: "email")
        
    }
    
    @IBAction func savePwBtnClicked(_ sender: Any) {
        if savePwBtn.isSelected {
            savePwBtn.isSelected = false
        } else {
            savePwBtn.isSelected = true
        }
        
        UserDefaults.standard.set(pwTextField.text, forKey: "password")
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
}
