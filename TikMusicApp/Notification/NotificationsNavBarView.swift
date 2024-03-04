//
//  NotificationsNavBarView.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import UIKit
protocol NotificationsNavBarViewDelegate: class {
    func didSelectNotification(type: NotificationType)
}
fileprivate let tableViewCellIdentiffier = "tikToktableViewCellIdentiffier"
class NotificationsNavBarView: UIView {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
    
    
    //MARK: - Properties
    weak var delegate: NotificationsNavBarViewDelegate?
    
    fileprivate var selectedNotificationType = NotificationType(imageName: "notificationsSelectedImage", title: "All activity")
    
    fileprivate let notificationsDataSource: [NotificationType] = {
        let allActivityNotifications = NotificationType(imageName: "notificationsSelectedImage", title: "All activity")
        let likesNotifications = NotificationType(imageName: "heart", title: "Likes")
        let commentNotifications = NotificationType(imageName: "commentIcon", title: "Comment")
        let mentionsNotifications = NotificationType(imageName: "mentionsIcon", title: "Mentions")
        let followersNotifications = NotificationType(imageName: "profileSelectedImage", title: "Followers")
        let fromTikTokNotifications = NotificationType(imageName: "tik-tok", title: "From TiTok")
        return [allActivityNotifications, likesNotifications, commentNotifications, mentionsNotifications, followersNotifications, fromTikTokNotifications]
    }()
    
    
  
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.allowsMultipleSelection = false
        return tableView
    }()
    
    
    
    
    
    
    
    //MARK: - Handlers
    
    fileprivate func setUpViews() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.fillSuperview()
        tableView.register(NotificationTypeCell.self, forCellReuseIdentifier: tableViewCellIdentiffier)
        tableView.selectRow(at: [0,0], animated: false, scrollPosition: .none)

    }
    
    
    
    
    //MARK: - Code Was Created by Devank All rights reserved.
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//MARK: - TableView Delegates & DataSource
extension NotificationsNavBarView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentiffier, for: indexPath) as! NotificationTypeCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.notificationType = notificationsDataSource[indexPath.row]
        if selectedNotificationType == notificationsDataSource[indexPath.row] {
            cell.handleCellSelection(cellIsSelected: true)
        } else {
            cell.handleCellSelection(cellIsSelected: false)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? NotificationTypeCell else {return}
        delegate?.didSelectNotification(type: notificationsDataSource[indexPath.row])
        selectedNotificationType = notificationsDataSource[indexPath.row]
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsDataSource.count
    }
 
}
