//
//  ChannelVC.swift
//  Smack
//
//  Created by Sanjay Vekariya on 8/18/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var tableview: UITableView!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChanged(_notif:)), name: NOTIF_USER_DATA_DID_CHANGED, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        setUpUserInfo()
    }
    @IBAction func addChannelPressed(_ sender: Any) {
        let addChannel = AddChannelVC()
        addChannel.modalPresentationStyle = .custom
        present(addChannel, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnPresed(_ sender: Any) {
        
        if AuthService.instance.isLoggedIn {
            // Show profile page
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    func userDataDidChanged(_notif: Notification) {
        setUpUserInfo()
    }
    
    func setUpUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            cell.configureCell(channel: MessageService.instance.channels[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
}
