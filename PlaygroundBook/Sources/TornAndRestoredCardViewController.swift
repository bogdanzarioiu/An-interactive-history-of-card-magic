//
//  TornAndRestoredCardViewController.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/22/19.
//

import UIKit
import PlaygroundSupport

public class TornAndRestoredCardViewController: UIViewController, PlaygroundLiveViewMessageHandler {
    public var queenTopView: UIImageView!
    public var queenBottomView: UIImageView!
    
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        placingTornCards()
        //restoreCardsFromHalves()

    }
    
    
    public func placingTornCards() {
        let queenTop = UIImage(named: "queenTop")
        queenTopView = UIImageView(image: queenTop!)
        queenTopView.contentMode = .scaleAspectFit
        view.addSubview(queenTopView)
        
        let queenBottom = UIImage(named: "queenBottom")
        queenBottomView = UIImageView(image: queenBottom!)
        queenBottomView.contentMode = .scaleAspectFit
        view.addSubview(queenBottomView)
        constraintsForTornCards()
    }

    public func constraintsForTornCards() {
        queenTopView.translatesAutoresizingMaskIntoConstraints = false
        queenTopView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        queenTopView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120).isActive = true
        queenTopView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        queenTopView.heightAnchor.constraint(equalToConstant: 254).isActive = true
        
        queenBottomView.translatesAutoresizingMaskIntoConstraints = false
        queenBottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        queenBottomView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120).isActive = true
        queenBottomView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        queenBottomView.heightAnchor.constraint(equalToConstant: 254).isActive = true
        
    }
    
    public func restoreCardsFromHalves() {
        UIView.animate(withDuration: 3) {
            self.queenTopView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.queenBottomView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            //self.queenTopView.transform = CGAffineTransform(translationX: 0, y: +55)
            //self.queenBottomView.transform = CGAffineTransform(translationX: 0, y: -55 )
            
            
            
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
