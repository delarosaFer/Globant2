
protocol TabBarModelType {
    var resume: Resume { get }
}

final class TabBarModel: TabBarModelType {
    let resume: Resume
    
    init(withResume resume: Resume) {
        self.resume = resume
    }
}
