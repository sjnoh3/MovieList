//
//  CustomPageViewController.swift
//  MovieList
//
//  Created by Seok Jun Noh on 10/26/21.
//

import UIKit

let sampleData: [[String:Any]] = [[
                                    "title": "Good Will Hunting",
                                    "poster_url": "https://en.wikipedia.org/wiki/File:Good_Will_Hunting.png",
                                    "description": "Staring: Matt Damon, Ben Affick, Robin Williams",
                                    "year": 1997],
                                  [
                                    "title": "Independence Day",
                                    "poster_url": "https://en.wikipedia.org/wiki/File:Independence_Day_Resurgence_poster.jpg",
                                    "description": "Staring: Will Smith",
                                    "year": 1996]
]

class CardViewController: UIViewController {

    static let cardCornerRadius: CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
