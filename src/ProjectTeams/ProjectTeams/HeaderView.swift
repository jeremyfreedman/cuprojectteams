//
//  HeaderView.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/26/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

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
    var header: UIButton!
    var header2: UIButton!
    
    //var didSetupShadow = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        let header: UIButton = UIButton(frame: CGRect(x: 30, y: 20, width: 150, height: 40)) //frame.size.width - 60
        header.setTitle("type A Selected", for: .normal)
        header.backgroundColor = UIColor(red:0.53, green:0.21, blue:0.4, alpha:1.0)
        header.layer.cornerRadius = 5.0
        //        header.addTarget(self, action: #selector(myButtonTapped), for: UIControl.Event.touchUpInside)
        header.addTarget(self, action: #selector(myButtonTapped), for: UIControl.Event.touchUpInside)
        
        addSubview(header)
        
        let header2: UIButton = UIButton(frame: CGRect(x: 200, y: 20, width: 150, height: 40)) //frame.size.width - 60
        header2.setTitle("type B Selected", for: .normal)
        header2.backgroundColor =  UIColor(red:0.33, green:0.01, blue:0.95, alpha:1.0)
        header2.layer.cornerRadius = 5.0
        header2.addTarget(self, action: #selector(myButtonTapped2), for: UIControl.Event.touchUpInside)
        
        //        header2.addTarget(self, action: #selector(myButtonTapped2), for: UIControl.Event.touchUpInside)
        addSubview(header2)
    }
    
    @objc func myButtonTapped(sender: UIButton) {
        if sender.isSelected {
            sender.backgroundColor = UIColor(red:0.53, green:0.21, blue:0.4, alpha:1.0)
            sender.titleLabel?.textColor = .black
            sender.isSelected = false
            sender.setTitle("type A Selected", for: .normal)
        }
        else {
            sender.backgroundColor = .red
            sender.titleLabel?.textColor = .white
            sender.isSelected = true
            sender.setTitle("type A Disabled", for: .normal)
        }
    }
    
    @objc func myButtonTapped2(sender: UIButton) {
        if sender.isSelected {
            sender.backgroundColor = UIColor(red:0.33, green:0.01, blue:0.95, alpha:1.0)
            sender.isSelected = false
            sender.setTitle("type B Selected", for: .normal)
        }
        else {
            sender.backgroundColor = .red
            sender.isSelected = true
            sender.setTitle("type B Disabled", for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
