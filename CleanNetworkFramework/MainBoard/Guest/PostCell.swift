//
//  PostCell.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-22.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {

    static let identifier: String = "PostCell"
    weak var textLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            ])
        self.textLabel = textLabel
        
        self.contentView.backgroundColor = .lightGray
        self.textLabel.textAlignment = .center
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.textLabel.text = nil
    }

    
}
