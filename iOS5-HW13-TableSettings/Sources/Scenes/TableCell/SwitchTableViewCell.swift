//
//  SwitchTableViewCell.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 29.03.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    // MARK: - Elements
    
    static let identifier = "SwitchTableViewCell"
    
    private let settingImageViewContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let settingImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .center
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = .white
        return img
    }()
    
    private let nameSetting: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let additionalSwitch: UISwitch = {
        let mySwitch = UISwitch()
        return mySwitch
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameSetting)
        contentView.addSubview(settingImageViewContainer)
        contentView.addSubview(additionalSwitch)
        settingImageViewContainer.addSubview(settingImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.height - 12
        settingImageViewContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.2
        settingImageView.frame = CGRect(x: (size-imageSize)/2,
                                     y: (size-imageSize)/2,
                                     width: imageSize,
                                     height: imageSize)
        
        additionalSwitch.sizeToFit()
        additionalSwitch.frame = CGRect(x: (contentView.frame.size.width - additionalSwitch.frame.size.width)-20,
                                y: (contentView.frame.size.height - additionalSwitch.frame.size.height)/2,
                                width: additionalSwitch.frame.size.width,
                                height: additionalSwitch.frame.size.height)
        
        nameSetting.frame = CGRect(x: 25 + settingImageViewContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 25 - settingImageViewContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        settingImageView.image = nil
        nameSetting.text = nil
        settingImageViewContainer.backgroundColor = nil
        additionalSwitch.isOn = false
    }
    
    // MARK: - Private functions
    
    public func configure(with model: SettingsSwitchOption) {
        nameSetting.text = model.title
        settingImageView.image = model.icon
        settingImageViewContainer.backgroundColor = model.iconBackgroundColor
        additionalSwitch.isOn = model.isOn
    }
}

