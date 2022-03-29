//
//  CommonTableViewCell.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 29.03.2022.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    
    // MARK: - Elements
    
    static let identifier = "CommonTableViewCell"
    
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
    
    private let additionalLabel: UILabel = {
        let label = UILabel()
         label.textAlignment = .right
         label.textColor = .darkGray
         return label
     }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameSetting)
        contentView.addSubview(settingImageViewContainer)
        contentView.addSubview(additionalLabel)
        settingImageViewContainer.addSubview(settingImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        
        nameSetting.frame = CGRect(x: 25 + settingImageViewContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 25 - settingImageView.frame.size.width,
                             height: contentView.frame.size.height)
        
        additionalLabel.frame = CGRect(x: (contentView.frame.size.width - contentView.frame.size.width/1.9),
                             y: (contentView.frame.size.height / 10),
                             width: contentView.frame.size.width/2,
                             height: settingImageViewContainer.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        settingImageView.image = nil
        nameSetting.text = nil
        settingImageViewContainer.backgroundColor = nil
        additionalLabel.text = ""
    }
    
    // MARK: - Private functions
    
    public func configure(with model: SettingsOption) {
        nameSetting.text = model.title
        settingImageView.image = model.icon
        settingImageViewContainer.backgroundColor = model.iconBackgroundColor
        
        switch nameSetting.text {
        case "Wi-Fi":
            additionalLabel.text = "Не подключено"
        case "Bluetooth":
            additionalLabel.text = "Вкл."
        default:
            break
        }
    }
}
