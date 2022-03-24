//
//  ViewController.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Elements
    private let settingsTableView: UITableView = {
        createTable()
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayouts()
        setupTable()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            settingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTable() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "settingsCell")
    }
    
    // MARK: - Actions
    
    
}

