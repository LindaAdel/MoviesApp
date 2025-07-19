//
//  MovieApp.swift
//
//  Created by Linda adel on 20/07/2025.
//

import Foundation
import UIKit
import CoreData

struct DatabaseManager {
    static let shared = DatabaseManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MoviesApp")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading persistent stores: \(error)")
            }
        }
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }
    
    func addFavoriteMatch(with movie: MoviesResultResponse) {
        let context = persistentContainer.viewContext
        
        let movie = MoviesEntity(context: context)

        movie.isFavourite = true

        saveContext()
    }
    
    func removeFavoriteMovie(id: String) {
        let context = persistentContainer.viewContext
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MoviesEntity")
           fetchRequest.predicate = NSPredicate(format: "id == %@", id)
           
           let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
           
           do {
               try context.execute(batchDeleteRequest)
               saveContext()
           } catch {
               print("Error removing favorite item: \(error)")
           }
    }
    
    func isMovieFavorite(id: String) -> Bool {
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<MoviesEntity> = MoviesEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.fetchLimit = 1

        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error checking favorite status: \(error)")
             return false
      }
    }
}
