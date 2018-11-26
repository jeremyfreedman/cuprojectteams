//
//  FilterCollectionViewCell.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/26/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class FilterCell: UICollectionViewCell {
    
    var filter: Filter? {
        didSet {
            guard let filterName = filter?.name else { return }
            FilterNameLabel.text = filterName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
        self.backgroundColor = .white
        
        self.addSubview(FilterNameLabel)
        
        FilterNameLabel.anchor(top: filterImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    let filterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let FilterNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
