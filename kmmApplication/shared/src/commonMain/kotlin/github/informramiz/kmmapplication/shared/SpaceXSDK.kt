package github.informramiz.kmmapplication.shared

import github.informramiz.kmmapplication.shared.model.db.Database
import github.informramiz.kmmapplication.shared.model.db.DatabaseDriverFactory
import github.informramiz.kmmapplication.shared.model.entities.RocketLaunch
import github.informramiz.kmmapplication.shared.model.network.SpaceXApi

class SpaceXSDK(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = Database(databaseDriverFactory)
    private val api = SpaceXApi()

    @Throws(Exception::class)
    suspend fun getLaunches(forceReload: Boolean): List<RocketLaunch> {
        val cachedLaunches = database.getAllLaunches()
        return if (cachedLaunches.isNotEmpty() && !forceReload) {
            cachedLaunches
        } else {
            api.getAllLaunches().also {
                database.clearDatabase()
                database.createLaunches(it)
            }
        }
    }
}
