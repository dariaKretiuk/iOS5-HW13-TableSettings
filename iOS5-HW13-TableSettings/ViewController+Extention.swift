//
//  ViewController+Extention.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 24.03.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    static let dataSettings = [[Settings(nameImage: "airplane", name: "Авиарежим", additionalInfo: "switch", backgroundColor: .orange),
                       Settings(nameImage: "wifi", name: "Wi-Fi", additionalInfo: "label:WiFi", backgroundColor: .blue),
                       Settings(nameImage: "wave.3.right", name: "Bluetooth", additionalInfo: "label:Вкл.", backgroundColor: .blue),
                       Settings(nameImage: "antenna.radiowaves.left.and.right", name: "Сотовая связь", additionalInfo: nil, backgroundColor: .green),
                       Settings(nameImage: "personalhotspot", name: "Режим модема", additionalInfo: nil, backgroundColor: .green),
//                       Settings(nameImage: "", name: "VPN", additionalInfo: "label", backgroundColor: .blue)
                                ],
                       [Settings(nameImage: "bell.badge.fill", name: "Уведомления", additionalInfo: nil, backgroundColor: .red),
                       Settings(nameImage: "speaker.wave.3.fill", name: "Звуки и тактильные сигналы", additionalInfo: nil, backgroundColor: .systemPink),
                       Settings(nameImage: "moon.fill", name: "Фокусирование", additionalInfo: nil, backgroundColor: .purple),
                       Settings(nameImage: "hourglass", name: "Экранное время", additionalInfo: nil, backgroundColor: .purple)
                        ],
                       [Settings(nameImage: "gear", name: "Основное", additionalInfo: "image:1.circle.fill", backgroundColor: .gray),
                       Settings(nameImage: "switch.2", name: "Пункт управления", additionalInfo: nil, backgroundColor: .gray),
                       Settings(nameImage: "textformat.size", name: "Экран и яркость", additionalInfo: nil, backgroundColor: .blue),
                       Settings(nameImage: "figure.walk.circle", name: "Универсальный доступ", additionalInfo: nil, backgroundColor: .blue)
                        ]
    ]
    
    static func createTable() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        return tableView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ViewController.dataSettings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.dataSettings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        cell.nameSetting.text = ViewController.dataSettings[indexPath.section][indexPath.row].name
        cell.settingImageView.image = UIImage(systemName: ViewController.dataSettings[indexPath.section][indexPath.row].nameImage)
        cell.settingImageView.backgroundColor = ViewController.dataSettings[indexPath.section][indexPath.row].backgroundColor
        
        if let additionalInfo = ViewController.dataSettings[indexPath.section][indexPath.row].additionalInfo {
            let additionalInfoSplit = additionalInfo.components(separatedBy: ":")
            switch additionalInfoSplit[0] {
            case "label":
                let label = UILabel()
                label.text = additionalInfoSplit[1]
                label.font = UIFont.systemFont(ofSize: 20)
                label.textColor = .darkGray
                label.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(label)
                NSLayoutConstraint.activate([
                    label.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
                    label.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -40)
                ])
            case "image":
                let img = UIImageView()
                img.image = UIImage(systemName: additionalInfoSplit[1])
                img.contentMode = .scaleAspectFit
                img.tintColor = .red
                img.translatesAutoresizingMaskIntoConstraints = false
                img.clipsToBounds = true
                cell.addSubview(img)
                NSLayoutConstraint.activate([
                    img.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
                    img.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -40),
                    img.widthAnchor.constraint(equalToConstant:30),
                    img.heightAnchor.constraint(equalToConstant:30)
                ])
            case "switch":
                let switchView = UISwitch()
//                switchView.setOn(false, animated: true)
                cell.addSubview(switchView)
                NSLayoutConstraint.activate([
                    switchView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10),
                    switchView.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: -40)
                ])
            default:
                ""
            }
        }
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    
}
