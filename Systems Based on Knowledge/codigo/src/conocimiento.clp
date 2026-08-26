; Usando la estructura de las clases generadas por la ontología (en "ontologia.clp"), 
; en este archivo se guardan todas las instancias de conocimiento.
;
; Aunque la extensión del archivo resulte ser abrumadora, es sencillo de comprender.
; Cada uno de los apartados empieza por tres líneas comentadas, estando la primera 
; y la tercera vacías, y en la segunda se indica el nombre del ámbito.
; Se puede acceder fácilmente al inicio de cada ámbito buscando estas palabras clave
; (recomendable si se usa un editor que filtre el resultado por las mayúsculas):
;
;    - OBJETIVOS
;    - MEDIOS DE TRANSPORTE
;    - CIUDADES
;    - SITIOS DE INTERÉS
;    - HOTELES
;
; Los objetivos, medios de transporte y ciudades están ordenadas por orden alfabético 
; del nombre de la instancia.
;
; Dentro de los apartados de hoteles y sitios de interés, hay un comentario de una línea
; que indica el nombre de una ciudad. A continuación, están todas las instancias 
; pertenecientes a dicho municipio. Estas instancias agrupadas están ordenadas 
; alfabéticamente en función del nombre de la ciudad.
;
; En el apartado de los hoteles, las instancias pertenecientes a una misma ciudad son 
; ordenadas en función de su comodidad (número de estrellas del hotel).
;
; Dentro de las instancias de una ciudad:
; - la densidad poblacional se refiere al número de habitantes por kilómetro cuadrado.
; - Todos los precios están expresados en euros.
; - El coste de vida de una ciudad se ha expresado como una cadena de texto utilizado esta
;   escala:
;       muy bajo, bajo, medio-bajo, medio, medio-alto, alto, muy alto



;
; OBJETIVOS
;

([Cultural] of objetivo
    (tipo_objetivo  "cultural")
)

([Descanso] of objetivo
    (tipo_objetivo  "descanso")
)

([Romantico] of objetivo
    (tipo_objetivo "romantico")
)



;
; MEDIOS DE TRANSPORTE
;

([Avion] of transporte
    (tipo_transporte  "avion")
)


([Barco] of transporte
    (tipo_transporte  "barco")
)

([Coche] of transporte
    (tipo_transporte  "coche")
)


([Tren] of transporte
    (tipo_transporte  "tren")
)



;
; CIUDADES
;

([Badajoz] of ciudad
    (nombre_ciudad "Badajoz")
    (clima "continental")
    (coste_de_vida "medio-bajo")
    (densidad_poblacional 104)
    (gastronomia "extremeña")
    (tipo_ciudad "regional")

    (dispone_de
        [AlcazabaBadajoz]
        [PuertaDePalmasBadajoz]
        [PlazaAltaBadajoz]
        [CatedralBadajoz]
        [ParqueFluvial]
        [AklaHotelBadajoz]
        [HotelCervantes]
        [HotelRioBadajoz]
        [HotelLasTresCampanas]
        [ACHotelBadajozByMarriott]
        [NHGranHotelCasinoDeExtremadura]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Barcelona] of ciudad
    (nombre_ciudad "Barcelona")
    (clima "mediterráneo")
    (coste_de_vida "medio-alto")
    (densidad_poblacional 16600)
    (gastronomia "mediterránea")
    (tipo_ciudad "cosmopolita")

    (dispone_de
        [SagradaFamilia]
        [ParkGuell]
        [CasaBatllo]
        [ArcTriomf]
        [BarcelonetaBeach]
        [JardinesPalacioPedralbes]
        [HotelInglesBarcelona]
        [HotelBestpriceMaragall]
        [BonanovaPark]
        [HostalBalmesCentro]
        [HotelContinentalBarcelona]
        [GaudiHotel]
        [HotelMadanis]
        [CataloniaRigoletto]
        [HotelWBarcelona]
        [OhlaBarcelona]
        [Avion]
        [Barco]
        [Coche]
        [Tren]
    )
)

([Beijing] of ciudad
    (nombre_ciudad "Beijing")
    (clima "continental")
    (coste_de_vida "medio")
    (densidad_poblacional 1400)
    (gastronomia "china")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [PalacioDeVeranoBeijing]
        [CiudadProhibida]
        [MurallaChina]
        [PlazaDeTiananmen]
        [BeijingXingsheYouthHostel]
        [ForbiddenCityHutongCourtyardBeijing]
        [KellysCourtyardHotel]
        [AnhuiCulturalHotel]
        [LivefortunaHotel]
        [HiltonGardenInnBeijingYizhuang]
        [MumianBeijingDaxingInternationalAirport]
        [DoubleTreeByHiltonBeijing]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Berlin] of ciudad
    (nombre_ciudad "Berlin")
    (clima "continental")
    (coste_de_vida "alto")
    (densidad_poblacional 4200)
    (gastronomia "alemana")
    (tipo_ciudad "capital europea")

    (dispone_de
        [PuertaDeBrandeburgo]
        [Bebelplatz]
        [BerlinerDom]
        [MuseoDePergamo]
        [ParqueTiergarten]
        [HotelPensionCharlottenburg]
        [HotelM68]
        [PensionClassicBerlin]
        [HotelGatPointCharlie]
        [Hotel38]
        [JuneSixHotelBerlinCityWest]
        [ParkInnByRadissonBerlinAlexanderplatz]
        [DasStue]
        [GrandHyattBerlin]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Bruselas] of ciudad
    (nombre_ciudad "Bruselas")
    (clima "atlántico")
    (coste_de_vida "alto")
    (densidad_poblacional 7700)
    (gastronomia "belga")
    (tipo_ciudad "capital internacional")

    (dispone_de
        [GrandPlace]
        [GaleriasSaintHubert]
        [MannekenPis]
        [PuertaDeHalle]
        [JardinMontDesArts]
        [RoyalHotelBruselas]
        [ResidenceHotelLeQuinzeGrandPlaceBrussels]
        [HotelTheMoonBruselas]
        [HotelWindsorBruselas]
        [EasyHotelBrusselsCityCentre]
        [HotelLaGrandeCloche]
        [NumaBrusselsRoyalGalleries]
        [NHCollectionBrusselsCentre]
        [JulianaHotelAndSpaBrusselsCentre]
        [RadissonCollectionGrandPlaceBrussels]
        [Avion]
        [Coche]
        [Tren]
    )
)

([BuenosAires] of ciudad
    (nombre_ciudad "Buenos Aires")
    (clima "subtropical-húmedo")
    (coste_de_vida "bajo")
    (densidad_poblacional 14000)
    (gastronomia "latinoamericana")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [PlazaDeMayo]
        [CatedralBuenosAires]
        [PlanetarioGalileoGalilei]
        [HotelORei]
        [HotelLaGiraldaBuenosAires]
        [HotelFrossard]
        [DiplomatHotel]
        [ElMistiHotelBuenosAiresCentro]
        [UpCentralCordoba]
        [HuinidObeliscoHotel]
        [SuMaRecoletaHotel]
        [HiltonBuenosAires]
        [NHCityBuenosAires]
        [Avion]
        [Barco]
        [Coche]
        [Tren]
    )
)

([Copenhague] of ciudad
    (nombre_ciudad "Copenhague")
    (clima "atlántico")
    (coste_de_vida "muy alto")
    (densidad_poblacional 7500)
    (gastronomia "nórdica")
    (tipo_ciudad "capital cosmopolita")

    (dispone_de
        [CastilloDeRosenborg]
        [JardínBotanicoCopenhague]
        [TorreRedondaCopenhague]
        [CanalNyhavn]
        [JardinesTivoliCopenhague]
        [PalacioDeChristiansborg]
        [CityHotelNebo]
        [WakeupCopenhagenBorgergade]
        [GeneratorCopenhagen]
        [IbsensHotelCopenhague]
        [IbsensHotelCopenhague]
        [WIDEHotelCopenhague]
        [BestWesternHotelHebron]
        [BoutiqueHotelHermanK]
        [AdmiralHotelCopenhagen]
        [Barco]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Damasco] of ciudad
    (nombre_ciudad "Damasco")
    (clima "árido")
    (coste_de_vida "muy bajo")
    (densidad_poblacional 12000)
    (gastronomia "árabe")
    (tipo_ciudad "capital histórica")

    (dispone_de
        [MezquitaOmeyasDamasco]
        [PalacioAzem]
        [MuseoNacionalDeDamasco]
        [MuseoDelSaberTradicionalDamasco]
        [MercadoDeAlHamidiyahDamasco]
        [ShallalatAnjar]
        [LayaliAlShamsHotel]
        [Avion]
        [Coche]
        [Tren]
    )
)

([ElCairo] of ciudad
    (nombre_ciudad "El Cairo")
    (clima "árido")
    (coste_de_vida "muy bajo")
    (densidad_poblacional 2300)
    (gastronomia "árabe")
    (tipo_ciudad "ciudad turística")

    (dispone_de
        [CiudadelaDeSaladino]
        [AlAzharPark]
        [BazarDeJanElJalili]
        [MuseoEgipcioElCairo]
        [IglesiaColganteElCairo]
        [GardenCityPlazaHotel]
        [RegencyInnElCairo]
        [TripleGardenViewHotel]
        [BrothersPyramidsView]
        [GrandDowntownHotelCairo]
        [GardenCityHotelNilePalace]
        [HyattRegencyCairoWest]
        [LeMeridienCairoAirport]
        [Avion]
        [Coche]
        [Tren]
    )
)

([LasVegas] of ciudad
    (nombre_ciudad "Las Vegas")
    (clima "árido")
    (coste_de_vida "medio-alto")
    (densidad_poblacional 1700)
    (gastronomia "fusión internacional")
    (tipo_ciudad "ciudad turística")

    (dispone_de
        [SphereLasVegas]
        [TheStrip]
        [FremontStreet]
        [BungalowsHostelLasVegas]
        [AmericanInnLasVegas]
        [DaysInnByWyndhamLasVegasAirport]
        [Super8ByWyndhamLasVegas]
        [TheCarriageHouse]
        [SereneVegasBoutiqueHotel]
        [TreasureIslandNewYork]
        [MarriottsGrandChateau]
        [CaesarsPalace]
        [RedRockCasino]
        [Avion]
        [Coche]
    )
)

([Lisboa] of ciudad
    (nombre_ciudad "Lisboa")
    (clima "mediterráneo")
    (coste_de_vida "medio")
    (densidad_poblacional 6500)
    (gastronomia "mediterránea")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [CastilloSanJorge]
        [Tranvia28]
        [ArcoDelTriunfoLisboa]
        [MonasterioDeLosJeronimos]
        [PatriaHotelLisboa]
        [HotelDublinLisboa]
        [HotelNazarethLisboa]
        [ImperadorHotelLisboa]
        [HotelBotanicoLisboa]
        [HotelASLisboa]
        [HotelPrincipeAvila]
        [HotelFloridaLisboa]
        [ArtLegacyHotelBaixaChiado]
        [IberostarSelectionLisboa]
        [Avion]
        [Barco]
        [Coche]
        [Tren]
    )
)

([Londres] of ciudad
    (nombre_ciudad "Londres")
    (clima "atlántico")
    (coste_de_vida "muy alto")
    (densidad_poblacional 5600)
    (gastronomia "anglosajona")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [BigBen]
        [AbadiaWestminster]
        [RiverThames]
        [ArrivaHotel]
        [KensingtonGardensHotel]
        [RoyalParkHotel]
        [BritHotelsEarlsCourt]
        [TheResidentCoventGarden]
        [TheBaileysHotelLondonKensington]
        [PanPacificLondon]
        [TheLowndesLondon]
        [Avion]
        [Barco]
        [Coche]
        [Tren]
    )
)

([Madrid] of ciudad
    (nombre_ciudad "Madrid")
    (clima "continental")
    (coste_de_vida "medio")
    (densidad_poblacional 5800)
    (gastronomia "mediterránea")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [MuseoDelPrado]
        [PuertaDeAlcala]
        [ParqueElRetiro]
        [HostalLaCasaDeLaPlaza]
        [HostalMadridSol]
        [HostalSilserranos]
        [HostalBesaya]
        [Hotel101]
        [JardinesBoutiqueMadrid]
        [NHMadridNacional]
        [IkonikGranVia]
        [UMusicHotelMadrid]
        [HotelVillaReal]
        [Avion]
        [Coche]
        [Tren]
    )
)

([NuevaDelhi] of ciudad
    (nombre_ciudad "Nueva Delhi")
    (clima "árido")
    (coste_de_vida "bajo")
    (densidad_poblacional 12000)
    (gastronomia "india")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [TumbaDeHumayun]
        [FuerteRojo]
        [MezquitaJamaMasjid]
        [HotelVVSByAashiyanaGroups]
        [SuperHotelOEastPunjabi]
        [HotelPearlMahipalpurDelhiAirport]
        [HotelSmartPlazaNearDelhiAirport]
        [AirportHotelPremierDelhi]
        [HotelChanchalContinental]
        [TheImperialNewDelhi]
        [HolidayInnNewDelhiAerocityByIHG]
        [Avion]
        [Coche]
        [Tren]
    )
)

([NuevaYork] of ciudad
    (nombre_ciudad "Nueva York")
    (clima "subtropical-húmedo")
    (coste_de_vida "muy alto")
    (densidad_poblacional 11000)
    (gastronomia "fusión internacional")
    (tipo_ciudad "cosmopolita")

    (dispone_de
        [TrumpTower]
        [EmpireState]
        [MoMA]
        [EstatuaDeLaLibertad]
        [KamaCentralPark]
        [USPacificHotelNewYork]
        [AmericanaInnNewYork]
        [CarltonArmsHotel]
        [SpringHillSuitesMarriottNewYork]
        [TownePlaceSuitesMarriottNewYork]
        [ArtezenHotel]
        [OYOTimesSquare]
        [TheWallaceHotel]
        [KimptonHotelEventiByIHG]
        [Barco]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Paris] of ciudad
    (nombre_ciudad "París")
    (clima "atlántico")
    (coste_de_vida "alto")
    (densidad_poblacional 21000)
    (gastronomia "noreuropea")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [TorreEiffel]
        [BibliotecaNacionalFrancia]
        [BasilicaSagradoCorazon]
        [MuseoDelLouvre]
        [HotelDesPyrenees]
        [HotelDesArts]
        [HotelLeonardDeVinci]
        [HotelCISParisMauriceRavel]
        [HotelLaCanopee]
        [HotelAndrea]
        [LesRivesOceanik]
        [WestsideArcDeTriompheHotel]
        [LaDemeureMontaigne]
        [HotelSanRegis]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Roma] of ciudad
    (nombre_ciudad "Roma")
    (clima "mediterráneo")
    (coste_de_vida "medio-alto")
    (densidad_poblacional 2100)
    (gastronomia "mediterránea")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [ColiseoRomano]
        [PlazaDeSanPedro]
        [MuseiVaticani]
        [HotelLazzari]
        [LumiHotelRoma]
        [RadioHotelRoma]
        [HotelGiubileo]
        [HotelDelleCivetteRoma]
        [HotelCorona]
        [BhHotelRoma]
        [HotelVillafrancaRoma]
        [Corso281LuxurySuitesRoma]
        [RomaLuxusHotel]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Sydney] of ciudad
    (nombre_ciudad "Sydney")
    (clima "subtropical-húmedo")
    (coste_de_vida "alto")
    (densidad_poblacional 450)
    (gastronomia "fusión internacional")
    (tipo_ciudad "cosmopolita")

    (dispone_de
        [JardinBotanicoDeSydney]
        [CircularQuay]
        [TheRocks]
        [MuseumOfSydney]
        [TheAlisonRandwick]
        [WynyardHotel]
        [IbisSydneyWorldSquare]
        [HotelHacienda]
        [YEHSHotelSydneyQVB]
        [MegaboomCityHotel]
        [LittleNationalHotelSydney]
        [MeritonSuitesMascotCentral]
        [Barco]
        [Avion]
        [Coche]
        [Tren]
    )
)

([Tokio] of ciudad
    (nombre_ciudad "Tokio")
    (clima "subtropical-húmedo")
    (coste_de_vida "alto")
    (densidad_poblacional 15000)
    (gastronomia "japonesa")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [TemploSensoji]
        [TokyoSkytree]
        [Odaiba]
        [TokyoGuesthouseHIVE]
        [AkasakaGuesthouseHIVE]
        [9hNineHoursSuidobashi]
        [9hNineHoursNingyocho]
        [ELEHotelGinzaEast]
        [HotelNihonbashiSaibo]
        [MercureTokyoHanedaAirport]
        [HotelMontereyHanzomon]
        [HotelIndigoTokyoShibuya]
        [ThePrinceParkTowerTokyo]
        [Avion]
        [Barco]
        [Coche]
        [Tren]
    )
)

([Valencia] of ciudad
    (nombre_ciudad "Valencia")
    (clima "mediterráneo")
    (coste_de_vida "medio")
    (densidad_poblacional 6200)
    (gastronomia "mediterránea")
    (tipo_ciudad "ciudad mediana")

    (dispone_de
        [BarrioDelCarmen]
        [IglesiaSanNicolas]
        [TorresdeSerranos]
        [CasualNaturaValencia]
        [HiValenciaCanovas]
        [HotelBestpriceValencia]
        [SundosFeriaValencia]
        [IlunionValencia3]
        [SweetHotelRenasa]
        [EstimarValencia]
        [HotelMediumValencia]
        [SHValenciaPalace]
        [TheWestinValencia]
        [Avion]
        [Barco]
        [Coche]
        [Tren]
    )
)

([Washington] of ciudad
    (nombre_ciudad "Washington D.C.")
    (clima "subtropical-húmedo")
    (coste_de_vida "alto")
    (densidad_poblacional 4300)
    (gastronomia "estadounidense")
    (tipo_ciudad "capital nacional")

    (dispone_de
        [NationalMall]
        [Smithsonian]
        [Capitolio]
        [ComfortInnDowntownDC]
        [DaysInnWyndhamWashington]
        [TempoByHiltonWashington]
        [HyattPlaceWashington]
        [HotelTabardInn]
        [ARCHotelWashington]
        [TheRoyalSonestaWashington]
        [ConradWashingtonDC]
        [Avion]
        [Coche]
        [Tren]
    )
)



;
; SITIOS DE INTERÉS
;

; Badajoz

([AlcazabaBadajoz] of sitio_interes
    (nombre_sitio_interes "Alcazaba de Badajoz")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([PuertaDePalmasBadajoz] of sitio_interes
    (nombre_sitio_interes "Puerta de Palmas")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

([PlazaAltaBadajoz] of sitio_interes
    (nombre_sitio_interes "Plaza Alta")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso] [Cultural] [Romantico])
)

([CatedralBadajoz] of sitio_interes
    (nombre_sitio_interes "Catedral de Badajoz")
    (precio_sitio_interes 8.00)
    (cumple_con [Cultural])
)

([ParqueFluvial] of sitio_interes
    (nombre_sitio_interes "Parque Fluvial")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso] [Romantico])
)

; Barcelona

([SagradaFamilia] of sitio_interes
    (nombre_sitio_interes "Sagrada Família")
    (precio_sitio_interes 50)
    (cumple_con [Cultural])
)

([ParkGuell] of sitio_interes
    (nombre_sitio_interes "Park Güell")
    (precio_sitio_interes 18)
    (cumple_con [Cultural] [Descanso])
)

([CasaBatllo] of sitio_interes
    (nombre_sitio_interes "Casa Batlló")
    (precio_sitio_interes 29)
    (cumple_con [Cultural])
)

([ArcTriomf] of sitio_interes
    (nombre_sitio_interes "Arc del Triomf")
    (precio_sitio_interes 0)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([BarcelonetaBeach] of sitio_interes
    (nombre_sitio_interes "Platja de la Barceloneta")
    (precio_sitio_interes 0)
    (cumple_con [Descanso])
)

([JardinesPalacioPedralbes] of sitio_interes
    (nombre_sitio_interes "Jardines del Palacio de Pedralbes")
    (precio_sitio_interes 0)
    (cumple_con [Descanso] [Romantico])
)

; Beijing

([PalacioDeVeranoBeijing] of sitio_interes
    (nombre_sitio_interes "Palacio de Verano")
    (precio_sitio_interes 8)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([CiudadProhibida] of sitio_interes
    (nombre_sitio_interes "Ciudad Prohibida")
    (precio_sitio_interes 8)
    (cumple_con [Cultural] [Descanso])
)

([MurallaChina] of sitio_interes
    (nombre_sitio_interes "Gran Muralla China")
    (precio_sitio_interes 8)
    (cumple_con [Cultural])
)

([PlazaDeTiananmen] of sitio_interes
    (nombre_sitio_interes "Plaza de Tiananmén")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

; Berlín

([PuertaDeBrandeburgo] of sitio_interes
    (nombre_sitio_interes "Puerta de Brandeburgo")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

([Bebelplatz] of sitio_interes
    (nombre_sitio_interes "Bebelplatz")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([BerlinerDom] of sitio_interes
    (nombre_sitio_interes "Berliner Dom")
    (precio_sitio_interes 12.00)
    (cumple_con [Cultural])
)

([MuseoDePergamo] of sitio_interes
    (nombre_sitio_interes "Museo de Pérgamo")
    (precio_sitio_interes 16.00)
    (cumple_con [Cultural])
)

([ParqueTiergarten] of sitio_interes
    (nombre_sitio_interes "Parque Tiergarten")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

; Bruselas

([GrandPlace] of sitio_interes
    (nombre_sitio_interes "Grand Place")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

([GaleriasSaintHubert] of sitio_interes
    (nombre_sitio_interes "Galerías Saint Hubert")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

([MannekenPis] of sitio_interes
    (nombre_sitio_interes "Manneken Pis")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([PuertaDeHalle] of sitio_interes
    (nombre_sitio_interes "Puerta de Halle")
    (precio_sitio_interes 8.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([JardinMontDesArts] of sitio_interes
    (nombre_sitio_interes "Jardín Mont des Arts")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

; Buenos Aires

([PlazaDeMayo] of sitio_interes
    (nombre_sitio_interes "Plaza de mayo")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso] [Romantico] [Cultural])
)

([CatedralBuenosAires] of sitio_interes
    (nombre_sitio_interes "Catedral metropolitana de Buenos Aires")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([PlanetarioGalileoGalilei] of sitio_interes
    (nombre_sitio_interes "Planetario Galileo Galilei")
    (precio_sitio_interes 10.00)
    (cumple_con [Cultural])
)

; Copenhague

([CastilloDeRosenborg] of sitio_interes
    (nombre_sitio_interes "Castillo de Rosenborg")
    (precio_sitio_interes 20)
    (cumple_con [Cultural] [Descanso])
)

([JardínBotanicoCopenhague] of sitio_interes
    (nombre_sitio_interes "Jardín Botánico")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([TorreRedondaCopenhague] of sitio_interes
    (nombre_sitio_interes "Torre Redonda")
    (precio_sitio_interes 6)
    (cumple_con [Cultural])
)

([CanalNyhavn] of sitio_interes
    (nombre_sitio_interes "Canal Nyhavn")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso] [Romantico])
)

([JardinesTivoliCopenhague] of sitio_interes
    (nombre_sitio_interes "Jardines Tivoli")
    (precio_sitio_interes 23.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([PalacioDeChristiansborg] of sitio_interes
    (nombre_sitio_interes "Palacio de Christiansborg")
    (precio_sitio_interes 24.00)
    (cumple_con [Cultural])
)

; Damasco

([MezquitaOmeyasDamasco] of sitio_interes
    (nombre_sitio_interes "Mezquita de los Omeyas")
    (precio_sitio_interes 4.00)
    (cumple_con [Cultural])
)

([PalacioAzem] of sitio_interes
    (nombre_sitio_interes "Palacio Azem")
    (precio_sitio_interes 0.20)
    (cumple_con [Cultural])
)

([MuseoNacionalDeDamasco] of sitio_interes
    (nombre_sitio_interes "Museo Nacional de Damasco")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([MuseoDelSaberTradicionalDamasco] of sitio_interes
    (nombre_sitio_interes "Museo del Saber Tradicional")
    (precio_sitio_interes 0.50)
    (cumple_con [Cultural])
)

([MercadoDeAlHamidiyahDamasco] of sitio_interes
    (nombre_sitio_interes "Mercado de Al-Hamidiyah")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

; El Cairo

([CiudadelaDeSaladino] of sitio_interes
    (nombre_sitio_interes "Ciudadela de Saladino")
    (precio_sitio_interes 13.50)
    (cumple_con [Cultural])
)

([AlAzharPark] of sitio_interes
    (nombre_sitio_interes "Al-Azhar Park")
    (precio_sitio_interes 0.90)
    (cumple_con [Cultural] [Romantico] [Descanso])
)

([BazarDeJanElJalili] of sitio_interes
    (nombre_sitio_interes "Bazar de Jan el-Jalili")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([MuseoEgipcioElCairo] of sitio_interes
    (nombre_sitio_interes "Museo Egipcio de El Cairo")
    (precio_sitio_interes 13.05)
    (cumple_con [Cultural])
)

([IglesiaColganteElCairo] of sitio_interes
    (nombre_sitio_interes "Iglesia Colgante")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

; Las Vegas

([SphereLasVegas] of sitio_interes
    (nombre_sitio_interes "Sphere")
    (precio_sitio_interes 250.00)
    (cumple_con [Cultural])
)

([TheStrip] of sitio_interes
    (nombre_sitio_interes "The Strip")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso])
)

([FremontStreet] of sitio_interes
    (nombre_sitio_interes "Fremont Street")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso])
)

; Lisboa

([CastilloSanJorge] of sitio_interes
    (nombre_sitio_interes "Castillo de San Jorge")
    (precio_sitio_interes 8.50)
    (cumple_con [Cultural])
)

([Tranvia28] of sitio_interes
    (nombre_sitio_interes "Tranvía 28")
    (precio_sitio_interes 3.10)
    (cumple_con [Descanso] [Romantico])
)

([ArcoDelTriunfoLisboa] of sitio_interes
    (nombre_sitio_interes "Arco del triunfo")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso])
)

([MonasterioDeLosJeronimos] of sitio_interes
    (nombre_sitio_interes "Monasterio de los Jerónimos")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

; Londres

([BigBen] of sitio_interes
    (nombre_sitio_interes "Big Ben")
    (precio_sitio_interes 41.00)
    (cumple_con [Cultural])
)

([AbadiaWestminster] of sitio_interes
    (nombre_sitio_interes "Abadía de Westminster")
    (precio_sitio_interes 35.59)
    (cumple_con [Cultural])
)

([RiverThames] of sitio_interes
    (nombre_sitio_interes "Río Támesis")
    (precio_sitio_interes 0)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

; Madrid

([MuseoDelPrado] of sitio_interes
    (nombre_sitio_interes "Museo del Prado")
    (precio_sitio_interes 15)
    (cumple_con [Cultural])
)

([PuertaDeAlcala] of sitio_interes
    (nombre_sitio_interes "Puerta de alcalá")
    (precio_sitio_interes 0)
    (cumple_con [Cultural] [Descanso])
)

([ParqueElRetiro] of sitio_interes
    (nombre_sitio_interes "El Retiro")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

; Nueva Delhi

([TumbaDeHumayun] of sitio_interes
    (nombre_sitio_interes "Tumba de Humayun")
    (precio_sitio_interes 6)
    (cumple_con [Cultural])
)

([FuerteRojo] of sitio_interes
    (nombre_sitio_interes "Fuerte Rojo")
    (precio_sitio_interes 3)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

([MezquitaJamaMasjid] of sitio_interes
    (nombre_sitio_interes "Mezquita Jama Masjid")
    (precio_sitio_interes 0.30)
    (cumple_con [Cultural])
)

; Nueva York

([TrumpTower] of sitio_interes
    (nombre_sitio_interes "Trump Tower")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso])
)

([EmpireState] of sitio_interes
    (nombre_sitio_interes "Empire State")
    (precio_sitio_interes 39)
    (cumple_con [Descanso] [Cultural])
)

([MoMA] of sitio_interes
    (nombre_sitio_interes "MoMA")
    (precio_sitio_interes 27)
    (cumple_con [Cultural])
)

([EstatuaDeLaLibertad] of sitio_interes
    (nombre_sitio_interes "Estatua de la Libertad")
    (precio_sitio_interes 22.20)
    (cumple_con [Cultural] [Descanso] [Romantico])
)

; París

([TorreEiffel] of sitio_interes
    (nombre_sitio_interes "Torre Eiffel")
    (precio_sitio_interes 23.30)
    (cumple_con [Romantico] [Descanso] [Cultural])
)

([BibliotecaNacionalFrancia] of sitio_interes
    (nombre_sitio_interes "Biblioteca Nacional de Francia")
    (precio_sitio_interes 0)
    (cumple_con [Cultural])
)

([BasilicaSagradoCorazon] of sitio_interes
    (nombre_sitio_interes "Basílica Sagrado Corazón")
    (precio_sitio_interes 0)
    (cumple_con [Cultural])
)

([MuseoDelLouvre] of sitio_interes
    (nombre_sitio_interes "Museo del Louvre")
    (precio_sitio_interes 12.00)
    (cumple_con [Cultural])
)

; Roma

([ColiseoRomano] of sitio_interes
    (nombre_sitio_interes "Coliseo Romano")
    (precio_sitio_interes 18)
    (cumple_con [Cultural] [Descanso])
)

([PlazaDeSanPedro] of sitio_interes
    (nombre_sitio_interes "Plaza de San Pedro")
    (precio_sitio_interes 0)
    (cumple_con [Cultural] [Descanso])
)

([MuseiVaticani] of sitio_interes
    (nombre_sitio_interes "Capilla Sixtina y museo")
    (precio_sitio_interes 25)
    (cumple_con [Cultural])
)

; Sydney

([JardinBotanicoDeSydney] of sitio_interes
    (nombre_sitio_interes "Jardín botánico de Sydney")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso] [Romantico] [Cultural])
)

([CircularQuay] of sitio_interes
    (nombre_sitio_interes "Circular Quay")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso] [Romantico])
)

([TheRocks] of sitio_interes
    (nombre_sitio_interes "The Rocks")
    (precio_sitio_interes 0.00)
    (cumple_con [Descanso])
)

([MuseumOfSydney] of sitio_interes
    (nombre_sitio_interes "Museum of Sydney")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

; Tokio

([TemploSensoji] of sitio_interes
    (nombre_sitio_interes "Templo Sensoji")
    (precio_sitio_interes 6.00)
    (cumple_con [Cultural])
)

([TokyoSkytree] of sitio_interes
    (nombre_sitio_interes "Tokyo Skytree")
    (precio_sitio_interes 18)
    (cumple_con [Cultural] [Descanso])
)

([Odaiba] of sitio_interes
    (nombre_sitio_interes "Odaiba")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Romantico] [Descanso])
)

; Valencia

([BarrioDelCarmen] of sitio_interes
    (nombre_sitio_interes "Barrio del Carmen")
    (precio_sitio_interes 0)
    (cumple_con [Descanso] [Descanso])
)

([IglesiaSanNicolas] of sitio_interes
    (nombre_sitio_interes "Iglesia de San Nicolás")
    (precio_sitio_interes 18)
    (cumple_con [Cultural])
)

([TorresdeSerranos] of sitio_interes
    (nombre_sitio_interes "Torres de Serranos")
    (precio_sitio_interes 2)
    (cumple_con [Cultural])
)

; Washington

([NationalMall] of sitio_interes
    (nombre_sitio_interes "National Mall")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([Smithsonian] of sitio_interes
    (nombre_sitio_interes "Smithsonian")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural])
)

([Capitolio] of sitio_interes
    (nombre_sitio_interes "Capitolio")
    (precio_sitio_interes 0.00)
    (cumple_con [Cultural] [Romantico] [Descanso])
)



;
; HOTELES
;

; Badajoz

([AklaHotelBadajoz] of alojamiento
    (nombre_alojamiento "Akla Hotel Badajoz")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 74.60)
)

([HotelCervantes] of alojamiento
    (nombre_alojamiento "Hotel Cervantes")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 45)
)

([HotelRioBadajoz] of alojamiento
    (nombre_alojamiento "Hotel Rio Badajoz")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 94)
)

([HotelLasTresCampanas] of alojamiento
    (nombre_alojamiento "Hotel Las Tres Campanas")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 125)
)

([ACHotelBadajozByMarriott] of alojamiento
    (nombre_alojamiento "AC Hotel Badajoz by Marriott")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 99)
)

([NHGranHotelCasinoDeExtremadura] of alojamiento
    (nombre_alojamiento "NH Gran Hotel Casino de Extremadura")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 94)
)

; Barcelona

([HotelInglesBarcelona] of alojamiento
    (nombre_alojamiento "Hotel Inglés")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 98.00)
)

([HotelBestpriceMaragall] of alojamiento
    (nombre_alojamiento "HOTEL BESTPRICE Maragall")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 88.00)
)

([BonanovaPark] of alojamiento
    (nombre_alojamiento "Bonanova Park")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 100.00)
)

([HostalBalmesCentro] of alojamiento
    (nombre_alojamiento "Hostal Balmes Centro")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 92.00)
)

([HotelContinentalBarcelona] of alojamiento
    (nombre_alojamiento "Hotel Continental")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 178.00)
)

([GaudiHotel] of alojamiento
    (nombre_alojamiento "Gaudi Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 113.00)
)

([HotelMadanis] of alojamiento
    (nombre_alojamiento "Hotel Madanis")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 113.00)
)

([CataloniaRigoletto] of alojamiento
    (nombre_alojamiento "Catalonia Rigoletto")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 119)
)

([HotelWBarcelona] of alojamiento
    (nombre_alojamiento "W Barcelona")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 533.00)
)

([OhlaBarcelona] of alojamiento
    (nombre_alojamiento "Ohla Barcelona")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 591)
)

; Beijing

([BeijingXingsheYouthHostel] of alojamiento
    (nombre_alojamiento "Beijing Xingshe Youth Hostel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 12)
)

([ForbiddenCityHutongCourtyardBeijing] of alojamiento
    (nombre_alojamiento "Forbidden City Hutong Courtyard Beijing")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 32)
)

([KellysCourtyardHotel] of alojamiento
    (nombre_alojamiento "Kelly's Courtyard Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 60.02)
)

([AnhuiCulturalHotel] of alojamiento
    (nombre_alojamiento "Anhui Cultural Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 37)
)

([LivefortunaHotel] of alojamiento
    (nombre_alojamiento "Livefortuna Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 76.90)
)

([HiltonGardenInnBeijingYizhuang] of alojamiento
    (nombre_alojamiento "Hilton Garden Inn Beijing Yizhuang")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 63)
)

([MumianBeijingDaxingInternationalAirport] of alojamiento
    (nombre_alojamiento "Mumian Beijing Daxing International Airport, part of Hyatt")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 92)
)

([DoubleTreeByHiltonBeijing] of alojamiento
    (nombre_alojamiento "DoubleTree by Hilton Beijing")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 71)
)

; Berlin

([HotelPensionCharlottenburg] of alojamiento
    (nombre_alojamiento "Hotel-Pension Charlottenburg")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 150)
)

([HotelM68] of alojamiento
    (nombre_alojamiento "Hotel M68")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 48)
)

([PensionClassicBerlin] of alojamiento
    (nombre_alojamiento "Pension Classic")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 75)
)

([HotelGatPointCharlie] of alojamiento
    (nombre_alojamiento "Hotel Gat Point Charlie")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 63)
)

([Hotel38] of alojamiento
    (nombre_alojamiento "Hotel 38")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 72)
)

([JuneSixHotelBerlinCityWest] of alojamiento
    (nombre_alojamiento "June Six Hotel Berlin City West")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 83)
)

([ParkInnByRadissonBerlinAlexanderplatz] of alojamiento
    (nombre_alojamiento "Park Inn by Radisson Berlin Alexanderplatz")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 96)
)

([DasStue] of alojamiento
    (nombre_alojamiento "Das Stue")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 372)
)

([GrandHyattBerlin] of alojamiento
    (nombre_alojamiento "Grand Hyatt Berlin")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 214)
)

; Bruselas

([RoyalHotelBruselas] of alojamiento
    (nombre_alojamiento "Royal Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 56)
)

([ResidenceHotelLeQuinzeGrandPlaceBrussels] of alojamiento
    (nombre_alojamiento "Résidence-Hotel Le Quinze Grand Place Brussels")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 159)
)

([HotelTheMoonBruselas] of alojamiento
    (nombre_alojamiento "Hotel The Moon")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 80)
)

([HotelWindsorBruselas] of alojamiento
    (nombre_alojamiento "Hotel Windsor")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 76)
)

([EasyHotelBrusselsCityCentre] of alojamiento
    (nombre_alojamiento "easyHotel Brussels City Centre")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 83)
)

([HotelLaGrandeCloche] of alojamiento
    (nombre_alojamiento "Hotel La Grande Cloche")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 96)
)

([NumaBrusselsRoyalGalleries] of alojamiento
    (nombre_alojamiento "Numa Brussels Royal Galleries")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 128)
)

([NHCollectionBrusselsCentre] of alojamiento
    (nombre_alojamiento "NH Collection Brussels Centre")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 156)
)

([JulianaHotelAndSpaBrusselsCentre] of alojamiento
    (nombre_alojamiento "Juliana Hotel & Spa - Brussels Centre")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 361)
)

([RadissonCollectionGrandPlaceBrussels] of alojamiento
    (nombre_alojamiento "Radisson Collection Grand Place Brussels")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 221)
)

; Buenos Aires

([HotelORei] of alojamiento
    (nombre_alojamiento "Hotel O'Rei")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 22)
)

([HotelLaGiraldaBuenosAires] of alojamiento
    (nombre_alojamiento "Hotel La Giralda")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 34)
)

([HotelFrossard] of alojamiento
    (nombre_alojamiento "Hotel Frossard")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 45)
)

([DiplomatHotel] of alojamiento
    (nombre_alojamiento "Diplomat Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 48)
)

([ElMistiHotelBuenosAiresCentro] of alojamiento
    (nombre_alojamiento "El Misti Hotel Buenos Aires Centro")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 37)
)

([UpCentralCordoba] of alojamiento
    (nombre_alojamiento "Up Central Córdoba")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 39)
)

([HuinidObeliscoHotel] of alojamiento
    (nombre_alojamiento "Huinid Obelisco Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 82.67)
)

([SuMaRecoletaHotel] of alojamiento
    (nombre_alojamiento "SuMa Recoleta Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 54)
)

([HiltonBuenosAires] of alojamiento
    (nombre_alojamiento "Hilton Buenos Aires")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 205.03)
)

([NHCityBuenosAires] of alojamiento
    (nombre_alojamiento "NH City Buenos Aires")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 96)
)

; Copenhague

([CityHotelNebo] of alojamiento
    (nombre_alojamiento "City Hotel Nebo")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 63)
)

([WakeupCopenhagenBorgergade] of alojamiento
    (nombre_alojamiento "Wakeup Copenhagen - Borgergade")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 118)
)

([GeneratorCopenhagen] of alojamiento
    (nombre_alojamiento "Generator Copenhagen")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 27)
)

([IbsensHotelCopenhague] of alojamiento
    (nombre_alojamiento "Ibsens Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 171)
)

([WIDEHotelCopenhague] of alojamiento
    (nombre_alojamiento "WIDE Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 232)
)

([BestWesternHotelHebron] of alojamiento
    (nombre_alojamiento "Best Western Hotel Hebron")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 149)
)

([BoutiqueHotelHermanK] of alojamiento
    (nombre_alojamiento "Boutique Hotel Herman K")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 454)
)

([AdmiralHotelCopenhagen] of alojamiento
    (nombre_alojamiento "Admiral Hotel Copenhagen")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 341)
)

; Damasco

([ShallalatAnjar] of alojamiento
    (nombre_alojamiento "Hotel and Restaurant Shallalat Anjar")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 66)
)

([LayaliAlShamsHotel] of alojamiento
    (nombre_alojamiento "Layali Al Shams Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 66)
)

; El Cairo

([GardenCityPlazaHotel] of alojamiento
    (nombre_alojamiento "Garden City Plaza Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 60.25)
)

([RegencyInnElCairo] of alojamiento
    (nombre_alojamiento "Regency inn")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 17)
)

([TripleGardenViewHotel] of alojamiento
    (nombre_alojamiento "Triple garden view hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 57.14)
)

([BrothersPyramidsView] of alojamiento
    (nombre_alojamiento "Brothers Pyramids View")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 21.98)
)

([GrandDowntownHotelCairo] of alojamiento
    (nombre_alojamiento "Grand Downtown Hotel Cairo")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 119)
)

([GardenCityHotelNilePalace] of alojamiento
    (nombre_alojamiento "Garden City Hotel Nile-Palace")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 87)
)

([HyattRegencyCairoWest] of alojamiento
    (nombre_alojamiento "Hyatt Regency Cairo West")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 183.53)
)

([LeMeridienCairoAirport] of alojamiento
    (nombre_alojamiento "Le Meridien Cairo Airport")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 133)
)

; Las Vegas

([BungalowsHostelLasVegas] of alojamiento
    (nombre_alojamiento "Bungalows Hostel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 30)
)

([AmericanInnLasVegas] of alojamiento
    (nombre_alojamiento "American Inn")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 272)
)

([DaysInnByWyndhamLasVegasAirport] of alojamiento
    (nombre_alojamiento "Days Inn by Wyndham Las Vegas Airport Near the Strip")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 147)
)

([Super8ByWyndhamLasVegas] of alojamiento
    (nombre_alojamiento "Super 8 by Wyndham Las Vegas North Strip/Fremont St. Area")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 75)
)

([TheCarriageHouse] of alojamiento
    (nombre_alojamiento "The Carriage House")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 90.32)
)

([SereneVegasBoutiqueHotel] of alojamiento
    (nombre_alojamiento "Serene Vegas Boutique Hotel Las Vegas")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 109)
)

([TreasureIslandNewYork] of alojamiento
    (nombre_alojamiento "Treasure Island - TI Las Vegas Hotel & Casino")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 151)
)

([MarriottsGrandChateau] of alojamiento
    (nombre_alojamiento "Marriott's Grand Chateau")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 488)
)

([CaesarsPalace] of alojamiento
    (nombre_alojamiento "Caesars Palace")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 444)
)

([RedRockCasino] of alojamiento
    (nombre_alojamiento "Red Rock Casino Resort & Spa")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 262)
)

; Lisboa

([PatriaHotelLisboa] of alojamiento
    (nombre_alojamiento "Patria Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 99)
)

([HotelDublinLisboa] of alojamiento
    (nombre_alojamiento "Hotel Dublin")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 133)
)

([HotelNazarethLisboa] of alojamiento
    (nombre_alojamiento "Hotel Nazareth")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 88)
)

([ImperadorHotelLisboa] of alojamiento
    (nombre_alojamiento "Imperador Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 104)
)

([HotelBotanicoLisboa] of alojamiento
    (nombre_alojamiento "Hotel Botanico")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 89)
)

([HotelASLisboa] of alojamiento
    (nombre_alojamiento "Hotel A.S. Lisboa")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 108)
)

([HotelPrincipeAvila] of alojamiento
    (nombre_alojamiento "Hotel Principe Avila")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 107.45)
)

([HotelFloridaLisboa] of alojamiento
    (nombre_alojamiento "Hotel Florida")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 115)
)

([ArtLegacyHotelBaixaChiado] of alojamiento
    (nombre_alojamiento "Art Legacy Hotel Baixa-Chiado")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 344.60)
)

([IberostarSelectionLisboa] of alojamiento
    (nombre_alojamiento "Iberostar Selection Lisboa")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 220)
)

; Londres

([ArrivaHotel] of alojamiento
    (nombre_alojamiento "Arriva Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 83)
)

([KensingtonGardensHotel] of alojamiento
    (nombre_alojamiento "Kensington Gardens Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 99)
)

([RoyalParkHotel] of alojamiento
    (nombre_alojamiento "Royal Park Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 80)
)

([BritHotelsEarlsCourt] of alojamiento
    (nombre_alojamiento "Brit Hotels Earls Court")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 92)
)

([TheResidentCoventGarden] of alojamiento
    (nombre_alojamiento "The Resident Covent Garden")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 416)
)

([TheBaileysHotelLondonKensington] of alojamiento
    (nombre_alojamiento "The Bailey's Hotel London Kensington")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 238)
)

([PanPacificLondon] of alojamiento
    (nombre_alojamiento "Pan Pacific London")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 485.75)
)

([TheLowndesLondon] of alojamiento
    (nombre_alojamiento "The Lowndes London - A Jumeirah Partner Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 509)
)

; Madrid

([HostalLaCasaDeLaPlaza] of alojamiento
    (nombre_alojamiento "Hostal La Casa de La Plaza")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 44)
)

([HostalMadridSol] of alojamiento
    (nombre_alojamiento "Hostal Madrid Sol")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 80)
)

([HostalSilserranos] of alojamiento
    (nombre_alojamiento "Hostal Silserranos")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 79)
)

([HostalBesaya] of alojamiento
    (nombre_alojamiento "Hostal Besaya")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 64)
)

([Hotel101] of alojamiento
    (nombre_alojamiento "Hotel101")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 104)
)

([JardinesBoutiqueMadrid] of alojamiento
    (nombre_alojamiento "Jardines Boutique")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 108)
)

([NHMadridNacional] of alojamiento
    (nombre_alojamiento "NH Madrid Nacional")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 200)
)

([IkonikGranVia] of alojamiento
    (nombre_alojamiento "Ikonik Gran Vía")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 300)
)

([UMusicHotelMadrid] of alojamiento
    (nombre_alojamiento "UMusic Hotel Madrid")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 285)
)

([HotelVillaReal] of alojamiento
    (nombre_alojamiento "Hotel Villa Real")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 230)
)

; Nueva Delhi

([HotelVVSByAashiyanaGroups] of alojamiento
    (nombre_alojamiento "Hotel VVS By Aashiyana Groups")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 8)
)

([SuperHotelOEastPunjabi] of alojamiento
    (nombre_alojamiento "Super Hotel O East Punjabi Bagh")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 8)

)

([HotelPearlMahipalpurDelhiAirport] of alojamiento
    (nombre_alojamiento "Hotel Pearl - Mahipalpur Delhi Airport")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 17)
)

([HotelSmartPlazaNearDelhiAirport] of alojamiento
    (nombre_alojamiento "Hotel Smart Plaza-Near Delhi Airport")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 20)
)

([AirportHotelPremierDelhi] of alojamiento
    (nombre_alojamiento "Airport Hotel Premier Delhi")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 55.88)
)

([HotelChanchalContinental] of alojamiento
    (nombre_alojamiento "Hotel Chanchal Continental")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 10)
)

([TheImperialNewDelhi] of alojamiento
    (nombre_alojamiento "The Imperial")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 179.74)
)

([HolidayInnNewDelhiAerocityByIHG] of alojamiento
    (nombre_alojamiento "Holiday Inn New Delhi Aerocity by IHG")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 73)
)

; Nueva York

([KamaCentralPark] of alojamiento
    (nombre_alojamiento "KAMA CENTRAL PARK")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 83)
)

([USPacificHotelNewYork] of alojamiento
    (nombre_alojamiento "U.S. Pacific Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 105)
)

([AmericanaInnNewYork] of alojamiento
    (nombre_alojamiento "Americana Inn")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 125)
)

([CarltonArmsHotel] of alojamiento
    (nombre_alojamiento "Carlton Arms Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 138)
)

([SpringHillSuitesMarriottNewYork] of alojamiento
    (nombre_alojamiento "SpringHill Suites by Marriott New York Midtown Manhattan/Park Ave")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 259)
)

([TownePlaceSuitesMarriottNewYork] of alojamiento
    (nombre_alojamiento "TownePlace Suites by Marriott New York Manhattan/Chelsea")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 205)
)

([ArtezenHotel] of alojamiento
    (nombre_alojamiento "Artezen Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 202.37)
)

([OYOTimesSquare] of alojamiento
    (nombre_alojamiento "OYO Times Square")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 183)
)

([TheWallaceHotel] of alojamiento
    (nombre_alojamiento "The Wallace Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 481.55)
)

([KimptonHotelEventiByIHG] of alojamiento
    (nombre_alojamiento "Kimpton Hotel Eventi by IHG")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 252)
)

; París

([HotelDesPyrenees] of alojamiento
    (nombre_alojamiento "Hotel des Pyrénées")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 71)
)

([HotelDesArts] of alojamiento
    (nombre_alojamiento "Hotel Des Arts")
    (comodidad_alojamiento "1*")
    (precio_alojamiento 58)
)

([HotelLeonardDeVinci] of alojamiento
    (nombre_alojamiento "Hotel Leonard De Vinci 75011")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 87)
)

([HotelCISParisMauriceRavel] of alojamiento
    (nombre_alojamiento "Hotel CIS Paris Maurice Ravel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 66)
)

([HotelLaCanopee] of alojamiento
    (nombre_alojamiento "Hôtel La Canopée")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 282.06)
)

([HotelAndrea] of alojamiento
    (nombre_alojamiento "Hotel Andréa")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 127)
)

([LesRivesOceanik] of alojamiento
    (nombre_alojamiento "Les Rives Oceanik")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 288.90)
)

([WestsideArcDeTriompheHotel] of alojamiento
    (nombre_alojamiento "Westside Arc de Triomphe Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 116)
)

([LaDemeureMontaigne] of alojamiento
    (nombre_alojamiento "La Demeure Montaigne")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 822)
)

([HotelSanRegis] of alojamiento
    (nombre_alojamiento "Hôtel San Régis")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 894)
)

; Roma

([HotelLazzari] of alojamiento
    (nombre_alojamiento "Hotel Lazzari")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 94)
)

([LumiHotelRoma] of alojamiento
    (nombre_alojamiento "Lumi Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 164)
)

([RadioHotelRoma] of alojamiento
    (nombre_alojamiento "Radio Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 91)
)

([HotelGiubileo] of alojamiento
    (nombre_alojamiento "Hotel Giubileo")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 125)
)

([HotelDelleCivetteRoma] of alojamiento
    (nombre_alojamiento "HOTEL DELLE CIVETTE")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 111)
)

([HotelCorona] of alojamiento
    (nombre_alojamiento "Hotel Corona")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 125)
)

([BhHotelRoma] of alojamiento
    (nombre_alojamiento "BH Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 296.40)
)

([HotelVillafrancaRoma] of alojamiento
    (nombre_alojamiento "Hotel Villafranca")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 141)
)

([Corso281LuxurySuitesRoma] of alojamiento
    (nombre_alojamiento "Corso 281 Luxury Suites")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 517)
)

([RomaLuxusHotel] of alojamiento
    (nombre_alojamiento "Roma Luxus Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 744)
)

; Sydney

([TheAlisonRandwick] of alojamiento
    (nombre_alojamiento "The Alison Randwick")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 76)
)

([WynyardHotel] of alojamiento
    (nombre_alojamiento "Wynyard Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 103)
)

([IbisSydneyWorldSquare] of alojamiento
    (nombre_alojamiento "ibis Sydney World Square")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 95)
)

([HotelHacienda] of alojamiento
    (nombre_alojamiento "Hotel Hacienda")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 83)
)

([YEHSHotelSydneyQVB] of alojamiento
    (nombre_alojamiento "YEHS Hotel Sydney QVB")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 97)
)

([MegaboomCityHotel] of alojamiento
    (nombre_alojamiento "Megaboom City Hotel")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 96)
)

([LittleNationalHotelSydney] of alojamiento
    (nombre_alojamiento "Little National Hotel Sydney")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 208.84)
)

([MeritonSuitesMascotCentral] of alojamiento
    (nombre_alojamiento "Meriton Suites Mascot Central")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 107.66)
)

; Tokio

([TokyoGuesthouseHIVE] of alojamiento
    (nombre_alojamiento "Tokyo Guesthouse HIVE")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 15)
)

([AkasakaGuesthouseHIVE] of alojamiento
    (nombre_alojamiento "Akasaka Guesthouse HIVE")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 22)
)

([9hNineHoursSuidobashi] of alojamiento
    (nombre_alojamiento "9h nine hours Suidobashi")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 23)
)

([9hNineHoursNingyocho] of alojamiento
    (nombre_alojamiento "9h nine hours Ningyocho")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 25)
)

([ELEHotelGinzaEast] of alojamiento
    (nombre_alojamiento "ELE Hotel Ginza East")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 54)
)

([HotelNihonbashiSaibo] of alojamiento
    (nombre_alojamiento "Hotel Nihonbashi Saibo")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 55)
)

([MercureTokyoHanedaAirport] of alojamiento
    (nombre_alojamiento "Mercure Tokyo Haneda Airport")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 70.21)
)

([HotelMontereyHanzomon] of alojamiento
    (nombre_alojamiento "Hotel Monterey Hanzomon")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 88)
)

([HotelIndigoTokyoShibuya] of alojamiento
    (nombre_alojamiento "Hotel Indigo Tokyo Shibuya")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 294.94)
)

([ThePrinceParkTowerTokyo] of alojamiento
    (nombre_alojamiento "The Prince Park Tower Tokyo")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 479)
)

; Valencia

([CasualNaturaValencia] of alojamiento
    (nombre_alojamiento "Casual Natura Valencia by Casual Hoteles")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 91)
)

([HiValenciaCanovas] of alojamiento
    (nombre_alojamiento "Hi Valencia Canovas")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "1*")
    (precio_alojamiento 83)
)

([HotelBestpriceValencia] of alojamiento
    (nombre_alojamiento "Hotel BESTPRICE Valencia")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 95)
)

([SundosFeriaValencia] of alojamiento
    (nombre_alojamiento "SUNDOS Feria Valencia")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 59)
)

([IlunionValencia3] of alojamiento
    (nombre_alojamiento "Ilunion Valencia 3")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 96)
)

([SweetHotelRenasa] of alojamiento
    (nombre_alojamiento "Sweet Hotel Renasa")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 104)
)

([EstimarValencia] of alojamiento
    (nombre_alojamiento "ESTIMAR Valencia")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 223)
)

([HotelMediumValencia] of alojamiento
    (nombre_alojamiento "Hotel Medium Valencia")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 113)
)

([SHValenciaPalace] of alojamiento
    (nombre_alojamiento "SH Valencia Palace")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 216)
)

([TheWestinValencia] of alojamiento
    (nombre_alojamiento "The Westin Valencia")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 308)
)

; Washington

([ComfortInnDowntownDC] of alojamiento
    (nombre_alojamiento "Comfort Inn Downtown DC")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 169)
)

([DaysInnWyndhamWashington] of alojamiento
    (nombre_alojamiento "Days Inn by Wyndham Washington DC/Connecticut Avenue")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "2*")
    (precio_alojamiento 157)
)

([TempoByHiltonWashington] of alojamiento
    (nombre_alojamiento "Tempo By Hilton Washington Dc Downtown")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 160.62)
)

([HyattPlaceWashington] of alojamiento
    (nombre_alojamiento "Hyatt Place Washington DC/US Capitol")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "3*")
    (precio_alojamiento 125)
)

([HotelTabardInn] of alojamiento
    (nombre_alojamiento "Hotel Tabard Inn")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 180)
)

([ARCHotelWashington] of alojamiento
    (nombre_alojamiento "ARC Hotel, Washington DC, Series by Marriott")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "4*")
    (precio_alojamiento 189)
)

([TheRoyalSonestaWashington] of alojamiento
    (nombre_alojamiento "The Royal Sonesta Washington DC Capitol Hill")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 288.73)
)

([ConradWashingtonDC] of alojamiento
    (nombre_alojamiento "Conrad Washington DC")
    (capacidad_alojamiento 1)
    (comodidad_alojamiento "5*")
    (precio_alojamiento 409)
)
