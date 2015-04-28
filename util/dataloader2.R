prepareAccidents <- function(a) {
    a$date <- as.Date(sprintf('%4s-%02s-%02s', a$YEAR, a$Month, a$Calendar_DAY))
    a$state <- a$State.Abbreviation
    a
}

prepareTrend <- function(t) {
    df <- data.frame(
        year = t$Year,
        fatalities = as.numeric(gsub(',', '', t$Deaths)),
        vmtb = as.numeric(gsub(',', '', t$Vehicle.miles.travelled..billions.)),
        f100Mvmt = as.numeric(gsub(',', '', t$Fatalities.per.100.million.VMT)),
        population = as.numeric(gsub(',', '', t$Population)),
        f100Kpop = as.numeric(gsub(',', '', t$Fatalities.per.100.000.population))
    )
    df
}

loadFatalityDataset <- function(year, rootDir='') {
    ds <- c()
    zipFileName <- paste(rootDir, 'data/NHTSA_Fatality-', year, '.zip', sep='')
    ds$accidents <- read.csv(unz(zipFileName, 'Accident-2013.csv'))
    ds$accidents <- prepareAccidents(ds$accidents)
    
    ds$persons <- read.csv(unz(zipFileName, 'Person-2013.csv'))
    
    ds$vehicles <- read.csv(unz(zipFileName, 'Vehicle-2013.csv'))
    ds$states <- read.csv(paste(rootDir, 'data/states.csv', sep=''))
    ds$states_pop <- read.csv(paste(rootDir, 'data/Vehicle_Registration by State.csv', sep=''))
    ds$avm <- read.csv(paste(rootDir, 'data/annual-vehicle-miles-', year, '.csv', sep=''))
    ds$urbanPct <- read.csv(paste(rootDir, 'data/urban-percent-', year, '.csv', sep=''))
    ds$trend <- read.csv(paste(rootDir, 'data/long-term-trends.csv', sep=''))
    ds$trend <- prepareTrend(ds$trend)
    ds
}


