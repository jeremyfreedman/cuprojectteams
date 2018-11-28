//
//  TeamsCollectionViewCell.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/22/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    var team: Team? {
        didSet {
            guard let teamImage = team?.image else { return }
            guard let teamName = team?.name else { return }
            guard let teamType = team?.type else { return }
            
            teamImageView.image = UIImage(named: teamImage)
            TeamNameLabel.text = teamName
            TeamTypeLabel.text = teamType
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
        self.backgroundColor = .white
        
        self.addSubview(teamImageView)
        self.addSubview(TeamNameLabel)
        self.addSubview(TeamTypeLabel)
        
        self.layer.cornerRadius = 10.0
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        
       teamImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: -5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 150)

        TeamNameLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)

        TeamTypeLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 25, paddingLeft: -80, paddingBottom: 0, paddingRight: 0)
    }
    
    let teamImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let TeamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let TeamTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.textColor = UIColor(hue: 0.1333, saturation: 0, brightness: 0.52, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
