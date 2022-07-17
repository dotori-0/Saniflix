//
//  SignUpViewController.swift
//  Saniflix
//
//  Created by SC on 2022/07/07.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var referralCodeTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var moreInfoSwitch: UISwitch!

    let textFieldGray = UIColor(named: "TextFieldGray")
    let saniflixRed = UIColor(named: "SaniflixRed")

    let placeholderArray = ["이메일", "비밀번호", "닉네임", "위치", "추천 코드 입력"]

//    let signUpButtonTitle = NSMutableAttributedString(string: "회원가입", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])


    override func viewDidLoad() {
        super.viewDidLoad()

        // Create TextField Array
        let textFieldArray = [emailTextField, passwordTextField, nicknameTextField, locationTextField, referralCodeTextField]

        // Set TextFields Appearances
        designTextField(textFieldArray)

        // Set TextFields keyboardType
        emailTextField.keyboardType = .emailAddress
        referralCodeTextField.keyboardType = .numberPad

        passwordTextField.isSecureTextEntry = true

        // Set Sign Up Button
        signUpButton.backgroundColor = .white
        signUpButton.frame.size.height = 40
        signUpButton.layer.cornerRadius = 5
        signUpButton.setTitle("회원가입", for: .normal)
//        signUpButton.setTitle(String(signUpButtonTitle.string, for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

//        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)

//        @available(iOS 15.0, *)
//        signUpButton.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
//                        var outgoing = incoming
//                        outgoing.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//                        return outgoing
//                    }

        // Set moreInfoSwitch
        moreInfoSwitch.onTintColor = saniflixRed
        moreInfoSwitch.isOn = false
//        moreInfoSwitch.setOn(false, animated: true)

    }



    // MARK: - function


    func designTextField(_ textFieldArray: [UITextField?]) {
        for i in 0..<textFieldArray.count {
            textFieldArray[i]?.layer.cornerRadius = 5
            textFieldArray[i]?.backgroundColor = textFieldGray
            textFieldArray[i]?.borderStyle = .none
            textFieldArray[i]?.textAlignment = .center
            textFieldArray[i]?.textColor = .white
            textFieldArray[i]?.attributedPlaceholder = NSAttributedString(
                string: placeholderArray[i],
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        }
    }


    func isValidEmail(userInputEmail: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        print("유저가 입력한 이메일: \(emailTextField.text)")

        return emailTest.evaluate(with: userInputEmail)
    }


    func isValidPassword(_ userInputPassword: String?) -> Bool {
        if userInputPassword!.count < 6 {
            return false
//        } else if userInputPassword!.count >= 6 {
        } else {
            return true
        }
    }


    func isValidReferralCode(_ userInputReferralCode: String?) -> Bool {
        if userInputReferralCode!.isEmpty {

        } else if Int(userInputReferralCode!) == nil {
            return false
        }

        return true
    }


    func customAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))

        present(alert, animated: true)  // completion의 기본값이 nil
//        present(alert, animated: true, completion: nil)
    }



    // MARK: - Action


    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }


    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        print("passwordTextField.text: \(passwordTextField.text)")

        if !isValidEmail(userInputEmail: emailTextField.text) || !isValidPassword(passwordTextField.text) {
            customAlert(title: "오류 안내", message: "이메일과 비밀번호를 확인해 주세요.\n비밀번호는 최소 6자리 이상이어야 합니다.")
        }   else if !isValidReferralCode(referralCodeTextField.text) {
            customAlert(title: "오류 안내", message: "추천코드는 숫자만 입력 가능합니다.")
        }   else {
            customAlert(title: "회원가입 완료", message: "회원가입이 완료되었습니다.")
        }

        let optionalString: String? = nil
        print("optionalString: \(optionalString)")

        passwordTextField.text = nil
        print("passwordTextField.text: \(passwordTextField.text)")
    }


    @IBAction func signUpCompleteButtonClicked(_ sender: UIButton) {

    }

}
