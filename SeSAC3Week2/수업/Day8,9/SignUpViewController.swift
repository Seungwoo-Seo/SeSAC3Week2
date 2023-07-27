//
//  SignUpViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/26.
//

import UIKit

enum TextFieldType: Int {
    case id = 100
    case email = 200
    case password = 300

    var rawValue: Int {
        switch self {
        case .id: return 8
        case .email: return 9
        case .password: return 10
        }
    }

    var key: String {
        switch self {
        case .id: return "id"
        case .email: return "email"
        case .password: return "password"
        }
    }

}

final class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        idTextField.tag = TextFieldType.id.rawValue
        emailTextField.tag = TextFieldType.email.rawValue
        passwordTextField.tag = TextFieldType.password.rawValue
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getTextFieldsText()
    }


    @IBAction func textFieldKeyboardTapped(
        _ sender: UITextField
    ) {
        guard let text = sender.text,
              let textField = TextFieldType(
                rawValue: sender.tag
              )
        else {
            print("오류가 발생함")
            return
        }

        switch textField {
        case .id: print("아이디는 \(text) 입니다.")
        case .email: print("이메일은 \(text) 입니다.")
        case .password: print("비밀번호는 \(text) 입니다.")
        }
    }

    @IBAction func didTapSaveButton(_ sender: UIButton) {
        UserDefaults.standard.set(
            idTextField.text!,
            forKey: "\(TextFieldType.id.key)"
        )

        UserDefaults.standard.set(
            emailTextField.text!,
            forKey: "\(TextFieldType.email.key)"
        )

        UserDefaults.standard.set(
            passwordTextField.text!,
            forKey: "\(TextFieldType.password.key)"
        )

        UserDefaults.standard.set(3, forKey: "count")
    }

}

extension SignUpViewController {

    func getTextFieldsText() {
        let id = UserDefaults.standard.string(
            forKey: TextFieldType.id.key
        )
        let email = UserDefaults.standard.string(
            forKey: TextFieldType.email.key
        )
        let password = UserDefaults.standard.string(
            forKey: TextFieldType.password.key
        )

        if let id {
            idTextField.text = id
        }

        if let email {
            emailTextField.text = email
        }

        if let password {
            passwordTextField.text = password
        }

    }

}
