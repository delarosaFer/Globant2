
import UIKit

extension SkillsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.skillCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = skillsTableView,
            let skill = presenter?.getSkill(for: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.skills.rawValue) as? SkillsTableViewCell
            else {
                return UITableViewCell()
        }
        
        cell.configureWith(skill: skill)
        
        return cell
    }
}
