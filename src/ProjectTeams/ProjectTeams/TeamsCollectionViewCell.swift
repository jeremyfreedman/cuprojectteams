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
            TeamTypeLabel.setTitle(teamType, for: .normal) // = teamType
            TeamTypeLabel2.setTitle(teamType, for: .normal) // = teamType
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setup()
    }
    
    func setup() {
        
        self.backgroundColor = .white
        
        self.addSubview(teamImageView)
        self.addSubview(TeamNameLabel)
        self.addSubview(TeamTypeLabel)
        self.addSubview(TeamTypeLabel2)
        
        
        //        self.teamImageView.topAnchor.constraint(equalTo: self.topAnchor)
        //        self.teamImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        //        self.teamImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        //        self.teamImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        //
        //        self.teamImageView.layer.masksToBounds = true
        //        self.teamImageView.layer.cornerRadius = CGFloat(roundf(Float(self.teamImageView.frame.size.width/2.0)))
        
        
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
        
        
        //        teamImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: frame.size.height)
        teamImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: contentView.layer.borderWidth, height: 200)
        teamImageView.topAnchor.constraint(equalTo: topAnchor)
        teamImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        teamImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        teamImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        teamImageView.layer.masksToBounds = true
        teamImageView.layer.cornerRadius = CGFloat(roundf(Float(teamImageView.frame.size.width/2.0)))
        teamImageView.contentMode = UIView.ContentMode.scaleAspectFill
        
        teamImageView.layer.cornerRadius = 10.0
        teamImageView.layer.cornerRadius = 10.0
        // only the top corners:
        teamImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        teamImageView.layer.borderWidth = 1.0
        teamImageView.layer.borderColor = UIColor.clear.cgColor
        teamImageView.layer.masksToBounds = true
        
        
        TeamNameLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        //        TeamTypeLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        TeamTypeLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 2)
        
        TeamTypeLabel2.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 2)
        
        
        
        
        
        NSLayoutConstraint.activate([
            teamImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            teamImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            teamImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            teamImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
            
            ])
        
        //         Project Team title
        NSLayoutConstraint.activate([
            //            TeamNameLabel.centerXAnchor.constraint(equalTo: teamImageView.centerXAnchor),
            TeamTypeLabel.centerXAnchor.constraint(equalTo: teamImageView.centerXAnchor),
            TeamTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            TeamTypeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -110),
            TeamTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 310),
            TeamTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            //            TeamNameLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            //            TeamNameLabel.centerXAnchor.constraint(equalTo: teamImageView.centerXAnchor),
            TeamTypeLabel2.centerXAnchor.constraint(equalTo: teamImageView.centerXAnchor),
            TeamTypeLabel2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            TeamTypeLabel2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -110),
            TeamTypeLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 270),
            TeamTypeLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            //            TeamNameLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 20)
            ])
        
        
        //         Project Team type
        NSLayoutConstraint.activate([
            TeamNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            /*TeamTypeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
             TeamTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 230),
             TeamTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
             */
            ])
        
        
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
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    let TeamTypeLabel: UIButton = {
        let label = UIButton()
        label.setTitle("Type", for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 8)
        label.setTitleColor(.white, for: .normal) // = UIColor(hue: 0.1333, saturation: 0, brightness: 0.52, alpha: 1.0)
        //label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.textAlignment = .center
        label.backgroundColor = UIColor(red:0.33, green:0.01, blue:0.95, alpha:1.0) // purple
        label.layer.cornerRadius = 5.0
        
        return label
    }()
    
    let TeamTypeLabel2: UIButton = {
        let label = UIButton()
        label.setTitle("Type", for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 8)
        label.setTitleColor(.white, for: .normal) // = UIColor(hue: 0.1333, saturation: 0, brightness: 0.52, alpha: 1.0)
        //label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.textAlignment = .center
        label.backgroundColor = UIColor(red:0.53, green:0.21, blue:0.4, alpha:1.0) // purple
        label.layer.cornerRadius = 5.0
        
        return label
    }()
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
