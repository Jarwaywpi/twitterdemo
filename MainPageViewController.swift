//
//  MainPageViewController.swift
//  Smashtag
//
//  Created by Jarway on 2016/11/14.
//  Copyright © 2016年 Jarway. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController{
    
    var auction = acutionGood() {
        didSet {            
            print(auction.acutionGoods.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(auction.acutionGoods.count)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "Next Page" {
            if let ivc = segue.destination as? TweetTableViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                print(auction.acutionGoods.count)
                ivc.title = imageName;
                ivc.tweets = auction
            }
            if let ivc = segue.destination as? SellViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.title = imageName;
                print(auction.acutionGoods.count)
                ivc.auction = auction
            }
        }
        // Pass the selected object to the new view controller.
    }

}
