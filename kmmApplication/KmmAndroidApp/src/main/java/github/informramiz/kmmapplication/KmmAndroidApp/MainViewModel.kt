package github.informramiz.kmmapplication.KmmAndroidApp

import android.app.Application
import android.widget.Toast
import androidx.lifecycle.*
import github.informramiz.kmmapplication.shared.SpaceXSDK
import github.informramiz.kmmapplication.shared.model.db.DatabaseDriverFactory
import kotlinx.coroutines.launch

class MainViewModel(application: Application) : AndroidViewModel(application) {
    private val _viewState = MutableLiveData<MainViewState>()
    val viewState: LiveData<MainViewState> = _viewState

    private val _error = SingleLiveEvent<Exception>()
    val error: LiveData<Exception> = _error

    private val sdk = SpaceXSDK(DatabaseDriverFactory(application))

    fun fetchLaunches(needReload: Boolean) {
        _viewState.value = MainViewState(emptyList(), true)
        viewModelScope.launch {
            kotlin.runCatching {
                sdk.getLaunches(needReload)
            }.onSuccess {
                _viewState.value = MainViewState(it, false)
            }.onFailure {
                _viewState.value = MainViewState(emptyList(), false)
                _error.value = Exception(it)
            }
        }
    }
}
