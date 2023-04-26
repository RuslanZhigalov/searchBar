//
//  CellViewTable.swift
//  searchBar
//
//  Created by Руслан Жигалов on 13.12.2022.
//

import UIKit
//import SnapKit
import SDWebImage
class  CellWithTwoLabelAndImage: UITableViewCell {
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    private let headersLabel: UILabel = {
        let label = UILabel()
        label.font = Constats.Fonts.systemText
       
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constats.Fonts.systemText2
        label.textColor = .gray
        let date = Date()
        let mytime = Date()
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        label.text = "\(format.string(from: mytime))"
        return label
    }()
    private let image: UIImageView = {
        let images = UIImageView()
        images.image = UIImage()
        return images
    }()
    private lazy var stackLabelAndData: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.addArrangedSubview(headersLabel)
        stack.addArrangedSubview(timeLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private lazy var stackLabel: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.addArrangedSubview(stackLabelAndData)
        stack.addArrangedSubview(countryLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(stackLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        constraintStack()
    }
    func constraintStack(){
        
        image.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.top.equalTo(contentView.snp.topMargin)
            make.bottom.equalTo(contentView.snp.bottomMargin)
        }
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
        countryLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        countryLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 16).isActive = true
        countryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
//        uiLabel1.topAnchor.constraint(equalTo: stackLabelAndData.bottomAnchor, constant: -8).isActive = true
        
        headersLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        headersLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -58).isActive = true
        headersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        

        
        timeLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func configure(_ cell: CharactersIMDB){
        guard let url = URL(string: cell.image) else{return}
        image.sd_setImage(with: url)
        countryLabel.text = cell.description
        headersLabel.text = cell.title
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
