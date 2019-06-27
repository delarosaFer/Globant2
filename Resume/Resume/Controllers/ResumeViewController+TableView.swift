
import UIKit

extension ResumeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsPerSection[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .darkColor
        header.layer.cornerRadius = 9
        
        let title = UILabel()
        title.text = sections[section]
        title.textColor = .white
        
        header.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16).isActive = true
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case educationSection:
            guard let cell = infoTableView?.dequeueReusableCell(withIdentifier: "EducationCell", for: indexPath) as? EducationCell, let education = resume?.education else {
                return UITableViewCell()
            }
            
            cell.configureWith(education: education)
            
            return cell
        case experienceSection:
            guard let cell = infoTableView?.dequeueReusableCell(withIdentifier: "ExperienceCell", for: indexPath) as? ExperienceCell, let experience = resume?.experience[indexPath.row] else {
                return UITableViewCell()
            }
            
            cell.configureWith(experience: experience)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
