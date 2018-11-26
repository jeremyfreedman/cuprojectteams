//
//  HeaderView.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/26/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView/* UICollectionViewCell*/ {
        var header: UILabel!
        //var didSetupShadow = false
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .white

            header = UILabel()
            header.textColor = .black
            header.text = "Project Teams"
            addSubview(header)
            
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setup() {
            header.snp.makeConstraints { make in
                make.bottom.equalToSuperview().inset(20)
                make.leading.equalTo(24)
                make.trailing.lessThanOrEqualToSuperview().inset(24)
            }
        }
}
