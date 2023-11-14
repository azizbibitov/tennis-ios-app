//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Joo Hee Kim on 20. 12. 13..
//

import UIKit
import EasyPeasy

class MainTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarAppearance()
    }
    
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        let lieTrait = UITraitCollection.init(horizontalSizeClass: .regular)
        return UITraitCollection(traitsFrom: [realTraits, lieTrait])
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MatchVC(),
                title: "Match",
                image: UIImage(systemName: "sportscourt.fill")
            ),
            generateVC(
                viewController: BetVC(),
                title: "Bet",
                image: UIImage(systemName: "arrow.up.arrow.down.square.fill")
            ),
            generateVC(
                viewController: NewsVC(),
                title: "News",
                image: UIImage(systemName: "newspaper.fill")
            ),
            generateVC(
                viewController: NotesVC(),
                title: "Notes",
                image: UIImage(systemName: "note.text")
            ),
            generateVC(
                viewController: CalendarVC(),
                title: "Calendar",
                image: UIImage(systemName: "calendar")
            ),
            generateVC(
                viewController: InteractiveVC(),
                title: "Interactive",
                image: UIImage(systemName: "gamecontroller.fill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return UINavigationController(rootViewController: viewController)
    }
    
    private func setTabBarAppearance() {
        
        let positionOnX: CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        tabBar.layer.backgroundColor = UIColor.tabBarColor.cgColor
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.darkGray
        
    }
}
