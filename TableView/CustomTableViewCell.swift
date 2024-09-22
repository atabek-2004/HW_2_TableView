//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Admin on 22.09.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(customImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            customImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 60),
            customImageView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with model: TableViewModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
}
