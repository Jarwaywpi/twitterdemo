//
//  TweetTableViewController.swift
//  Smashtag
//
//  Created by Jarway on 2016/11/14.
//  Copyright © 2016年 Jarway. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController, UITextFieldDelegate {

    var tweets : acutionGood = acutionGood() {
        didSet {
            reloadInputViews()
        }
    }

    var searchText: String? {
        didSet {
//            tweets.removeAll()
            addnew()
            title = searchText
                tableView.reloadData()

        }
    }

    private func addnew() {
        let name : String? = "Jarway"
        tweets.addNewGood(user: name!, text:searchText!, created: Date(), highbit: 100, oneShot: 200)
        print(tweets.acutionGoods.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tweets.acutionGoods.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweets.acutionGoods[section].count
    }

    private struct Storyboard {
        static let TweetCellIdentifier = "Tweet"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TweetCellIdentifier, for: indexPath)

        let tweet = tweets.acutionGoods[indexPath.section][indexPath.row]
        if let tweetCell = cell as? TweetTableViewCell {
            tweetCell.tweet = tweet
        }

        return cell
    }

    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField.text = searchText
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchText = textField.text
        return true
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "Show Detail") {
            if let tablecell = sender as? TweetTableViewCell {
                print("herewith \(tablecell.tweetTextLabel!.text)")
            }
        }
    }

}
