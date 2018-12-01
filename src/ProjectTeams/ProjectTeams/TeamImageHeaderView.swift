//
//  TeamImaheHeaderView.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/30/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit
import SnapKit

class TeamImageHeaderView: UICollectionReusableView {
    var header: UILabel!
    //var didSetupShadow = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        header = UILabel()
        header.textColor = .black
        header.text = "header..."
        header.textAlignment = NSTextAlignment.center
//        header.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
//        header.backg
        
        addSubview(header)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        header.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(120)
            make.trailing.lessThanOrEqualToSuperview().inset(24)
        }
    }
}
