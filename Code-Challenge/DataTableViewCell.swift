//
//  DataTableViewCell.swift
//  Code-Challenge
//
//  Created by Helios on 25/07/20.
//  Copyright © 2020 Axxess. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
