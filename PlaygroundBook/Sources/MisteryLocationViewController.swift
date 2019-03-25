//
//  MisteryLocationViewController.swift
//  Book_Sources
//
//  Created by Zarioiu Bogdan on 3/24/19.
//

import UIKit
import PlaygroundSupport

class MisteryLocationViewController: UIViewController, PlaygroundLiveViewMessageHandler {
    
    public var containerView: UIView!
    public var cardBox: UIImageView!
    public var misteryCard: UIImageView!
    public var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupContainer()
        
        
//        addConstraints(for: misteryCard)
//        addConstraints(for: cardBox)


        
        
    }
    
    public func setupContainer() {
        containerView = UIView(frame: CGRect(x: view.frame.width / 2, y: view.frame.height, width: 189, height: 254))
        view.addSubview(containerView)
        addConstraints(for: containerView)
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.9
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 10).cgPath
        addMisteryCardAndCardBox()
  }
    
    public func addConstraints(for view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant: 189).isActive = true
        view.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    public func addMisteryCardAndCardBox() {
        let misteryCardImage = UIImage(named: "joker")
        misteryCard = UIImageView(image: misteryCardImage!)
        containerView.addSubview(misteryCard)
        addConstraints(for: misteryCard)
        
        let cardBoxImage = UIImage(named: "joker")
        cardBox = UIImageView(image: cardBoxImage!)
        containerView.addSubview(cardBox)
        addConstraints(for: cardBox)
        
    }
    
    public func receive(_ message: PlaygroundValue) {
        
    }
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
}
