import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MustC")
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error (error), (error.userInfo)")
            }
        })
        return container
    }()

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
        if let navVC = window?.rootViewController as? UINavigationController,
           /*let initialVC = navVC.viewControllers.first as? FamilyMembersViewController {
            initialVC.persistentContainer = persistentContainer*/
           var currentVC = navVC.topViewController as? PersistentContainerRequiring {
            currentVC.persistentContainer = persistentContainer
        }
		return true
	}
    
    func applicationWillTerminate(_ application: UIApplication) {
        persistentContainer.saveContextIfNeeded()
    }
}

