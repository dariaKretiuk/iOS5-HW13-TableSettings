//
//  SettingsTableViewCell.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 24.03.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    let settingImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .center
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.tintColor = .white
        return img
    }()
    
    var nameSetting:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // блоки, которые будут входить в этот контейнер, не будут выходить за его границы
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(settingImageView)
        containerView.addSubview(nameSetting)
        self.contentView.addSubview(containerView)
        
        settingImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        settingImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        settingImageView.widthAnchor.constraint(equalToConstant:35).isActive = true
        settingImageView.heightAnchor.constraint(equalToConstant:35).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.settingImageView.trailingAnchor, constant:15).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
//        nameSetting.centerYAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        nameSetting.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant: 8).isActive = true
        nameSetting.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameSetting.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
