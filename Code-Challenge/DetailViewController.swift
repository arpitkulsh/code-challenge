//
//  DetailViewController.swift
//  Code-Challenge
//
//  Created by Helios on 28/07/20.
//  Copyright © 2020 Axxess. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var dataObject: CodeChallengeModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = dataObject!.id
        view.backgroundColor = .white
        if (dataObject!.type == "image")
        {
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRect(x:10, y:50, width: self.view.frame.width - 20, height:300));
            self.view.addSubview(imageView)
            let url: URL = URL.init(string: dataObject!.data)!
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() {
                    imageView.image = UIImage(data: data)
                }
            }
        }
        else
        {
            let label = UILabel(frame: CGRect(x: 20, y: 120, width: self.view.frame.width - 30, height: self.view.frame.height))
            
            label.textAlignment = .left
            label.text = dataObject!.data
            label.numberOfLines = 0
            self.view.addSubview(label)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
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
