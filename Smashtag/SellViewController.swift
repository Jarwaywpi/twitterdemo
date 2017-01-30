//
//  SellViewController.swift
//  Smashtag
//
//  Created by Jarway on 2016/11/14.
//  Copyright © 2016年 Jarway. All rights reserved.
//

import UIKit

class SellViewController: UIViewController {
    
    var auction : acutionGood = acutionGood() {
        didSet {
            print(auction.acutionGoods.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(auction.acutionGoods.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
