//
//  CardTranspoViewController.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/21/19.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class CardTranspoViewController: UIViewController, PlaygroundLiveViewMessageHandler {
    
 
    override public func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
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

public class GameScene: SKScene {

    
    override public func didMove(to view: SKView) {
        //        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        //        addChild(label)
        let jack = SKSpriteNode(imageNamed: "jackOfClubs")
        jack.scale(to: CGSize(width: 126, height: 176))
        jack.position = CGPoint(x: view.frame.width / 4, y: view.frame.height / 2)
        addChild(jack)
        
        let two = SKSpriteNode(imageNamed: "twoOfHearts")
        two.scale(to: CGSize(width: 126, height: 176))
        two.position = CGPoint(x: view.frame.width - 110, y: view.frame.height / 2)
        addChild(two)
        
        let moveJack = SKAction.moveTo(x: two.position.x, duration: 3)
        jack.run(moveJack)
        let moveTwo = SKAction.moveTo(x: jack.position.x, duration: 3)
        two.run(moveTwo)
    }
    
    
    
    
}
