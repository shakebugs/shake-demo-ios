//
//  MainViewController.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 05.11.2021..
//

import Foundation
import UIKit
import SideMenu

enum NavigationOption: Int {
    case shaking
    case customizing
    case crashReporting
    case feedbackCenter
    case offlineSupport
    
    var description: (String, String) {
        switch self {
            case .shaking:
                return ("Hi, try shaking", "shaking_icon")
            case .customizing:
                return ("Customizing Shake", "customizing_icon")
            case .crashReporting:
                return ("Crash reporting", "crashReporting_icon")
            case .feedbackCenter:
                return ("Feedback center", "feedbackCenter_icon")
            case .offlineSupport:
                return ("Offline support", "offline_icon")
        }
    }
}


class MainViewController: UIViewController, MenuControllerDelegate {
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sliding menu
        let hamburgerIcon = UIImage(named: "icons8-menu-60")
        
        let button = UIBarButtonItem(image: hamburgerIcon, style: .plain, target: self, action: #selector(self.didTapMenu))
        self.navigationItem.leftBarButtonItem  = button
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "shake_headline_color")
                
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "dots"), style: .done, target: self, action: #selector(rightMenuTapped(sender:)))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "shake_headline_color")

        self.navigationController?.navigationItem.hidesBackButton = true
        
        let menuController = MenuListController(navigationOptions: [.shaking, .customizing, .crashReporting, .feedbackCenter, .offlineSupport])
        menuController.delegate = self
        
        menu = SideMenuNavigationController(rootViewController: menuController)
        menu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = menu
                        
        updateMenus()
       
        // initial vc
        configureWithNavigationOption(option: .shaking, inRootController: self)
    }
    
    @objc func rightMenuTapped(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.barButtonItem = sender
        
        alert.addAction(UIAlertAction(title: "Settings", style: .default , handler:{ (UIAlertAction)in
            
            let storyboard = UIStoryboard(name: "SettingsVC", bundle: .main)
            
            if #available(iOS 13.0, *) {
                let settingsVC = storyboard.instantiateViewController(identifier: "SettingsVC")
                self.navigationController?.pushViewController(settingsVC, animated: true)
            } else{
                let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsVC")
                self.navigationController?.pushViewController(settingsVC, animated: true)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func configureWithNavigationOption(option: NavigationOption, inRootController rootVC: UIViewController) {
        
        var configuredViewController: UIViewController?
        
        switch option {
        case .customizing:
            let storyboard = UIStoryboard(name: "CustomizingVC", bundle: .main)
            if #available(iOS 13.0, *) {
                configuredViewController = storyboard.instantiateViewController(identifier: "CustomizingVC")
            } else{
                configuredViewController = storyboard.instantiateViewController(withIdentifier: "CustomizingVC")
            }
            
         
        case .shaking:
            let storyboard = UIStoryboard(name: "ShakingVC", bundle: .main)
            if #available(iOS 13.0, *) {
                configuredViewController = storyboard.instantiateViewController(identifier: "ShakingVC")
            } else{
                configuredViewController = storyboard.instantiateViewController(withIdentifier: "ShakingVC")
            }
        
        case .crashReporting:
            let storyboard = UIStoryboard(name: "CrashReportingVC", bundle: .main)
            if #available(iOS 13.0, *) {
                configuredViewController = storyboard.instantiateViewController(identifier: "CrashReportingVC")
            } else{
                configuredViewController = storyboard.instantiateViewController(withIdentifier: "CrashReportingVC")
            }
            
        case .feedbackCenter:
            let storyboard = UIStoryboard(name: "FeedbackVC", bundle: .main)
            if #available(iOS 13.0, *) {
                configuredViewController = storyboard.instantiateViewController(identifier: "FeedbackVC")
            } else{
                configuredViewController = storyboard.instantiateViewController(withIdentifier: "FeedbackVC")
            }
            
        case .offlineSupport:
            let storyboard = UIStoryboard(name: "OfflineVC", bundle: .main)
            if #available(iOS 13.0, *) {
                configuredViewController = storyboard.instantiateViewController(identifier: "OfflineVC")
            } else{
                configuredViewController = storyboard.instantiateViewController(withIdentifier: "OfflineVC")
            }

        default:
            break
        }
        
//        todo add more cases
        
        guard let vc = configuredViewController else { return }
        detachChildFromParent(parent: rootVC)
        attachChild(childVC: vc, toParentVC: rootVC)
    }

    
    func detachChildFromParent(parent: UIViewController) {
        guard let child = parent.children.first else { return }
        child.view.removeFromSuperview()
        child.didMove(toParent: nil)
    }
    
    func attachChild(childVC: UIViewController, toParentVC parent: UIViewController) {
        parent.view.addSubview(childVC.view)
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        parent.addChild(childVC)
        childVC.didMove(toParent: parent)
    }

    
    @IBAction func didTapMenu(){
        present(menu!, animated: true)
    }
    
    private func updateMenus() {
        var settings = SideMenuSettings()
        settings.presentationStyle = .menuSlideIn
        
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
        SideMenuManager.default.rightMenuNavigationController?.settings = settings
    }
    
    
    func didSelectMenuItem(option: NavigationOption){
        dismiss(animated: true, completion: nil)
        configureWithNavigationOption(option: option, inRootController: self)
    }
    

}

protocol MenuControllerDelegate{
    func didSelectMenuItem(option: NavigationOption)
}

class MenuListController: UITableViewController {

    let items: [NavigationOption]

    init(navigationOptions: [NavigationOption]) {
        items = navigationOptions
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var delegate: MenuControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "cell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let option = items[indexPath.row]
        cell.textLabel?.text = option.description.0
        
        if(option.description.1 != ""){
            cell.imageView?.image = UIImage(named: option.description.1)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let option = items[indexPath.row]
        delegate?.didSelectMenuItem(option: option)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 100))
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shake_menu_logo")
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        imageView.center = headerView.center
        
        headerView.addSubview(imageView)
    
        return headerView
    }

}
