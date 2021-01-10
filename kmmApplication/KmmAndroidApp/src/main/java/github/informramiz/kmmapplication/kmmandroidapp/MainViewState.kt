package github.informramiz.kmmapplication.kmmandroidapp

import github.informramiz.kmmapplication.shared.model.entities.RocketLaunch

data class MainViewState(
    val launches: List<RocketLaunch>,
    val isDataLoading: Boolean = false
)
