//
//  ViewController.swift
//  custom-tabbar
//
//  Created by Ignatio Julian on 02/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designableTabBar()
        
        // #1 way show Home when didLoad()
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { timer in
//            self.stayAtHome()
//        }
        
        // #2 way show Home when didLoad()
        DispatchQueue.main.async {
            self.stayAtHome()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func designableTabBar() {
        tabBarView.layer.cornerRadius = tabBarView.frame.size.height / 2
        tabBarView.clipsToBounds = true
    }
    
    private func stayAtHome() {
        guard let Home = self.storyboard?.instantiateViewController(withIdentifier: "HOMEVC") as? HomeViewController else { return }
        contentView.addSubview(Home.view)
        Home.didMove(toParent: self)
    }
    
    @IBAction func onClickTabbar(_ sender: Any) {
        let tag = (sender as AnyObject).tag!
        print(tag)
        if tag == 1 {
            stayAtHome()
        } else if tag == 2 {
            guard let Search = self.storyboard?.instantiateViewController(withIdentifier: "SEARCHVC") as? SearchViewController else { return }
            contentView.addSubview(Search.view)
            Search.didMove(toParent: self)
        } else if tag == 3 {
            guard let Favorite = self.storyboard?.instantiateViewController(withIdentifier: "FAVORITEVC") as? FavoriteViewController else { return }
            contentView.addSubview(Favorite.view)
            Favorite.didMove(toParent: self)
        } else {
            guard let Profile = self.storyboard?.instantiateViewController(withIdentifier: "PROFILEVC") as? ProfileViewController else { return }
            contentView.addSubview(Profile.view)
            Profile.didMove(toParent: self)
        }
    }
    
}

