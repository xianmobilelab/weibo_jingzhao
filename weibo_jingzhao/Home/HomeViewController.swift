//
//  HomeViewController.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/7/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    private let logOnModel = LogOnModel()
    private let timeLineModel = UserTimeLineModel()
    let homeViewModel = HomeViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50.0
        let rightBarButton = UIBarButtonItem.init(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action:#selector(HomeViewController.logOn))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        getUserTimeLine()
    }
    
    /*
     private
     */
    func logOn() {
        logOnModel.ssoAuthorize { (response, logOn) in
            if (logOn){
                guard let response = response else {
                    return
                }
                LogOnModel.storeUserInformation(response)
                self.getUserTimeLine()
            }
        }
    }
    
    func getUserTimeLine() {
        guard let userInfo = LogOnModel.getStoreUserInformation(),
            let token = userInfo["access_token"] as? String else {
                return
        }
        timeLineModel.requestTimeLineData(token, pageNum: "1", countNum: "20") { (data) in
            self.tableView.reloadData()
            print(data)
        }
    }
    
    /*
     UITableViewDataSource Protocol
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return timeLineModel.statusesModel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(StatusTextCell.identifierCell, forIndexPath: indexPath)
        guard let statusTextCell = cell as? StatusTextCell else {
            return cell
        }
        statusTextCell.configureData(timeLineModel.statusesModel[indexPath.row])
        return statusTextCell
    }
}

