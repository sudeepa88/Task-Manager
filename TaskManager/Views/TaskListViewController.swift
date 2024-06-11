//
//  TaskListViewController.swift
//  TaskManager
//
//  Created by Sudeepa Pal on 10/06/24.
//

import UIKit
import SwipeCellKit
import RealmSwift

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate  {

    //var patients: [String] = ["Sudeepa", "Google","Netflix", "Swiggy" ]
    
    private var task = [Task]()
    let realm = try! Realm()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(addUserButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        task = realm.objects(Task.self).map({$0})
        
        tableView.dataSource = self
        tableView.delegate = self
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TaskListViewTVC.self, forCellReuseIdentifier: "cell")
        //tableView.separatorStyle = .none
        view.addSubview(tableView)
        view.addSubview(addButton)
        setupTableView()
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -67),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    @objc private func addUserButtonTapped() {
        //tableView.reloadData()
        let userDetailsViewController = AddTaskViewController()
        userDetailsViewController.completionHandler = {
            [weak self] in
            self?.refresh()
        }
        navigationController?.pushViewController(userDetailsViewController, animated: true)
       // tableView.reloadData()
    }
    
    func refresh(){
        task = realm.objects(Task.self).map({$0})
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //print("Here is numberOfRowsInSection ->", people.count)
        return task.count
        //return humanBeings.count
        
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskListViewTVC
        
        //cell.textLabel?.text = people[indexPath.row].accountName
        cell.nameLabel.text = task[indexPath.row].taskList
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
        
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { [self] action, indexPath in
            // handle action by updating model with deletion
            //print("item deleted")
            
            let item = self.task[indexPath.row]
            print(item)
            do {
                try self.realm.write {
                    realm.delete(item)
                }
            } catch {
                print("error saving data", error)
            }
            
            self.refresh()
            
        }

        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive(automaticallyDelete: false)
        return options
    }
    
}
