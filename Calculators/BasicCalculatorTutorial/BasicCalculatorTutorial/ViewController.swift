//
//  ViewController.swift
//  BasicCalculatorTutorial
//
//  Created by 김윤서 on 2/14/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstOperandField: UITextField!
    @IBOutlet weak var secondOperandField: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var operatorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func isValidNumber(_ text: String?) -> Bool {
        guard let text = text, !text.isEmpty, let _ = Double(text) else {
            return false
        }
        return true
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func selectOperator(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let plusAction = UIAlertAction(title: "+ (더하기)", style: .default) { _ in
            self.operatorButton.setTitle("+", for: .normal)}
        actionSheet.addAction(plusAction)
        
        let minusAction = UIAlertAction(title: "- (빼기)", style: .default) { _ in
            self.operatorButton.setTitle("-", for: .normal)}
        actionSheet.addAction(minusAction)
        
        let multiplyAction = UIAlertAction(title: "* (곱하기)", style: .default) { _ in
            self.operatorButton.setTitle("*", for: .normal)}
        actionSheet.addAction(multiplyAction)
        
        let dividedAction = UIAlertAction(title: "/ (나누기)", style: .default) { _ in
            self.operatorButton.setTitle("/", for: .normal)}
        actionSheet.addAction(dividedAction)
        
        present(actionSheet, animated: true)
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        guard let firstText = firstOperandField.text,
              let secondText = secondOperandField.text,
              isValidNumber(firstText), isValidNumber(secondText) else {
            showAlert(title: "입력 오류", message: "숫자를 정확히 입력하세요.")
            return
        }
        
        let a = Double(firstText)!
        let b = Double(secondText)!
        
        let op = operatorButton.title(for: .normal)!
        
        var result: Double?
        
        if op == "+" {
            let result = a + b
            resultLable.text = "\(result)" //String Interpolation
        } else if op == "-" {
            let result = a - b
            resultLable.text = "\(result)"
        } else if op == "*" {
            let result = a * b
            resultLable.text = "\(result)"
        } else if op == "/" {
            if b == 0 {
                showAlert(title: "연산 오류", message: "0으로 나눌 수 없습니다.")
                return
            }
            result = a / b
        } else {
            showAlert(title: "연산자 오류", message: "연산자를 선택하세요.")
        }
        
        resultLable.text = String(format: "%.2f", result!)
    }
    
    
    
}
    
