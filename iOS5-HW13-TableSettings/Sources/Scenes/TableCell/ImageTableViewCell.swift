//
//  ImageTableViewCell.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 29.03.2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    // MARK: - Elements
    
    static let identifier = "ImageTableViewCell"
    
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
    
    private let additionalImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = .red
        return img
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameSetting)
        contentView.addSubview(settingImageViewContainer)
        contentView.addSubview(additionalImage)
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
        
        additionalImage.sizeToFit()
        additionalImage.frame = CGRect(x: (contentView.frame.size.width - additionalImage.frame.size.width)-20,
                                     y: (contentView.frame.size.height - additionalImage.frame.size.height)/2 - 5,
                                     width: imageSize,
                                     height: imageSize)
        
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
        additionalImage.image = nil
    }
    
    // MARK: - Private functions
    
    public func configure(with model: SettingsImageOption) {
        nameSetting.text = model.title
        settingImageView.image = model.icon
        settingImageViewContainer.backgroundColor = model.iconBackgroundColor
        additionalImage.image = model.additionImage
    }
}


