//
//  ListCurrencyTickerViewController.swift
//  iCrypto
//
//  Created by Nguyen Nghia on 8/31/20.
//  Copyright (c) 2020 Nghia Nguyen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ListCurrencyTickerViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!

    // MARK: - Public properties -

    var presenter: ListCurrencyTickerPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.getListCurrencyTicker()
    }

    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
    }
}

// MARK: - Extensions -

extension ListCurrencyTickerViewController: ListCurrencyTickerViewInterface {
    func reloadData() {
        tableView.reloadData()
    }
}

extension ListCurrencyTickerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        let currencyTicker = presenter.item(at: indexPath)
        cell.textLabel?.text = currencyTicker?.name
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
}

extension ListCurrencyTickerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}