//
//  AnimationViewController.swift
//  AnimationApp
//
//  Created by Sergey on 03.08.2021.
//

import Spring

class AnimationViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var springAnimationLabel: SpringLabel!
    @IBOutlet weak var nextAnimationButton: SpringButton!
    
    // MARK: - Private Properties
    private let animations = Animation.getAnimations()
    private var currentAnimation = Animation.getDefaultRandomAnimation()
    private var nextAnomation = Animation.getDefaultRandomAnimation()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nextAnimationButton.setTitle("Run → \(currentAnimation.preset.rawValue)",
                                     for: .normal)
    }
    
    // MARK: - IBActions
    @IBAction func nextAnimationButtonTapped(_ sender: SpringButton) {
        buttonClickAnimation(for: sender)
        
        animateWithParameters(animation: currentAnimation)
        nextAnimationButton.setTitle("Run → \(nextAnomation.preset.rawValue)",
                                     for: .normal)
        
        currentAnimation = nextAnomation
        guard let randomAnimation = animations.randomElement() else { return }
        nextAnomation = randomAnimation
    }
    
    // MARK: - Private Methods
    private func animateWithParameters(animation: Animation) {
        springAnimationView.animation = animation.preset.rawValue
        springAnimationView.curve = animation.curve.rawValue
        springAnimationView.force = animation.forse
        springAnimationView.duration = animation.duration
        
        springAnimationLabel.text = """
        animation: \(springAnimationView.animation)
        curve: \(springAnimationView.curve)
        force: \(String(format: "%.2f", springAnimationView.force))
        duration: \(String(format: "%.2f", springAnimationView.duration))
        """
        
        springAnimationView.animate()
    }
    
    private func buttonClickAnimation(for button: SpringButton) {
        button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        SpringButton.animate(withDuration: 0.5,
                             delay: 0,
                             usingSpringWithDamping: 0.5,
                             initialSpringVelocity: 0.5,
                             options: SpringButton.AnimationOptions.allowUserInteraction,
                             animations: {
                                button.transform = CGAffineTransform.identity
                             },
                             completion: nil)
    }

}

