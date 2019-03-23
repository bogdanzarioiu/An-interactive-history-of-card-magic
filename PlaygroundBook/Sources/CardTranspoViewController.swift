//
//  CardTranspoViewController.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/21/19.
//

import UIKit
import AVFoundation
import PlaygroundSupport

public class CardTranspoViewController: UIViewController, PlaygroundLiveViewMessageHandler {
    public var joker: UIImageView!
    public var two: UIImageView!
    public var OnJoker: UIImageView!
    public var OnTwo: UIImageView!
    public var player: AVAudioPlayer?
    
    
override public func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = .white
        addingCards()
        //moveJoker()
        //moveTwo()
        //performTransposition()
        //createParticles()
        
    }
    
 public func addingCards() {
        let jokerImage = UIImage(named: "jokercard2")
        joker = UIImageView(image: jokerImage!)
        view.addSubview(joker)
        let onJokerImage = UIImage(named: "twoOfHearts")
        OnJoker = UIImageView(image: onJokerImage!)
        view.addSubview(joker)
        view.addSubview(OnJoker)
        addConstraintsOnLeftCards(for: joker)
        addConstraintsOnLeftCards(for: OnJoker)
        
        
        let twoImage = UIImage(named: "twoOfHearts")
        two = UIImageView(image: twoImage!)
        view.addSubview(two)
        let onTwoImage = UIImage(named: "jokercard2")
        OnTwo = UIImageView(image: onTwoImage!)
        view.addSubview(two)
        view.addSubview(OnTwo)
        addConstraintsOnRightCards(for: two)
        addConstraintsOnRightCards(for: OnTwo)
        
    }
    
   public func addConstraintsOnLeftCards(for leftImage: UIImageView) {
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        leftImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        leftImage.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        leftImage.widthAnchor.constraint(equalToConstant: 126).isActive = true
        leftImage.heightAnchor.constraint(equalToConstant: 176).isActive = true
    }
    
   public func addConstraintsOnRightCards(for rightImage: UIImageView) {
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        rightImage.centerXAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        rightImage.widthAnchor.constraint(equalToConstant: 126).isActive = true
        rightImage.heightAnchor.constraint(equalToConstant: 176).isActive = true
    }
    
 
    
   public func performTransposition() {
        UIView.animate(withDuration: 2, animations: {
            self.OnJoker.alpha = 0
            self.OnTwo.alpha = 0
        }) { (true) in
            self.applause()
        }
        
    }
    
   public func applause() {
        guard let url = Bundle.main.url(forResource: "clappingCrowd", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.volume = 0.4
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
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





