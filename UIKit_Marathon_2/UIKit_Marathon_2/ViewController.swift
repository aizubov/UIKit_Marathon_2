//
//  ViewController.swift
//  UIKit_Marathon_2
//
//  Created by user228564 on 3/5/23.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonsSetup()
    }

    
    private func buttonsSetup() {
        
        var config = UIButton.Configuration.filled()
        
        let buttonOne = CustomButton(configuration: config)
        let buttonTwo = CustomButton(configuration: config)
        let buttonThree = CustomButton(configuration: config)
        
        let buttons = [buttonOne, buttonTwo, buttonThree]
        let buttonNames = ["First Button", "Second Medium Button", "Third"]
        
        var yAxisShift = 80.0
        
        for (index, item) in buttons.enumerated() {
            
            let button = item
            view.addSubview(item)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: yAxisShift),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            yAxisShift += 60.0
            
            button.layer.masksToBounds = false
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemBlue
            button.setTitle("\(buttonNames[index])", for: .normal)
            
            if index == 2 {
                button.configurationUpdateHandler = { button in
                    switch button.state {
                    case .normal:
                        let _ = buttons.map {$0.configuration?.baseBackgroundColor = .systemBlue}
                        
                    case .highlighted:
                        let _ : [()] = buttons.map {$0.backgroundColor = .lightGray}
                    default:
                        break
                    }
                }
            }
            
            config.imagePadding = 8
            config.imagePlacement = .trailing
            config.contentInsets = NSDirectionalEdgeInsets(top: 14.0, leading: 10.0, bottom: 14.0, trailing: 10.0)
            
            button.configuration = config
            button.setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
        }
        
        buttonOne.addTarget(self, action: #selector(filler), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(filler), for: .touchUpInside)
        buttonThree.addTarget(self, action: #selector(detailPresent), for: .touchUpInside)
    }

    
    @objc private func filler() {
    }
    
    @objc private func detailPresent() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.modalPresentationStyle = .popover
        present(vc, animated: true)
    }
}

