//
//  UnexoectedTransformationViewController.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/22/19.
//

import UIKit
import PlaygroundSupport

public class UnexpectedTransformationViewController: UIViewController, PlaygroundLiveViewMessageHandler {
   
    public var lemonView: UIImageView!
    public var kingView: UIImageView!
    public var containerView: UIView!
    
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupContainer()
        

    }
    
    
    public func placingCards() {
        let kingImage = UIImage(named: "kingOfClubs")
        kingView = UIImageView(image: kingImage!)
        kingView.contentMode = .scaleAspectFit
        containerView.addSubview(kingView)
        constraintsForJack()
        

        let lemonImage = UIImage(named: "lemon")
        lemonView = UIImageView(image: lemonImage!)
        lemonView.contentMode = .scaleAspectFill
        lemonView.alpha = 0
        containerView.addSubview(lemonView)
        constraintsForLemon()
    

    }

    
    public func setupContainer() {
        containerView = UIView(frame: CGRect(x: view.frame.width / 2 - 189 / 2, y: view.frame.height / 2 - 254 / 2, width: 189, height: 254))
        view.addSubview(containerView)
        addingContainerViewConstraints()
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 10).cgPath
        placingCards()
    }
    
    public func addingContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    public func constraintsForJack() {
        kingView.translatesAutoresizingMaskIntoConstraints = false
        kingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        kingView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        kingView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        kingView.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }

    public func constraintsForLemon() {
        lemonView.translatesAutoresizingMaskIntoConstraints = false
        lemonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lemonView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        lemonView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        lemonView.heightAnchor.constraint(equalToConstant: 254).isActive = true

    }

    public func makeTransformation() {
        UIView.animate(withDuration: 2) {
            self.kingView.alpha = 0
            self.lemonView.alpha = 1
            //self.queenTopView.transform = CGAffineTransform(translationX: 0, y: +55)
            //self.queenBottomView.transform = CGAffineTransform(translationX: 0, y: -55 )
            self.kingView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.lemonView.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 1.3, y: 1.3)


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
