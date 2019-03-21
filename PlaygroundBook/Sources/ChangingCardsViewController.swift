//
//  PlayingCardImage.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/18/19.
//

import Foundation
import UIKit
import PlaygroundSupport

public class ChangingCardsViewController: UIViewController, PlaygroundLiveViewMessageHandler {
    
   public var twoOfHeartsView: UIImageView!
   public var jackOfClubsView: UIImageView!
    
    
    override  public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addCards()
        changeCards()
    }
    
    public func addCards() {
        let jackImage = UIImage(named: "jackOfClubs")
        jackOfClubsView = UIImageView(image: jackImage!)
        
        let twoImage = UIImage(named: "twoOfHearts")
        twoOfHeartsView = UIImageView(image: twoImage!)
        view.addSubview(jackOfClubsView)
        view.addSubview(twoOfHeartsView)
        jackOfClubsView.alpha = 0
        twoOfHeartsView.alpha = 0
        addingConstraintsForTheCards()
        
    }
    
   public  func addingConstraintsForTheCards() {
        jackOfClubsView.translatesAutoresizingMaskIntoConstraints = false
        jackOfClubsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jackOfClubsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        jackOfClubsView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        jackOfClubsView.heightAnchor.constraint(equalToConstant: 254).isActive = true
        
        twoOfHeartsView.translatesAutoresizingMaskIntoConstraints = false
        twoOfHeartsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        twoOfHeartsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        twoOfHeartsView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        twoOfHeartsView.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    public func changeCards() {
        twoOfHeartsView.alpha = 1
        UIView.animate(withDuration: 2.5) {
            self.twoOfHeartsView.alpha = 0
            self.jackOfClubsView.alpha = 1
        }
    }

  
    
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .integer(message):
            if message == 1 {
                print("Perfect!😃")
               // addJoker(for: cardImage)
            }
            else if message == 0 {
                print("You need to snap your fingers once for magic to happen!")
            }
            else if message > 1 {
                print("Too many snaps, let's go baby steps!😅")
            }
        default:
            print("Only numbers")
        }
        
        
    }
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
}


