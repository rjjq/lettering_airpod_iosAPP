//
//  ViewController.swift
//  lettering_airpod
//
//  Created by rjjq on 2022/7/25.
//

import UIKit

class ViewController: UIViewController {

    let emoji = ["😀","😊","😆","😂","🤣","😜","😬","😍","😘","🥰","😎","🤩","👍","✌","🤟","👊","♥","💕","★","✨","⚽","🏀","🏈","⚾","👾","🦄","👻","🤖","🐻","🐱","👽","💀","🐯","🐉","🐵","🐶","💩","🐴","🐏","🐇","🐍","🐔","🐖","🐭","🐮","􀀄","􀀅","􀀆","􀀇","􀀈","􀀉","􀀊","􀀋","􀀌","􀀍","􀀎","􀀏","􀀐","􀀑","􀀒","􀀓","􀀔","􀀕","􀀖","􀀗","􀀘","􀀙","􀀚","􀀛","􀀜","􀀝","􀀞","􀀟","􀀠","􀀡","􀀢","􀀣","􀀤","􀀥","􀀦","􀀧","􀀨","􀀩","􀀪","􀀫","􀀬","􀀭","􀀮","􀀯","􀀰","􀀱","􀀲","􀀳","􀀴","􀀵","􀀶","􀀷","􀀸","􀀹","􀀺","􀀻","􀀼","􀀽","􀀾","􀀿","􀁀","􀁁","􀁂","􀁃","􀁄","􀁅","􀁆","􀁇","􀁈","􀁉","􀁊","􀁋","􀓵","􀔔","􀓶","􀔕","􀓷","􀔖","􀓸","􀔗","􀓹","􀔘","􀓺","􀔙","􀓻","􀔚","􀓼","􀔛","􀓽","􀔜","􀓾","􀔝","􀓿","􀔞","􀔀","􀔟","􀔁","􀔠","􀔂","􀔡","􀔃","􀔢","􀔄","􀔣","􀔅","􀔤","􀔆","􀔥","􀔇","􀔦","􀔈","􀔧","􀔉","􀔨","􀘠","􀘡","􀚗","􀚘","􀚙","􀚚","􀚛","􀚜","􀚝","􀚞","􀚟","􀚠","􀚡","􀚢","􀚣","􀚤","􀚥","􀚦","􀚧","􀚨","􀚩","􀚪","􀚫","􀚬","􀚭","􀚮","􀚯","􀚰","􀚱","􀚲","􀚳","􀚴","􀚵","􀚶","􀚷","􀚸","􀚹","􀚺","􀚻","􀚼"]
    
    // 錯誤訊息
    @IBOutlet weak var errorMsg: UILabel!
    // 刻字內容
    @IBOutlet weak var letterText: UILabel!
    // 分頁
    @IBOutlet weak var pageControl: UIPageControl!
    // 清空內容
    @IBOutlet weak var clearBtn: UIButton!
    // 輸入文字
    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearBtn.isHidden = true
    }

    @IBAction func inputLetter(_ sender: UITextField) {
        errorMsg.isHidden = true
        var letter = sender.text!
        // debugPrint(letter.count)
        if letter.count > 0 {
            clearBtn.isHidden = false
        } else {
            clearBtn.isHidden = true
        }
        
        if letter.count < 4 {
            letterText.font = UIFont.systemFont(ofSize: 17)
        } else if letter.count < 8 {
            letterText.font = UIFont.systemFont(ofSize: 14)
        } else {
            letterText.font = UIFont.systemFont(ofSize: 11)
        }
        
        if letter.count > 13 {
            errorMsg.isHidden = false
            letter = String(letter.prefix(13))
        }
        
        letterText.text = letter
        // debugPrint(sender.text!)
    }
    
    @IBAction func changePage(_ sender: UIPageControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0), animated: true)
    }
    
    @IBAction func insertEmoji(_ sender: UIButton) {
        let tag = sender.tag
        inputText.text! += emoji[tag]
        inputLetter(inputText)
        // debugPrint(emoji[tag])
    }
    
    @IBAction func clearContent(_ sender: Any) {
        inputText.text! = ""
        inputLetter(inputText)
    }
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
                pageControl.currentPage = Int(page)
    }
}
