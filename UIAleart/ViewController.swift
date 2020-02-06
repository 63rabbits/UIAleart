//
//  ViewController.swift
//  UIAleart
//
//  Created by rabbit on 2020/02/02.
//  Copyright © 2020 rabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func button1Action(_ sender: UIButton) {
        pushedButton1(sender)
    }

    @IBAction func button2Action(_ sender: UIButton) {
        pushedButton2(sender)
    }

    @IBAction func button3Action(_ sender: UIButton) {
        pushedButton3(sender)
    }

    @IBAction func button4Action(_ sender: UIButton) {
        pushedButton4(sender)
    }

    @IBAction func button5Action(_ sender: UIButton) {
        pushedButton5(sender)
    }

    var answer:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

}

// MARK: - Alert (Basic)
extension ViewController {
    
    func pushedButton1(_ sender: UIButton) {

        print("pushed Alert(style: alert, 2 Buttons)")
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "アラート"
        alert.message = "２個までのボタンは横に並びます。"

        let okAction = UIAlertAction(title: "OK", style: .default,
            handler: {
                (action: UIAlertAction) -> Void in
                print("OK")
            }
        )

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel,
            handler: {
                (action: UIAlertAction) -> Void in
                print("Cancel")
            }
        )

        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: { print("displayed!!") })

    }
}

// MARK: - Alert (wait proccess)
extension ViewController {

    func pushedButton2(_ sender: UIButton) {

        print("pushed Alert(style: alert, 3 Buttons and wait proc)")
        let alert = UIAlertController(
            title: "アラート",
            message: "３個以上のボタンは縦に並びます。\nこのアラートは裏でプロセスが待ち合わせをしたいます。",
            preferredStyle: .alert)

        self.answer = nil

        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: { action in self.answer = "OK" }))
                                    // Other writing styles : { _ in self.answer = "OK" }
        alert.addAction(UIAlertAction(title: "Unknown", style: .default,
                                      handler:{ action in self.answer = "Unknown" }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,
                                      handler:{ action in self.answer = "Cancel" }))
        self.present(alert, animated: true, completion: { print("displayed!!") })

        // 応答待ち
        while (true) {
//            Thread.sleep(forTimeInterval: 0.1)  // 画面が更新されないので使用しない。
            RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.1))
            print("wait ...")

            if let ans = self.answer {
                print(ans)
                break
            }
        }

    }
}

// MARK: - Alert (with Text Field)
extension ViewController : UITextFieldDelegate {

    func pushedButton3(_ sender: UIButton) {

        print("pushed Alert(style: alert, 2 Buttons and Text Field)")
        let alert = UIAlertController(
            title: "アラート",
            message: "Text Field を追加したアラートです。",
            preferredStyle: .alert)

        alert.addTextField(configurationHandler: {
            (textField) in
            textField.delegate = self
            textField.clearButtonMode = .always
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: {action in print("OK") }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,
                                      handler: { action in print("Cancel") }))
        self.present(alert, animated: true, completion: { print("displayed!!") })

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text!)
    }

}

// MARK: - Action Sheet (use default)
extension ViewController {

    func pushedButton4(_ sender: UIButton) {

        print("pushed Alert(style: actionSheet)")
        // 画面の任意の場所をタッチするとキャンセルがデフォルトで選択されることに注意！！
        let alert = UIAlertController(
            title: "アラート",
            message: "Cancelボタンをデフォルトとしたアラートです。\nアラート以外の場所をタップするとCancelが選択されます。",
            preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: {action in print("OK") }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,
                                      handler: { action in print("Cancel") }))
        self.present(alert, animated: true, completion: { print("displayed!!") })

    }

}

// MARK: - Action Sheet (no default)
extension ViewController {
    func pushedButton5(_ sender: UIButton) {

        print("pushed Alert(style: actionSheet)")
        // 画面の任意の場所をタッチするとキャンセルがデフォルトで選択されることに注意！！
        let alert = UIAlertController(
            title: "アラート",
            message: "デフォルトボタンを指定していないアラートです。",
            preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: {action in print("OK") }))
        alert.addAction(UIAlertAction(title: "Unknown", style: .default,
                                      handler: { action in print("Unknown") }))
        self.present(alert, animated: true, completion: { print("displayed!!") })

    }

}

