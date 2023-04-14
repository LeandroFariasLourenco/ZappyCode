//
//  CourseTableViewController.swift
//  ZappyCode
//
//  Created by Leandro Farias Lourenco on 07/03/23.
//

import UIKit
import Kingfisher

class CourseTableViewController: UITableViewController {

    var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCourses()
    }
    
    private func getCourses() {
        var request = URLRequest(url: URL(string: "https://zappycode.com/api/courses")!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if error != nil {
                print("There was an error")
                return
            }
            
            if (data == nil) {
                print("Data is empty")
                return
            }
            
            if let courses = try? JSONDecoder().decode([Course].self, from: data!) {
                DispatchQueue.main.async {
                    self.courses = courses
                    self.tableView.reloadData()
                }
            }
        }.resume()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell

        let course = courses[indexPath.row]
        
        cell.titleLabel.text = course.title
        cell.courseImageView.kf.setImage(with: URL(string: course.imageUrl)!)
        cell.subtitleLabel.text = course.subtitle 

        return cell
    }
    
    @IBAction func reloadTapped(_ sender: Any) {
        getCourses()
    }
}
