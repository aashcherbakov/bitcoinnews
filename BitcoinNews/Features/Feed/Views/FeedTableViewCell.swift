//
//  FeedTableViewCell.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import UIKit

public class FeedTableViewCell: UITableViewCell {

    public static let reuseIdentifier = "FeedTableViewCell"
    private var titleLabel: UILabel!

    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupDesign()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDesign() {
        titleLabel = UILabel()
        addSubview(titleLabel)

        titleLabel.alignYWith(self)
        titleLabel.alignLeftWith(self)
    }

    public func layout(title: String) {
        titleLabel.text = title
    }

}
