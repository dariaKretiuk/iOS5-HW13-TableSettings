//
//  SettingsSectionsTableView.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 29.03.2022.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case imageCell(model: SettingsImageOption)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingsImageOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let additionImage: UIImage?
    let handler: (() -> Void)
}

extension Section {
    static func getSections() -> [Section] {
        return [
            Section(title: "", options: [
                .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, isOn: false) {
                    print("Нажата ячейка Авиарежим")
                }),
                .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Wi-Fi")
                }),
                .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth.white.2"), iconBackgroundColor: .systemBlue, handler: {
                    print("Нажата ячейка Bluetooth")
                })),
                .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Сотовая связь")
                }),
                .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Режим модема")
                }),
                .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named: "vpn.white"), iconBackgroundColor: .systemBlue, isOn: false) {
                    print("Нажата ячейка VPN")
                })
            ]),
                
            Section(title: "", options: [
                .staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemRed) {
                    print("Нажата ячейка Уведомления")
                }),
                .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "volume.3.fill"), iconBackgroundColor: .systemPink) {
                    print("Нажата ячейка Звуки, тактильные сигналы")
                }),
                .staticCell(model: SettingsOption(title: "Фокусирование", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemPurple) {
                    print("Нажата ячейка Не беспокоить")
                }),
                .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple) {
                    print("Нажата ячейка Экранное время")
                })
            ]),
            
            Section(title: "", options: [
                .imageCell(model: SettingsImageOption(title: "Основное", icon: UIImage(systemName: "gear"), iconBackgroundColor: .gray, additionImage: UIImage(systemName: "1.circle.fill")) {
                    print("Нажата ячейка Основное")
                }),
                .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray) {
                    print("Нажата ячейка Пункт управления")
                }),
                .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Экран и яркость")
                }),
                .staticCell(model: SettingsOption(title: "Экран \"Домой\"", icon: UIImage(systemName: "square.grid.3x3"), iconBackgroundColor: .purple) {
                    print("Нажата ячейка Экран \"Домой\"")
                }),
                .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "figure.walk.circle"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Универсальный доступ")
                })
            ])
        ]
    }
}
