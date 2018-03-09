//
//  ViewController.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 2/14/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import UIKit

public class FeedViewController: BaseViewController {

    var viewModel: FeedViewModel!
    private var dataSource: FeedTableViewSource!

    /// Views
    private var activityIndicator: UIActivityIndicatorView!
    private var tableView: UITableView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        dataSource = FeedTableViewSource(viewModel: viewModel)

        setupDesign()
        viewModel.onStateChange = onStateChange
        viewModel.loadFeed()
    }

    private func onStateChange(state: FeedViewModel.State) -> Void {
        switch state {
        case .loading:
            break
        case .complete:
            tableView.reloadData()
            tableView.isHidden = false
        case .error:
            break
        }
    }

    private func setupDesign() {
        view.backgroundColor = UIColor.white

        setupTableView()
    }

    private func setupTableView() {
        tableView = UITableView()
        view.addSubview(tableView)

        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.reuseIdentifier)
        tableView.dataSource = dataSource
        tableView.embedIn(view)
        tableView.isHidden = true
    }
}


