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
    public var king: UIImageView!
    public var OnJoker: UIImageView!
    public var OnKing: UIImageView!
    public var player: AVAudioPlayer?
    public var leftContainer: UIView!
    public var rightContainer: UIView!
    
    
 override public func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = .white
    setupLeftContainer()
    setupRightContainer()
    addLeftContainerConstraints()
    addRightContainerConstraints()
        
    }
    
  public func addingLeftCards() {
        let jokerImage = UIImage(named: "joker")
        joker = UIImageView(image: jokerImage!)
        //view.addSubview(joker)
        let onJokerImage = UIImage(named: "kingOfClubs")
        OnJoker = UIImageView(image: onJokerImage!)
        leftContainer.addSubview(joker)
        leftContainer.addSubview(OnJoker)
        addConstraintsOnLeftCards(for: joker)
        addConstraintsOnLeftCards(for: OnJoker)
    }
    
    public func addingRightCards() {
        let kingImage = UIImage(named: "kingOfClubs")
        king = UIImageView(image: kingImage!)
        //view.addSubview(queen)
        let onKingImage = UIImage(named: "joker")
        OnKing = UIImageView(image: onKingImage!)
        rightContainer.addSubview(king)
        rightContainer.addSubview(OnKing)
        addConstraintsOnRightCards(for: king)
        addConstraintsOnRightCards(for: OnKing)
        
    }
    
    public func setupLeftContainer() {
        leftContainer = UIView(frame: CGRect(x: view.frame.width / 2 , y: view.frame.height / 2 , width: 189, height: 254))
        view.addSubview(leftContainer)
        leftContainer.clipsToBounds = false
        leftContainer.layer.shadowColor = UIColor.black.cgColor
        leftContainer.layer.shadowOpacity = 0.9
        leftContainer.layer.shadowOffset = CGSize.zero
        leftContainer.layer.shadowRadius = 5
        leftContainer.layer.shadowPath = UIBezierPath(roundedRect: leftContainer.bounds, cornerRadius: 10).cgPath
        addingLeftCards()
        
    }
    
    public func setupRightContainer() {
        rightContainer = UIView(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 189, height: 254))
        view.addSubview(rightContainer)
        rightContainer.clipsToBounds = false
        rightContainer.layer.shadowColor = UIColor.black.cgColor
        rightContainer.layer.shadowOpacity = 0.9
        rightContainer.layer.shadowOffset = CGSize.zero
        rightContainer.layer.shadowRadius = 5
        rightContainer.layer.shadowPath = UIBezierPath(roundedRect: rightContainer.bounds, cornerRadius: 10).cgPath
        addingRightCards()
        
    }
   public func addConstraintsOnLeftCards(for leftImage: UIImageView) {
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        leftImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        leftImage.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 145).isActive = true
        leftImage.widthAnchor.constraint(equalToConstant: 189).isActive = true
        leftImage.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    public func addLeftContainerConstraints () {
        leftContainer.translatesAutoresizingMaskIntoConstraints = false
        leftContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        leftContainer.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 145).isActive = true
        leftContainer.widthAnchor.constraint(equalToConstant: 189).isActive = true
        leftContainer.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    public func addRightContainerConstraints() {
        rightContainer.translatesAutoresizingMaskIntoConstraints = false
        rightContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        rightContainer.centerXAnchor.constraint(equalTo: view.rightAnchor, constant: -145).isActive = true
        rightContainer.widthAnchor.constraint(equalToConstant: 189).isActive = true
        rightContainer.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
   public func addConstraintsOnRightCards(for rightImage: UIImageView) {
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        rightImage.centerXAnchor.constraint(equalTo: view.rightAnchor, constant: -145).isActive = true
        rightImage.widthAnchor.constraint(equalToConstant: 189).isActive = true
        rightImage.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
   
    
 
    
   public func performTransposition() {
        UIView.animate(withDuration: 2, animations: {
            self.OnJoker.alpha = 0
            self.OnKing.alpha = 0
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





