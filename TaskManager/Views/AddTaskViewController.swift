//
//  AddTaskViewController.swift
//  TaskManager
//
//  Created by Sudeepa Pal on 10/06/24.
//

import UIKit
import RealmSwift

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    
    
    let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    let addTaskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add Task"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 35
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        addTaskTextField.delegate = self
        setupUI()
    }
    
    // MARK: - Navigation

    private func setupUI() {
        view.addSubview(addTaskTextField)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            addTaskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            addTaskTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           // addTaskTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addTaskTextField.heightAnchor.constraint(equalToConstant: 40),
            
            submitButton.topAnchor.constraint(equalTo: addTaskTextField.bottomAnchor, constant: 40),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    
    
    @objc private func submitButtonTapped() {
        // Handle submit button tapped event
        
        
        // Check if any field is empty
            if addTaskTextField.text?.isEmpty ?? true {
                displayWarning(message: "Please enter a task")
                return
            }
            
           
        
        print("This is user Account Name->",addTaskTextField.text!)
        
        
        // Create :-
        let task = Task()
        task.taskList = addTaskTextField.text!
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(task)
            }
        } catch {
            print("Error Inilization new realm, \(error)")
        }
        
        completionHandler?()
        
        addTaskTextField.text = ""
        dismiss(animated: true, completion: nil)
        // tableView.reloadData()
    }
    
    private func displayWarning(message: String){
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.view.tintColor = .red
        present(alert, animated: true, completion: nil)
    }
}
