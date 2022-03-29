//
//  ViewController.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 24.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Elements
    
    private let settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var models: [Section] = Section.getSections()
    
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
        settingsTableView.register(CommonTableViewCell.self, forCellReuseIdentifier: CommonTableViewCell.identifier)
        settingsTableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        settingsTableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
    }
    
    
    // MARK: - DataSource and Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.identifier, for: indexPath) as? CommonTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .imageCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        case .imageCell(let model):
            model.handler()
        }
    }
}
