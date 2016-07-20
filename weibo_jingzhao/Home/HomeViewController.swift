//
//  HomeViewController.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/7/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let logonUser = Logon()
    @IBOutlet var tableView: UITableView!
    private let timeLineRequest = UserTimeLineRequest()
    private var homeViewModel: HomeViewControllerViewModel?
    private let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        addRightBarButton()
        addRefreshView()
        getUserTimeLine()
    }
    
    // MARK: private
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
    }
    
    func addRightBarButton() {
        let rightBarButton = UIBarButtonItem(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(HomeViewController.logon))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func logon() {
        self.logonUser.ssoAuthorize { (response, logon) in
            if logon{
                guard let response = response else {
                    return
                }
                UserStore().storeUser( UserTransform().userTransformFromResponse(response))
                self.getUserTimeLine()
            }
        }
    }
    
    func addRefreshView() {
        refresh.addTarget(self, action: #selector(getUserTimeLine), forControlEvents: .ValueChanged)
        refresh.attributedTitle = NSAttributedString(string: "松手刷新微博")
        tableView .addSubview(refresh)
    }
    
    func getUserTimeLine() {
        timeLineRequest.requestTimeLineData("1", countNum: "5") { [weak self](result) in
            let timeLines = TimeLineTransform().timeLineTransformFromDictionary(result)
            if  let controller = self {
                controller.homeViewModel = HomeViewControllerViewModel(timeLines: timeLines)
                controller.tableView.reloadData()
                controller.refresh.endRefreshing()
            }
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let homeViewModel = homeViewModel else {
            return 0
        }
        return  homeViewModel.tableViewCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StatusTextCell.identifierCell, forIndexPath: indexPath)
        guard let statusTextCell = cell as? StatusTextCell, let homeViewModel = homeViewModel else {
            return cell
        }
        statusTextCell.configureData( homeViewModel.textCellViewModels[indexPath.row])
        return statusTextCell
    }
}
