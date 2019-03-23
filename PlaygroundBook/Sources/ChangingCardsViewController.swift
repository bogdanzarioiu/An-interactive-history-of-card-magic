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
   public var jackOfDiamondsView: UIImageView!
    
    
    override  public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addCards()
        //changeCards()
    }
    
    public func addCards() {
        let jackDImage = UIImage(named: "jackOfDiamonds")
        jackOfDiamondsView = UIImageView(image: jackDImage!)
        
        let twoImage = UIImage(named: "twoOfHearts")
        twoOfHeartsView = UIImageView(image: twoImage!)
        view.addSubview(jackOfDiamondsView)
        view.addSubview(twoOfHeartsView)
        jackOfDiamondsView.alpha = 0
        twoOfHeartsView.alpha = 0
        addingConstraintsForTheCards()
        
    }
    
   public  func addingConstraintsForTheCards() {
        jackOfDiamondsView.translatesAutoresizingMaskIntoConstraints = false
        jackOfDiamondsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jackOfDiamondsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        jackOfDiamondsView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        jackOfDiamondsView.heightAnchor.constraint(equalToConstant: 254).isActive = true
        
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
            self.jackOfDiamondsView.alpha = 1
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


