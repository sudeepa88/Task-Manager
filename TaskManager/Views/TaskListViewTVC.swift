//
//  TaskListViewTVC.swift
//  TaskManager
//
//  Created by Sudeepa Pal on 10/06/24.
//

import UIKit
import SwipeCellKit

class TaskListViewTVC: SwipeTableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupUI() {
        // Add subviews
        addSubview(nameLabel)
//        containerView.addSubview(nameLabel)
//        containerView.addSubview(emailLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
//            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
//            emailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
//            emailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
//            emailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    
}
