//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 18/04/22.
//

import UIKit

protocol RegisterScreenProtocols: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocols?
    
    func delegate(delegate: RegisterScreenProtocols?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFit
        return image
    } ()
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu e-mail:"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Registre sua senha:"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    lazy var registerButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Cadastrar", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        bt.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        bt.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return bt
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBacground()
        self.configSuperView()
        //------------------
        self.configImageAddUserConstraints()
        self.configBackButtonConstraints()
        self.configEmailTextFieldConstraints()
        self.configPasswordTextFieldConstraints()
        self.configRegisterButtonConstraints()
        //--------------------
        self.setupConstraints()
        self.configButtonEnable(false)
    }
    
    private func configSuperView() {
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    
    private func configBacground() {
        self.backgroundColor = UIColor(red: 24/255, green: 177/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        
        self.delegate?.actionRegisterButton()
    }
    public func validaTextFields() {
        
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool) { // botão habilitado ou não
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else{
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
//            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
//            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
        
//            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
//            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
//            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 40),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.registerButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])
    }
    
    func configImageAddUserConstraints() {
        self.imageAddUser.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }

    func configBackButtonConstraints() {
        self.backButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageAddUser.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
    }

    func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageAddUser.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
}

