//
//  TeamInfoTableViewCell.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/29/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class TeamInfoTableViewCell: UITableViewCell {


    let summaryLabel = UILabel()
    let teamLabel = UILabel()
    let accomplishmentsLabel = UILabel()
    let membersLabel = UILabel()
    let socialmediasLabel = UILabel()
    let timelineLabel = UILabel()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Use marginGuide’s anchor instead of the view’s anchors so the recommended padding is utilized
        let marginGuide = contentView.layoutMarginsGuide
        
        // Configure summaryLabel
        contentView.addSubview(summaryLabel)
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        summaryLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        summaryLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        summaryLabel.numberOfLines = 0 // make label multi-line
        
        // Configure summaryLabel
        contentView.addSubview(summaryLabel)
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        summaryLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        summaryLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        // Constrain summaryLabel’s topAnchor to titleLabel's bottom anchor
        summaryLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor).isActive = true
        summaryLabel.numberOfLines = 0 // make label multi-line
        summaryLabel.textColor = UIColor.lightGray
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
