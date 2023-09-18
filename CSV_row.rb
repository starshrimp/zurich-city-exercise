class CSV
  attr_reader :StichtagDatJahr,	:QuarSort, :QuarCd, :QuarLang, :KreisSort,	:WegOrtSort,	:WegOrtLang,	:WegBezirkSort,	:WegBezirkLang, :WegKtSort, :WegKtLang, :WegLandSort, :WegLandLang, :WegRegionSort, :WegRegionLang, :WegKontinentSort, :WegKontinentLang, :AnzWezuWir
  def initialize(StichtagDatJahr,	QuarSort, QuarCd, QuarLang, KreisSort, WegOrtSort, WegOrtLang, WegBezirkSort, WegBezirkLang, WegKtSort, WegKtLang, WegLandSort, WegLandLang, WegRegionSort, WegRegionLang, WegKontinentSort, WegKontinentLang, AnzWezuWir)
    @StichtagDatJahr = StichtagDatJahr
    @QuarSort = QuarSort
    @QuarCd = QuarCd
    @QuarLang = QuarLang
    @KreisSort = KreisSort
    @WegOrtSort = WegOrtSort
    @WegOrtLang = WegOrtLang
    @WegBezirkSort = WegBezirkSort
    @WegBezirkLang = WegBezirkLang
    @WegKtSort = WegKtSort
    @WegKtLang = WegKtLang
    @WegLandSort = WegLandSort
    @WegLandLang = WegLandLang
    @WegRegionSort = WegRegionSort
    @WegRegionLang = WegRegionLang
    @WegKontinentSort = WegKontinentSort
    @WegKontinentLang = WegKontinentLang
    @AnzWezuWir = AnzWezuWir
  end