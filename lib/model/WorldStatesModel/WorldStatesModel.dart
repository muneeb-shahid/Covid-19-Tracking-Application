class WorldStatesModel {
  int? _updated;
  int? _cases;
  int? _todayCases;
  int? _deaths;
  int? _todayDeaths;
  int? _recovered;
  int? _todayRecovered;
  int? _active;
  int? _critical;
  int? _casesPerOneMillion;
  double? _deathsPerOneMillion;
  int? _tests;
  double? _testsPerOneMillion;
  int? _population;
  int? _oneCasePerPeople;
  int? _oneDeathPerPeople;
  int? _oneTestPerPeople;
  double? _activePerOneMillion;
  double? _recoveredPerOneMillion;
  double? _criticalPerOneMillion;
  int? _affectedCountries;

  WorldStatesModel(
      {int? updated,
      int? cases,
      int? todayCases,
      int? deaths,
      int? todayDeaths,
      int? recovered,
      int? todayRecovered,
      int? active,
      int? critical,
      int? casesPerOneMillion,
      double? deathsPerOneMillion,
      int? tests,
      double? testsPerOneMillion,
      int? population,
      int? oneCasePerPeople,
      int? oneDeathPerPeople,
      int? oneTestPerPeople,
      double? activePerOneMillion,
      double? recoveredPerOneMillion,
      double? criticalPerOneMillion,
      int? affectedCountries}) {
    if (updated != null) {
      this._updated = updated;
    }
    if (cases != null) {
      this._cases = cases;
    }
    if (todayCases != null) {
      this._todayCases = todayCases;
    }
    if (deaths != null) {
      this._deaths = deaths;
    }
    if (todayDeaths != null) {
      this._todayDeaths = todayDeaths;
    }
    if (recovered != null) {
      this._recovered = recovered;
    }
    if (todayRecovered != null) {
      this._todayRecovered = todayRecovered;
    }
    if (active != null) {
      this._active = active;
    }
    if (critical != null) {
      this._critical = critical;
    }
    if (casesPerOneMillion != null) {
      this._casesPerOneMillion = casesPerOneMillion;
    }
    if (deathsPerOneMillion != null) {
      this._deathsPerOneMillion = deathsPerOneMillion;
    }
    if (tests != null) {
      this._tests = tests;
    }
    if (testsPerOneMillion != null) {
      this._testsPerOneMillion = testsPerOneMillion;
    }
    if (population != null) {
      this._population = population;
    }
    if (oneCasePerPeople != null) {
      this._oneCasePerPeople = oneCasePerPeople;
    }
    if (oneDeathPerPeople != null) {
      this._oneDeathPerPeople = oneDeathPerPeople;
    }
    if (oneTestPerPeople != null) {
      this._oneTestPerPeople = oneTestPerPeople;
    }
    if (activePerOneMillion != null) {
      this._activePerOneMillion = activePerOneMillion;
    }
    if (recoveredPerOneMillion != null) {
      this._recoveredPerOneMillion = recoveredPerOneMillion;
    }
    if (criticalPerOneMillion != null) {
      this._criticalPerOneMillion = criticalPerOneMillion;
    }
    if (affectedCountries != null) {
      this._affectedCountries = affectedCountries;
    }
  }

  int? get updated => _updated;
  set updated(int? updated) => _updated = updated;
  int? get cases => _cases;
  set cases(int? cases) => _cases = cases;
  int? get todayCases => _todayCases;
  set todayCases(int? todayCases) => _todayCases = todayCases;
  int? get deaths => _deaths;
  set deaths(int? deaths) => _deaths = deaths;
  int? get todayDeaths => _todayDeaths;
  set todayDeaths(int? todayDeaths) => _todayDeaths = todayDeaths;
  int? get recovered => _recovered;
  set recovered(int? recovered) => _recovered = recovered;
  int? get todayRecovered => _todayRecovered;
  set todayRecovered(int? todayRecovered) => _todayRecovered = todayRecovered;
  int? get active => _active;
  set active(int? active) => _active = active;
  int? get critical => _critical;
  set critical(int? critical) => _critical = critical;
  int? get casesPerOneMillion => _casesPerOneMillion;
  set casesPerOneMillion(int? casesPerOneMillion) =>
      _casesPerOneMillion = casesPerOneMillion;
  double? get deathsPerOneMillion => _deathsPerOneMillion;
  set deathsPerOneMillion(double? deathsPerOneMillion) =>
      _deathsPerOneMillion = deathsPerOneMillion;
  int? get tests => _tests;
  set tests(int? tests) => _tests = tests;
  double? get testsPerOneMillion => _testsPerOneMillion;
  set testsPerOneMillion(double? testsPerOneMillion) =>
      _testsPerOneMillion = testsPerOneMillion;
  int? get population => _population;
  set population(int? population) => _population = population;
  int? get oneCasePerPeople => _oneCasePerPeople;
  set oneCasePerPeople(int? oneCasePerPeople) =>
      _oneCasePerPeople = oneCasePerPeople;
  int? get oneDeathPerPeople => _oneDeathPerPeople;
  set oneDeathPerPeople(int? oneDeathPerPeople) =>
      _oneDeathPerPeople = oneDeathPerPeople;
  int? get oneTestPerPeople => _oneTestPerPeople;
  set oneTestPerPeople(int? oneTestPerPeople) =>
      _oneTestPerPeople = oneTestPerPeople;
  double? get activePerOneMillion => _activePerOneMillion;
  set activePerOneMillion(double? activePerOneMillion) =>
      _activePerOneMillion = activePerOneMillion;
  double? get recoveredPerOneMillion => _recoveredPerOneMillion;
  set recoveredPerOneMillion(double? recoveredPerOneMillion) =>
      _recoveredPerOneMillion = recoveredPerOneMillion;
  double? get criticalPerOneMillion => _criticalPerOneMillion;
  set criticalPerOneMillion(double? criticalPerOneMillion) =>
      _criticalPerOneMillion = criticalPerOneMillion;
  int? get affectedCountries => _affectedCountries;
  set affectedCountries(int? affectedCountries) =>
      _affectedCountries = affectedCountries;

  WorldStatesModel.fromJson(Map<String, dynamic> json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
    _affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this._updated;
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['todayRecovered'] = this._todayRecovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['casesPerOneMillion'] = this._casesPerOneMillion;
    data['deathsPerOneMillion'] = this._deathsPerOneMillion;
    data['tests'] = this._tests;
    data['testsPerOneMillion'] = this._testsPerOneMillion;
    data['population'] = this._population;
    data['oneCasePerPeople'] = this._oneCasePerPeople;
    data['oneDeathPerPeople'] = this._oneDeathPerPeople;
    data['oneTestPerPeople'] = this._oneTestPerPeople;
    data['activePerOneMillion'] = this._activePerOneMillion;
    data['recoveredPerOneMillion'] = this._recoveredPerOneMillion;
    data['criticalPerOneMillion'] = this._criticalPerOneMillion;
    data['affectedCountries'] = this._affectedCountries;
    return data;
  }
}
