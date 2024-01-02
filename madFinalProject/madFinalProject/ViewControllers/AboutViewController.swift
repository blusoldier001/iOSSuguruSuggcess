//
//  AboutViewController.swift
//  madFinalProject
//
//  Created by Philip Membrino on 11/13/22.
//

import UIKit

class AboutViewController: UIViewController {
    var aboutSection:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let ruleTextFrame = CGRect(x: view.frame.midX/2, y: view.frame.midY/3-80, width: view.frame.width/2-40, height: 80)
        let ruleWordView = UILabel(frame:ruleTextFrame)
        ruleWordView.text = "Rules:"
        ruleWordView.textAlignment = .center
        view.addSubview(ruleWordView)
        let aboutTextFrame = CGRect(x: view.frame.midX/2, y: view.frame.midY/3-60, width: view.frame.width/2, height: 350)
        let aboutView = UILabel(frame:aboutTextFrame)
        aboutView.text = aboutSection
        aboutView.textAlignment = .left
        aboutView.numberOfLines = 0
        view.addSubview(aboutView)
        let imageFrame = CGRect(x: view.frame.midX/2, y: view.frame.midY/3+350, width: 200, height: 200)
        let imageView = UIImageView(frame: imageFrame)
        imageView.image = UIImage(named: "suguruIcon")
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
