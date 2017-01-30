//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Jarway on 2016/11/14.
//  Copyright © 2016年 Jarway. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetCreatedLabel: UILabel!
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var highBid: UILabel!
    @IBOutlet weak var oneShot: UILabel!

    var tweet: auctionGood? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
        // Reset any existing tweet information
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
        tweetCreatedLabel?.text = nil
        highBid?.text = nil
        oneShot?.text = nil
        
        // Load new information from our tweet text (if any)
        // Just indicate (for now) that there are attached images
        // TODO: Handle images included in tweet
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
//            if tweetTextLabel?.text != nil {
////                for _ in tweet.media {
////                    tweetTextLabel.text! += " 📷"
////                }
//            }
        }
        
        // Twitter User
        tweetScreenNameLabel?.text = "\(tweet!.user)"
        highBid?.text = "最高价：\(tweet!.highbit)"
        oneShot?.text = "一口价：\(tweet!.oneShot)"
        // Twitter Profile Image
        if let profileImageURL = tweet?.Image {
            //FIXME: Fix blocking of main thread - Homework exercise
            if let imageData = NSData(contentsOf: profileImageURL as URL) {
                tweetProfileImageView?.image = UIImage(data: imageData as Data)
            }
        }
        
        // Twitter date/time message was sent
        let formatter = DateFormatter()
        // If the tweet wasn't created today, then show the date only
        if NSDate().timeIntervalSince((tweet?.created)! as Date) > 86_400 {   // 86,400 seconds for one day
            formatter.dateStyle = DateFormatter.Style.short
            // If tweet was created today, then show a time instead
        } else {
            formatter.timeStyle = DateFormatter.Style.short
        }
        tweetCreatedLabel?.text = formatter.string(from: tweet!.created as Date)
    }

}
