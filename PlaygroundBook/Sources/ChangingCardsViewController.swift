//
//  ChangingCardsViewController.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/18/19.
//

import Foundation
import UIKit
import PlaygroundSupport

public class ChangingCardsViewController: UIViewController, PlaygroundLiveViewMessageHandler {
    //joker is the first card on the view. jack is on top and so on.
    public var joker: UIImageView!
    public var jackOfClubs: UIImageView!
    public var queenOfHearts: UIImageView!
    public var queenOfSpades: UIImageView!
    public var kingOfClubs: UIImageView!
    public var containerView: UIView!
    public var titleLabel: UILabel!
    public var questionMark: UIImageView!
    

    
    
    override  public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupContainer()
        addTitleLabel()
    
    }
    
    public func addCardsOnTheView() {
        let jokerImage = UIImage(named: "joker")
        joker = UIImageView(image: jokerImage!)
        view.addSubview(joker)
        
        let jackOfClubsImage = UIImage(named: "jackOfClubs")
        jackOfClubs = UIImageView(image: jackOfClubsImage!)
        view.addSubview(jackOfClubs)
        
        let queenOfHeartsImage = UIImage(named: "queenOfHearts")
        queenOfHearts = UIImageView(image: queenOfHeartsImage)
        view.addSubview(queenOfHearts)
        
        let queenOfSpadesImage = UIImage(named: "queenOfSpades")
        queenOfSpades = UIImageView(image: queenOfSpadesImage)
        view.addSubview(queenOfSpades)
        
        let kingOfClubsImage = UIImage(named: "kingOfClubs")
        kingOfClubs = UIImageView(image: kingOfClubsImage)
        view.addSubview(kingOfClubs)
        
        //joker.alpha = 0
        //queenOfHearts.alpha = 0
        let images = [joker, jackOfClubs, queenOfHearts, queenOfSpades, kingOfClubs]
        for image in images {
            image?.alpha = 0
        }
        addingConstraints(for: joker)
        addingConstraints(for: jackOfClubs)
        addingConstraints(for: queenOfHearts)
        addingConstraints(for: queenOfSpades)
        addingConstraints(for: kingOfClubs)
        
        
    }
    
    
    public func addQuestionMark() {
        let questionMarkImage = UIImage(named: "questionMarkBlur4")
        questionMark = UIImageView(image: questionMarkImage!)
        containerView.addSubview(questionMark)
        questionMark.frame = CGRect(x: view.frame.width / 2 - 189 / 2, y: view.frame.height / 2 - 254 / 2, width: 189, height: 254)
        addingConstraints(for: questionMark)
    }
    public func setupContainer() {
        containerView = UIView(frame: CGRect(x: view.frame.width / 2 - 189 / 2, y: view.frame.height / 2 - 254 / 2, width: 189, height: 254))
        view.addSubview(containerView)
        addingContainerViewConstraints()
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.9
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 10).cgPath
        //addQuestionMark()
        addCardsOnTheView()
    }

    public func addingContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    public  func addingConstraints(for card: UIImageView) {
        card.translatesAutoresizingMaskIntoConstraints = false
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        card.widthAnchor.constraint(equalToConstant: 189).isActive = true
        card.heightAnchor.constraint(equalToConstant: 254).isActive = true
        
    }
    
    public func changeTwoCards() {
        joker.alpha = 1
        UIView.animate(withDuration: 2) {
            self.joker.alpha = 0
            self.queenOfHearts.alpha = 1
        }
    }
    
    public func changeThreeCards() {
        joker.alpha = 1
        UIView.animate(withDuration: 2, animations: {
            self.joker.alpha = 0
            self.queenOfHearts.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.queenOfHearts.alpha = 0
                self.queenOfSpades.alpha = 1
                
            })
        }
    }

    public func changeFourCards() {
        joker.alpha = 1
        UIView.animate(withDuration: 2, animations: {
            self.joker.alpha = 0
            self.queenOfHearts.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.queenOfHearts.alpha = 0
                self.queenOfSpades.alpha = 1
            }, completion: { (true) in
                UIView.animate(withDuration: 2, animations: {
                    self.queenOfSpades.alpha = 0
                    self.kingOfClubs.alpha = 1
                    
                })
            })
        }
    }
    
    public func addTitleLabel() {
        titleLabel = UILabel()
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = " Preparing for color changes!"
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        view.addSubview(titleLabel)
        addConstraintsForTitleLabel()
    }
    
    public func addConstraintsForTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
  
    
    public func receive(_ message: PlaygroundValue) {}
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
}


