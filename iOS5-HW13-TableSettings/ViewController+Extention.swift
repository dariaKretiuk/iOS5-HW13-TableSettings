//
//  ViewController+Extention.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 24.03.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    static let dataSettings = [Settings(nameImage: "airplane", name: "Авиарежим", additionalInfo: "label"),
                       Settings(nameImage: "wifi", name: "Wi-Fi", additionalInfo: "label"),
                       Settings(nameImage: "wave.3.right", name: "Bluetooth", additionalInfo: "label"),
                       Settings(nameImage: "antenna.radiowaves.left.and.right", name: "Сотовая связь", additionalInfo: nil),
                       Settings(nameImage: "personalhotspot", name: "Режим модема", additionalInfo: nil),
//                       Settings(nameImage: "", name: "VPN", additionalInfo: "label"),
                       Settings(nameImage: "bell.badge.fill", name: "Уведомления", additionalInfo: nil),
                       Settings(nameImage: "speaker.wave.3.fill", name: "Звуки и тактильные сигналы", additionalInfo: nil),
                       Settings(nameImage: "moon.fill", name: "Фокусирование", additionalInfo: nil),
                       Settings(nameImage: "hourglass", name: "Экранное время", additionalInfo: nil),
                       Settings(nameImage: "gear", name: "Основное", additionalInfo: "image:name"),
                       Settings(nameImage: "switch.2", name: "Пункт управления", additionalInfo: nil),
                       Settings(nameImage: "textformat.size", name: "Экран и яркость", additionalInfo: nil),
                       Settings(nameImage: "figure.walk.circle", name: "Универсальный доступ", additionalInfo: nil)]
    
    static func createTable() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        return tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.dataSettings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        
        cell.nameSetting.text = ViewController.dataSettings[indexPath.row].name
        cell.settingImageView.image = UIImage(systemName: ViewController.dataSettings[indexPath.row].nameImage)

        return cell
    }
    
}
