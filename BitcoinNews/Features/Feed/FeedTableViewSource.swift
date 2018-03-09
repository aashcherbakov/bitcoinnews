//
//  FeedTableViewSource.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import UIKit

public class FeedTableViewSource: NSObject, UITableViewDataSource {

    private let viewModel: FeedViewModel

    public init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleDisplays?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseIdentifier, for: indexPath) as! FeedTableViewCell
        cell.layout(title: viewModel.articleDisplays?[indexPath.row].title ?? "No title")
        return cell
    }

}
