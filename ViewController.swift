//
//  ViewController.swift
//  RPS
//
//  Created by Ryan Chappelle on 8/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        update(currentState: .start)
    }

    
    
    @IBOutlet weak var opponent: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func rock(_ sender: UIButton) {
        play(playerSign: .rock)
    }
    @IBAction func paper(_ sender: UIButton) {
        play(playerSign: .paper)
    }
    @IBAction func scissors(_ sender: UIButton) {
        play(playerSign: .scissors)
    }
    @IBAction func playAgain(_ sender: UIButton) {
        update(currentState: .start)
    }
    
    func update(currentState: gameState) {
        switch currentState {
        case .win: result.text = "You won!"
            view.backgroundColor = .systemMint
        case .lose: result.text = "You lost :("
            view.backgroundColor = .systemPink
        case .draw: result.text = "Tie Game!"
            view.backgroundColor = .systemYellow
        case .start: result.text = ""
            view.backgroundColor = .white
            opponent.text = "🤖"
            playAgain.isHidden = true
            rock.isEnabled = true
            rock.isHidden = false
            paper.isEnabled = true
            paper.isHidden = false
            scissors.isEnabled = true
            scissors.isHidden = false
        }
    }
    
    func play(playerSign: Sign) {
        let opponentSign = randomSign()
        let comparison = playerSign.signComparison(opponent: opponentSign)
        update(currentState: comparison)
        opponent.text = opponentSign.signEmoji
        rock.isEnabled = false
        paper.isEnabled = false
        scissors.isEnabled = false
        switch playerSign {
        case .rock:
            paper.isHidden = true
            scissors.isHidden = true
        case .paper:
            rock.isHidden = true
            scissors.isHidden = true
        case .scissors:
            rock.isHidden = true
            paper.isHidden = true
        }
        playAgain.isHidden = false
    }
}

